"""#3F: shorter inverted #3E with smooth outer flanks around the metal-tip pockets.

Socket cutters are rigid translations of #3E. Exterior changes never scale the fit.
"""
from dataclasses import replace
from collections import Counter
from functools import lru_cache
import json
import struct
from math import cos, radians, sin

from build123d import Axis, Edge, Face, GeomType, Plane, Wire, extrude, export_stl
import right_angle as reference

COMPACT = 'right-angle-side-by-side-press-fit-compact'
E = replace(reference.E, length=13.6)
FITS = reference.FITS
PRINT_SETTINGS = reference.PRINT_SETTINGS
# Cubic Bezier controls in socket-local (depth, outward width) coordinates.
# The boundary starts outside the original body, beyond the 6 mm relief slots,
# and becomes tangent to a straight rear flank at the 11.2 mm blind stop.
TAPER_CONTROLS = ((6.6, 7.7), (8.4, 7.7), (9.4, 5.3), (11.2, 5.3))


def pod_roll(side):
    return reference.pod_roll(side, inverted=True)


def local_point(side, depth, y=0, z=0):
    point = reference.local_point(side, depth, y, z, inverted=True)
    return (point[0]+side*(E.length-reference.E.length)/2, *point[1:])


def prism(side, start, end, width, height, y=0):
    return reference.prism(side, start, end, width, height, y, inverted=True).translate(
        (side*(E.length-reference.E.length)/2, 0, 0))


@lru_cache(maxsize=1)
def untapered_blank():
    return reference.body_at_arm_length(reference.arm_length(), E.length).mirror(Plane.XY)


@lru_cache(maxsize=1)
def blank():
    part = untapered_blank()
    taper_cutters = []
    for side in (-1, 1):
        def p(depth, outward):
            return (-side*depth, side*outward, -15)
        a, b, c, d = (p(*control) for control in TAPER_CONTROLS)
        edges = [Edge.make_bezier(a, b, c, d), Edge.make_line(d, p(15, 5.3)),
                 Edge.make_line(p(15, 5.3), p(15, 20)),
                 Edge.make_line(p(15, 20), p(6.6, 20)), Edge.make_line(p(6.6, 20), a)]
        cutter = extrude(Face(Wire(edges)), amount=30, dir=(0, 0, 1))
        cutter = cutter.rotate(Axis.X, pod_roll(side)).translate(local_point(side, 0))
        taper_cutters.append(cutter)
        part = part-cutter
    # Round the new intersections before cutting the sockets, preserving their lips.
    edges = [edge for edge in part.edges()
             if any(edge.distance_to(cutter)<1e-6 for cutter in taper_cutters)]
    return part.fillet(E.edge_fillet, edges)


@lru_cache(maxsize=3)
def cutters(fit='standard'):
    return tuple(tuple(cutter.translate((side*(E.length-reference.E.length)/2, 0, 0))
                       for cutter in lane)
                 for side, lane in zip((-1, 1), reference.cutters(fit, inverted=True), strict=True))


@lru_cache(maxsize=3)
def build_holder(fit='standard'):
    part = blank()
    for lane in cutters(fit):
        for cutter in lane:
            part = part-cutter
    if not part.is_valid or len(part.solids()) != 1:
        raise ValueError(f'#3F {fit}: expected one valid solid')
    return part


def export_mesh(part, path):
    """Weld tessellation seams to the plate builder's 0.000001 mm precision.

    OpenCascade emits coincident vertices at four tangent taper/end fillet seams.
    Remove only triangles collapsed by welding; require a closed two-manifold
    before delivering the mesh. Binary STL rounding moves coordinates less than
    0.000001 mm per axis, well below the CAD tessellation tolerance.
    """
    export_stl(part, path, tolerance=.02, angular_tolerance=.1)
    data = path.read_bytes()
    original_count = struct.unpack_from('<I', data, 80)[0]
    triangles, edges = [], Counter()
    maximum_adjustment = 0.0
    for index in range(original_count):
        values = struct.unpack_from('<12fH', data, 84+50*index)
        points = [tuple(round(v, 6) for v in values[start:start+3]) for start in (3, 6, 9)]
        if len(set(points))<3:
            continue
        packed = struct.pack('<12fH', *values[:3], *(v for point in points for v in point), 0)
        exported = struct.unpack('<12fH', packed)[3:12]
        maximum_adjustment = max(maximum_adjustment, *(abs(a-b) for a, b in
            zip(values[3:12], exported, strict=True)))
        triangles.append(packed)
        for a, b in zip(points, points[1:]+points[:1], strict=True):
            edges[tuple(sorted((a, b)))] += 1
    assert maximum_adjustment < .000001
    assert triangles and all(count == 2 for count in edges.values()), '3F mesh must be closed and two-manifold'
    path.write_bytes(data[:80]+struct.pack('<I', len(triangles))+b''.join(triangles))
    report = dict(stl_closed_two_manifold=True, tessellated_triangles=original_count,
                  exported_triangles=len(triangles), collapsed_seam_triangles_removed=original_count-len(triangles),
                  coordinate_weld_decimal_places_mm=6, maximum_coordinate_adjustment_mm=maximum_adjustment)
    path.with_suffix('.mesh.json').write_text(json.dumps(report, indent=2)+'\n')
    return report


@lru_cache(maxsize=3)
def geometry_report(fit='standard'):
    body, lanes, part = blank(), cutters(fit), build_holder(fit)
    skins = [face for face in body.faces() if not(
        face.geom_type == GeomType.PLANE and abs(face.normal_at().X)>.9)]
    skin = min(cutter.distance_to(face) for lane in lanes for cutter in lane for face in skins)
    relief = min(cutter.distance_to(face) for lane in lanes for cutter in lane[-2:] for face in body.faces())
    ends, outside, elbows = [], [], []
    for side, lane in zip((-1, 1), lanes, strict=True):
        far = [face for face in body.faces()
               if face.geom_type == GeomType.PLANE and face.normal_at().X*side<-.999]
        ends.append(min(lane[0].distance_to(face) for face in far))
        outside.append(abs(body.intersect(prism(side, -40, -1e-5, 100, 100)).volume))
        elbows.append(body.distance_to(prism(side, -40, -.5, 100, 100)))
    prior_volume = reference.build_holder(fit, inverted=True).volume
    report = dict(valid=part.is_valid, solid_count=len(part.solids()), fit=fit,
        variant_id='3F', based_on='3E Inverted', inverted_bend=True,
        dimensions_mm=[round(v, 6) for v in part.bounding_box().size],
        volume_mm3=part.volume, reference_volume_mm3=prior_volume,
        volume_reduction_percent=100*(1-part.volume/prior_volume),
        length_reduction_percent=100*(1-E.length/reference.E.length),
        independent_removed_void_count=len((body-part).solids()),
        bend_degrees=E.bend, bend_axis='X', bend_center_y_mm=0,
        section_roll_degrees=[pod_roll(-1), pod_roll(1)],
        insertion_axis_directions=[(1, 0, 0), (-1, 0, 0)], insertion_axes_parallel=True,
        local_radial_thickness_mm=E.radial_thickness, enclosed_skin_wall_mm=skin,
        enclosed_relief_wall_mm=relief, enclosed_wall_mm=min(skin, relief),
        closed_end_wall_mm=min(ends), body_outside_mouth_planes_mm3=max(outside),
        silver_elbow_standoff_mm=min(elbows),
        inter_lane_void_separation_mm=min(a.distance_to(b) for a in lanes[0] for b in lanes[1]),
        taper_control_depth_outward_mm=TAPER_CONTROLS,
        taper_rear_outward_half_width_mm=5.3, taper_edge_fillet_mm=E.edge_fillet,
        taper_only_removed_material_mm3=untapered_blank().volume-body.volume)
    assert report['enclosed_wall_mm'] >= .8-1e-6, report
    assert report['closed_end_wall_mm'] >= 2.2-1e-6, report
    assert report['inter_lane_void_separation_mm'] >= 1, report
    assert report['body_outside_mouth_planes_mm3'] < 1e-6, report
    assert report['silver_elbow_standoff_mm'] >= .5-1e-6, report
    assert report['independent_removed_void_count'] == 6, report
    return report


def layout():
    angle = radians(E.print_angle)
    c, s = cos(angle), sin(angle)
    bounds = blank().rotate(Axis.Y, E.print_angle).bounding_box()
    transform = (c, 0, -s, 0, 1, 0, s, 0, c,
                 128-(bounds.min.X+bounds.max.X)/2, 128., -bounds.min.Z)
    return tuple(bounds.size), [transform], ((128., 128.),)


def write_manifest(concepts, output_dir):
    concept = concepts[0]
    fit = concept.spec.fit
    report = geometry_report(fit)
    dimensions, transforms, centers = layout()
    item = dict(original_id=3, variant_id='3F', slug=concept.spec.slug, title=concept.spec.title,
        fit=fit, based_on='3E Inverted', inverted_bend=True, dimensions_mm=concept.dimensions_mm,
        volume_mm3=concept.volume_mm3,
        measured_metal_width_height_length_mm=[E.metal_width, E.metal_height, E.metal_length],
        measured_base_width_height_length_mm=[E.base_width, E.base_height, E.base_length],
        plug_cavity_width_height_mm=E.metal_cavity, housing_cavity_width_height_mm=E.base_cavity,
        mouth_width_height_mm=FITS[fit], total_mouth_interference_mm=round(E.base_width-FITS[fit][0], 2),
        pocket_depth_mm=E.pocket_depth, housing_capture_mm=E.capture, tip_clearance_mm=E.tip_clearance,
        elbow_standoff_mm=.5, throat_depth_mm=E.throat, throat_transition_overlap_mm=E.transition_overlap,
        relief_slot_width_mm=E.relief_width, relief_slot_height_mm=E.relief_height,
        relief_slot_start_end_depth_mm=[E.throat, E.relief_end],
        bend_degrees=E.bend, bend_axis='X', section_roll_degrees=[pod_roll(-1), pod_roll(1)],
        bend_direction='center dips', insertion_axis_directions=[(1, 0, 0), (-1, 0, 0)],
        insertion_axes_parallel=True, centerline_radius_mm=E.center_radius,
        local_radial_thickness_mm=E.radial_thickness, lane_pitch_mm=E.lane_pitch,
        socket_axes_y_mm=[-E.lane_pitch/2, E.lane_pitch/2], geometry_minimums=report,
        print_rotation_y_degrees=E.print_angle, plate_center_xy_mm=centers[0],
        print_dimensions_mm=dimensions, print_transform=transforms[0],
        print_settings_overrides=PRINT_SETTINGS, supports_enabled=False,
        insertion_note=concept.spec.insertion_note, retention_note=concept.spec.retention_note,
        silver_housing_reference='Schematic only; unmeasured housing stays outside mouth plane.',
        step_path=str(concept.step_path.relative_to(output_dir)),
        stl_path=str(concept.stl_path.relative_to(output_dir)))
    (output_dir/'concepts.json').write_text(json.dumps([item], indent=2)+'\n')
    (output_dir/'concepts.md').write_text(
        f'# {concept.spec.title}\n\n13.6 × 27.2 × 9.198 mm; tapered outer flanks; inverted 15° center bend.\n\n'
        f'{concept.spec.insertion_note}\n\n{concept.spec.retention_note}\n')
    (output_dir/'geometry_validation.json').write_text(json.dumps(report, indent=2)+'\n')
    (output_dir/'fit_validation.json').write_text(json.dumps([geometry_report(f) for f in FITS], indent=2)+'\n')

"""Independent, measured #3E envelope. No changes to the original #3 fit globals."""
from dataclasses import dataclass
from functools import lru_cache
import json
from math import cos, radians, sin
from pathlib import Path

from build123d import Axis, Box, Edge, Face, GeomType, Plane, RectangleRounded, Wire, extrude

HOLDER = 'right-angle-side-by-side-press-fit'
INVERTED = 'right-angle-side-by-side-press-fit-inverted'
SAMPLES = 'right-angle-fit-samples'
COMBINED = 'right-angle-holder-and-samples'
FITS = {'gentle': (9.75, 4.55), 'standard': (9.60, 4.40), 'firm': (9.45, 4.25)}
PRINT_SETTINGS = dict(sparse_infill_density='20%', sparse_infill_pattern='gyroid',
                      skeleton_infill_density='20%', skin_infill_density='20%',
                      wall_loops='3', top_shell_layers='5', bottom_shell_layers='5',
                      top_shell_thickness='1', bottom_shell_thickness='1')


@dataclass(frozen=True)
class RightAngleEnvelope:
    metal_width: float = 8.1
    metal_height: float = 2.3
    metal_length: float = 8.4
    base_width: float = 9.9
    base_height: float = 4.7
    base_length: float = 2.5
    capture: float = 2.0
    tip_clearance: float = .8
    metal_cavity: tuple = (8.25, 2.45)
    base_cavity: tuple = (10.10, 4.90)
    throat: float = .8
    transition_overlap: float = .15
    relief_width: float = .8
    relief_height: float = 5.1
    relief_end: float = 6.0
    length: float = 14.6
    width: float = 27.2
    sample_width: float = 14.4
    radial_thickness: float = 7.6
    lane_pitch: float = 12.0
    bend: float = 15.0
    center_radius: float = 6.075
    corner_radius: float = .8
    edge_fillet: float = .4
    print_angle: float = -90.0

    @property
    def pocket_depth(self):
        return self.capture + self.metal_length + self.tip_clearance


E = RightAngleEnvelope()
S, C = sin(radians(E.bend/2)), cos(radians(E.bend/2))


def body_at_arm_length(arm):
    """YZ straight–arc–straight section, extruded along the parallel socket axes (X)."""
    radius = E.center_radius
    half = E.radial_thickness/2
    upper = (0, (radius+half)*S, (radius+half)*C-radius)
    lower = (0, (radius-half)*S, (radius-half)*C-radius)
    upper_end = (0, upper[1]+arm*C, upper[2]-arm*S)
    lower_end = (0, lower[1]+arm*C, lower[2]-arm*S)
    mirror = lambda p: (p[0], -p[1], p[2])
    outline = Wire([
        Edge.make_line(mirror(upper_end), mirror(upper)),
        Edge.make_three_point_arc(mirror(upper), (0, 0, half), upper),
        Edge.make_line(upper, upper_end),
        Edge.make_line(upper_end, lower_end),
        Edge.make_line(lower_end, lower),
        Edge.make_three_point_arc(lower, (0, 0, -half), mirror(lower)),
        Edge.make_line(mirror(lower), mirror(lower_end)),
        Edge.make_line(mirror(lower_end), mirror(upper_end)),
    ])
    part = extrude(Face(outline), amount=E.length, dir=(1, 0, 0)).translate((-E.length/2, 0, 0))
    part = part.fillet(E.corner_radius, [e for e in part.edges() if abs(e.length-E.radial_thickness)<1e-6])
    return part.fillet(E.edge_fillet, part.edges())


def radius():
    return E.center_radius


@lru_cache(maxsize=1)
def arm_length():
    result = (E.width/2-(radius()+E.radial_thickness/2)*S)/C
    for _ in range(8):
        error = E.width-body_at_arm_length(result).bounding_box().size.Y
        if abs(error)<1e-6:
            return result
        result += error/(2*C)
    raise ValueError('Cannot solve #3E finished width')


@lru_cache(maxsize=4)
def blank(sample=False, inverted=False):
    if inverted:
        return blank(sample).mirror(Plane.XY)
    if sample:
        part = extrude(RectangleRounded(E.length, E.sample_width, E.corner_radius),
                       amount=E.radial_thickness).translate((0, 0, -E.radial_thickness/2))
        return part.fillet(E.edge_fillet, part.edges())
    return body_at_arm_length(arm_length())


def lane_height():
    return radius()*(C-1)-((E.lane_pitch/2-radius()*S)/C)*S


def pod_roll(side, sample=False, inverted=False):
    return 0.0 if sample else (-1 if inverted else 1)*-side*E.bend/2


def local_point(side, depth, y=0, z=0, sample=False, inverted=False):
    if sample:
        return (side*(E.length/2-depth), y, z)
    direction = -1 if inverted else 1
    return (side*(E.length/2-depth), side*E.lane_pitch/2+y*C+direction*side*z*S,
            direction*(lane_height()-side*y*S)+z*C)


def prism(side, start, end, width, height, y=0, sample=False, inverted=False):
    return (Box(end-start, width, height).translate((-side*(start+end)/2, y, 0))
            .rotate(Axis.X, pod_roll(side, sample, inverted))
            .translate(local_point(side, 0, sample=sample, inverted=inverted)))


@lru_cache(maxsize=12)
def cutters(fit='standard', sample=False, inverted=False):
    mouth = FITS[fit]
    lanes = []
    for side in ((-1,) if sample else (-1, 1)):
        lane = [prism(side, E.capture-E.transition_overlap, E.pocket_depth, *E.metal_cavity, sample=sample, inverted=inverted),
                prism(side, -.3, E.throat, *mouth, sample=sample, inverted=inverted),
                prism(side, E.throat-E.transition_overlap, E.capture, *E.base_cavity, sample=sample, inverted=inverted)]
        lane += [prism(side, E.throat, E.relief_end, E.relief_width, E.relief_height,
                       sign*(E.base_cavity[0]/2+.95), sample, inverted) for sign in (-1, 1)]
        lanes.append(tuple(lane))
    return tuple(lanes)


@lru_cache(maxsize=12)
def build_holder(fit='standard', sample=False, inverted=False):
    if inverted:
        return build_holder(fit, sample).mirror(Plane.XY)
    part = blank(sample)
    for lane in cutters(fit, sample):
        for cutter in lane:
            part = part-cutter
    if not part.is_valid or len(part.solids()) != 1:
        raise ValueError(f'#3E {fit}: expected one valid solid')
    return part


@lru_cache(maxsize=12)
def geometry_report(fit='standard', sample=False, inverted=False):
    body, lanes = blank(sample, inverted), cutters(fit, sample, inverted)
    faces = body.faces()
    # Ignore the two open mouth planes; include flat pod skins, central arcs,
    # side walls and edge rounds when measuring every other enclosed wall.
    skins = [f for f in faces if not(f.geom_type == GeomType.PLANE and abs(f.normal_at().X) > .9)]
    skin = min(cutter.distance_to(face) for lane in lanes for cutter in lane for face in skins)
    relief = min(cutter.distance_to(face) for lane in lanes for cutter in lane[-2:] for face in faces)
    ends, outside, elbow_clearances = [], [], []
    for side, lane in zip((-1,) if sample else (-1, 1), lanes, strict=True):
        far = [f for f in faces if f.geom_type == GeomType.PLANE and f.normal_at().X*side < -.9]
        assert len(far) == 1
        ends.append(lane[0].distance_to(far[0]))
        # Exact B-rep half-space tests, rather than vertex-only bounds on curved faces.
        overlap = body.intersect(prism(side, -40, -1e-5, 100, 100, sample=sample, inverted=inverted))
        outside.append(abs(overlap.volume))
        elbow_clearances.append(body.distance_to(prism(side, -40, -.5, 100, 100, sample=sample, inverted=inverted)))
    part = build_holder(fit, sample, inverted)
    removed = body-part
    report = dict(valid=part.is_valid, solid_count=len(part.solids()), fit=fit, sample=sample, inverted_bend=inverted,
                  dimensions_mm=[round(v, 6) for v in part.bounding_box().size],
                  independent_removed_void_count=len(removed.solids()), bend_degrees=0 if sample else E.bend,
                  bend_axis=None if sample else 'X', bend_center_y_mm=None if sample else 0,
                  section_roll_degrees=[0] if sample else [pod_roll(-1, inverted=inverted), pod_roll(1, inverted=inverted)],
                  insertion_axis_directions=[(1,0,0)] if sample else [(1,0,0),(-1,0,0)],
                  insertion_axes_parallel=True, local_radial_thickness_mm=E.radial_thickness,
                  enclosed_skin_wall_mm=skin,
                  enclosed_relief_wall_mm=relief, enclosed_wall_mm=min(skin, relief),
                  closed_end_wall_mm=min(ends), body_outside_mouth_planes_mm3=max(outside),
                  silver_elbow_standoff_mm=min(elbow_clearances))
    if not sample:
        report['inter_lane_void_separation_mm'] = min(a.distance_to(b) for a in lanes[0] for b in lanes[1])
        assert report['inter_lane_void_separation_mm'] >= 1
    assert report['enclosed_wall_mm'] >= .8-1e-6, report
    assert report['closed_end_wall_mm'] >= 2.2-1e-6, report
    assert report['body_outside_mouth_planes_mm3'] < 1e-6, report
    assert report['silver_elbow_standoff_mm'] >= .5-1e-6, report
    assert report['independent_removed_void_count'] == (3 if sample else 6), report
    return report


def layout(variant):
    sample = variant == SAMPLES
    inverted = variant == INVERTED
    angle = radians(E.print_angle)
    c, s = cos(angle), sin(angle)
    bounds = blank(sample, inverted).rotate(Axis.Y, E.print_angle).bounding_box()
    dimensions = tuple(bounds.size)
    step = dimensions[0]+12
    centers = tuple((128+i*step, 128.) for i in (-1, 0, 1)) if sample else ((128., 128.),)
    transforms = [(c, 0, -s, 0, 1, 0, s, 0, c,
                   x-(bounds.min.X+bounds.max.X)/2, y, -bounds.min.Z) for x, y in centers]
    return dimensions, transforms, centers


def combined_layout():
    """One corrected standard holder, then gentle/standard/firm samples; 12 mm gaps."""
    entries = [(HOLDER, 'standard', 0)] + [(SAMPLES, fit, i) for i, fit in enumerate(FITS)]
    widths = [layout(variant)[0][0] for variant, _, _ in entries]
    left = 128-(sum(widths)+12*(len(entries)-1))/2
    result = []
    for (variant, fit, index), width in zip(entries, widths, strict=True):
        dimensions, transforms, centers = layout(variant)
        center = (left+width/2, 128.)
        transform = list(transforms[index])
        transform[9] += center[0]-centers[index][0]
        result.append(dict(variant=variant, fit=fit, sample=variant==SAMPLES,
                           dimensions=dimensions, center=center, transform=tuple(transform)))
        left += width+12
    return result


def write_manifest(concepts, output_dir: Path, variant):
    sample = variant == SAMPLES
    inverted = variant == INVERTED
    dimensions, transforms, centers = layout(variant)
    payload, reports = [], []
    for concept, transform, center in zip(concepts, transforms, centers, strict=True):
        spec = concept.spec
        report = geometry_report(spec.fit, sample, inverted)
        reports.append(report)
        payload.append(dict(original_id=3, variant_id='3E', slug=spec.slug, title=spec.title,
            fit=spec.fit, sample=sample, inverted_bend=inverted, dimensions_mm=concept.dimensions_mm,
            volume_mm3=round(concept.volume_mm3, 3), measured_metal_width_height_length_mm=[8.1, 2.3, 8.4],
            measured_base_width_height_length_mm=[9.9, 4.7, 2.5],
            plug_cavity_width_height_mm=E.metal_cavity, housing_cavity_width_height_mm=E.base_cavity,
            mouth_width_height_mm=FITS[spec.fit], total_mouth_interference_mm=round(E.base_width-FITS[spec.fit][0], 2),
            pocket_depth_mm=E.pocket_depth, housing_capture_mm=E.capture, tip_clearance_mm=E.tip_clearance,
            elbow_standoff_mm=.5, throat_depth_mm=E.throat, throat_transition_overlap_mm=E.transition_overlap,
            relief_slot_width_mm=E.relief_width, relief_slot_height_mm=E.relief_height,
            relief_slot_start_end_depth_mm=[E.throat, E.relief_end],
            bend_degrees=0 if sample else E.bend, bend_axis=None if sample else 'X',
            bend_center_y_mm=None if sample else 0,
            section_roll_degrees=[0] if sample else [pod_roll(-1, inverted=inverted), pod_roll(1, inverted=inverted)],
            bend_direction='straight' if sample else ('center dips' if inverted else 'center rises'),
            insertion_axis_directions=[(1,0,0)] if sample else [(1,0,0),(-1,0,0)],
            insertion_axes_parallel=True, centerline_radius_mm=None if sample else radius(),
            tangent_arm_length_mm=None if sample else arm_length(),
            local_radial_thickness_mm=E.radial_thickness, lane_pitch_mm=0 if sample else E.lane_pitch,
            socket_axes_y_mm=[0] if sample else [-E.lane_pitch/2, E.lane_pitch/2],
            corner_radius_mm=E.corner_radius, edge_fillet_mm=E.edge_fillet,
            geometry_minimums=report, print_rotation_y_degrees=E.print_angle,
            plate_center_xy_mm=center, print_dimensions_mm=dimensions, print_transform=transform,
            print_settings_overrides=PRINT_SETTINGS, supports_enabled=False,
            insertion_note=spec.insertion_note, retention_note=spec.retention_note,
            silver_housing_reference='Schematic only; unmeasured housing stays outside mouth plane.',
            step_path=str(concept.step_path.relative_to(output_dir)),
            stl_path=str(concept.stl_path.relative_to(output_dir))))
    (output_dir/'concepts.json').write_text(json.dumps(payload, indent=2)+'\n')
    (output_dir/'geometry_validation.json').write_text(json.dumps(reports if sample else reports[0], indent=2)+'\n')
    if not sample:
        (output_dir/'fit_validation.json').write_text(json.dumps(
            [geometry_report(profile, inverted=inverted) for profile in FITS],indent=2)+'\n')
    lines = ['# #3E right-angle plug fit samples' if sample else
             '# #3E '+('Inverted ' if inverted else '')+'15° right-angle side-by-side press-fit', '',
             'Measured plug: 8.10 × 2.30 × 8.40 mm metal; 9.90 × 4.70 × 2.50 mm black base.',
             '2 mm base capture; 0.5 mm silver-elbow standoff; 11.2 mm blind pocket.',
             'Straight single-socket fit blocks.' if sample else
             ('15° bend between lanes about X: pod rolls −7.5° / +7.5°; center dips with the same CAD top up. ' if inverted else
              '15° bend between lanes about X: pod rolls +7.5° / −7.5°; center rises. ')+
             'Insertion axes remain parallel. Mirror cable tails outward.',
             'Print on negative-X end, −90° Y; A1 / PLA / 0.4 / 0.20 mm / Textured PEI.',
             '20% gyroid, 3 walls, 5 top/bottom layers, 1 mm shells, no supports.',
             'Samples left to right: gentle, standard, firm; 12 mm gaps.' if sample else 'One centered holder.',
             'Test gentle first. Retention and durability require physical testing; stop if force or cracking occurs.', '']
    for item in payload:
        lines += [f"## {item['title']}", '', f"Mouth: {item['mouth_width_height_mm']} mm; dimensions: {item['dimensions_mm']} mm.",
                  f"STEP: `{item['step_path']}`; STL: `{item['stl_path']}`.", '']
    (output_dir/'concepts.md').write_text('\n'.join(lines)+'\n')

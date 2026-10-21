from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from functools import lru_cache
from math import cos, radians, sin
from pathlib import Path

from build123d import Axis, Box, Edge, Face, GeomType, Plane, Polygon, RectangleRounded, Wire, export_step, export_stl, extrude


@dataclass(frozen=True)
class UsbCEnvelope:
    plug_length: float = 6.8
    plug_width: float = 8.5
    plug_thickness: float = 2.8
    housing_length: float = 8.8
    housing_width: float = 12.0
    housing_thickness: float = 6.4
    tip_clearance: float = 0.8


@dataclass(frozen=True)
class FormConfig:
    length: float = 24.0
    width: float = 17.0
    thickness: float = 8.4
    corner_radius: float = 1.6
    edge_fillet: float = 0.4


@dataclass(frozen=True)
class ConceptSpec:
    original_id: int
    slug: str
    title: str
    retention_style: str
    plug_clearance: float
    housing_clearance: float
    insertion_note: str
    retention_note: str
    fit: str = "standard"
    inverted_bend: bool = False


@dataclass(frozen=True)
class GeneratedConcept:
    spec: ConceptSpec
    dimensions_mm: tuple[float, float, float]
    volume_mm3: float
    step_path: Path
    stl_path: Path


USB_C = UsbCEnvelope()
BODY = FormConfig()
HOUSING_CAPTURE = 3.2
THROAT_LENGTH = 0.8
PLUG_START = HOUSING_CAPTURE - 0.15
POCKET_DEPTH = HOUSING_CAPTURE + USB_C.plug_length + USB_C.tip_clearance
CENTER_DIVIDER = BODY.length - 2 * POCKET_DEPTH
MIN_WALL = 0.8
RELIEF_WIDTH = 0.8
RELIEF_END = 6.0
SIDE_SEATING_TRAVEL = 0.8
# The last 0.8 mm of the seated metal tip sits behind a closed side wall.
SIDE_TIP_CHANNEL_END = HOUSING_CAPTURE + USB_C.plug_length - SIDE_SEATING_TRAVEL
RIDGE_HEIGHT = 0.2
RIDGE_BASE = 0.8
RIDGE_SPAN = 8.0
RIDGE_CENTERS = (1.3, 2.5)
PLATE_CENTERS = ((92.0, 128.0), (128.0, 128.0), (164.0, 128.0))
VARIANTS = ("compact", "curved-press-fit", "side-by-side-press-fit", "curved-side-by-side-press-fit",
            "right-angle-side-by-side-press-fit", "right-angle-fit-samples",
            "right-angle-side-by-side-press-fit-inverted")
BEND_DEGREES = 15.0
HALF_BEND = radians(BEND_DEGREES / 2)
CURVED_END_RADIUS = 0.8
SIDE_BY_SIDE_BODY = FormConfig(length=13, width=30, thickness=8.4, corner_radius=0.8, edge_fillet=0.4)
LANE_PITCH = 13.0
CURVED_SIDE_BY_SIDE_BODY = FormConfig(length=15.2, width=30, thickness=9.4, corner_radius=0.8, edge_fillet=0.4)
CURVED_SIDE_BY_SIDE_PRINT_ANGLE = -82.5


def build_concepts(variant: str = "compact", fit: str = "standard") -> list[ConceptSpec]:
    """The three requested revisions; IDs refer to the original nine-part plate."""
    if variant.startswith("right-angle-"):
        from right_angle import FITS, SAMPLES, HOLDER, INVERTED
        if fit not in FITS:
            raise ValueError(f"Unknown #3E fit: {fit}")
        if variant not in (HOLDER, SAMPLES, INVERTED):
            raise ValueError(f"Unknown variant: {variant}")
        sample = variant == SAMPLES
        inverted = variant == INVERTED
        return [ConceptSpec(3, f"03e_{'fit_sample' if sample else ('inverted_right_angle_side_by_side' if inverted else 'right_angle_side_by_side')}_{profile}",
                            f"#3E {profile} fit sample" if sample else
                            f"#3E {'Inverted ' if inverted else ''}15° right-angle side-by-side press-fit ({profile})",
                            "right_angle_sample" if sample else "right_angle_holder", .15, .20,
                            "Straight single-socket block: push along its axis; test gentle first." if sample else
                            "Push along the parallel socket axes. The inverted 15° bend is between the lanes; "
                            "pod rolls are −7.5° / +7.5° and the center dips with the same CAD top up. "
                            "Mirror the right-angle plugs so the cable tails point outward. "
                            "Capture 2 mm of black base, leaving 0.5 mm to the silver elbow." if inverted else
                            "Push along the parallel socket axes. The 15° bend is between the lanes, "
                            "with each pod rolled 7.5° about X. Wear the concave face toward the wrist; "
                            "mirror the right-angle plugs so the cable tails point outward. "
                            "Capture 2 mm of black base, leaving 0.5 mm to the silver elbow.",
                            "Measured right-angle plug envelope with a trial press-fit throat. "
                            "Test gentle first; stop if insertion requires force or causes cracking.", profile, inverted)
                for profile in (FITS if sample else (fit,))]
    if variant == "curved-side-by-side-press-fit":
        return [ConceptSpec(3, "03d_curved_side_by_side_press_fit_15deg",
                            "#3D 15° curved side-by-side press-fit", "curved_side_by_side_press_fit", 0.15, 0.20,
                            "Wear the concave underside toward the wrist. Push each plug straight along its "
                            "own 7.5° tilted axis; the two offset sockets open from opposite ends.",
                            "Winning #3 sockets, mouths, throats and relief slots rigidly tilted 7.5° each, "
                            "in lanes 13 mm apart inside a body with curved wrist and outer faces.")]
    if variant == "side-by-side-press-fit":
        return [ConceptSpec(3, "03c_side_by_side_press_fit", "#3C Side-by-side press-fit",
                            "side_by_side_press_fit", 0.15, 0.20,
                            "Push one plug into each opposite end, along the two parallel socket axes. "
                            "The plugs' wide faces stay parallel to the top; cables exit opposite ends.",
                            "Winning #3 sockets, mouths, nominal throats and relief slots translated "
                            "into two lanes 13 mm apart, with independent blind stops.")]
    if variant == "curved-press-fit":
        return [ConceptSpec(3, "03b_curved_press_fit_15deg", "#3B 15° curved press-fit",
                            "curved_press_fit", 0.15, 0.20,
                            "Push each plug straight along its tilted socket axis toward the center. "
                            "Wear with the concave underside toward the wrist.",
                            "Winning #3 socket, mouth, throat and relief-slot dimensions; "
                            "two straight sockets tilted 7.5° each, joined by a tangent center arc.")]
    if variant != "compact":
        raise ValueError(f"Unknown variant: {variant}")
    return [
        ConceptSpec(3, "03_compact_press_fit", "#3 Compact press-fit", "press_fit", 0.15, 0.20,
                    "Push plugs into opposite ends, metal tips toward the center. Only the front "
                    "3.2 mm of each plastic housing is captured. Test PLA flex without forcing it.",
                    "Original #3 cavity/mouth widths and heights, a shorter 0.8 mm throat, "
                    "and 0.8 mm flanking relief slots."),
        ConceptSpec(5, "05_compact_side_entry", "#5 Compact side-entry", "side_entry", 0.20, 0.25,
                    "Slide the housing and metal tip sideways through the stepped opening, "
                    "then move the plug 0.8 mm inward. Reverse that move before sliding out.",
                    "Mirrored side entrances with lead-ins, localized rounded housing detents "
                    "(6.25 mm gap), and a closed side wall capturing the last 0.8 mm of the tip."),
        ConceptSpec(9, "09_compact_ribbed_push_in", "#9 Compact ribbed push-in", "push_socket", 0.25, 0.35,
                    "Push each plug into an end. Rounded ribs grip the plastic housing; "
                    "most of the housing remains exposed.",
                    "Two opposing rib pairs per end project 0.2 mm, span 8 mm, have 0.8 mm "
                    "axial bases, and sit 1.3/2.5 mm inside the opening. Metal-tip pockets stay smooth."),
    ]


def mirrored_x_span(body_length: float, side: int, start: float, end: float) -> tuple[float, float]:
    if side == -1:
        return -body_length / 2 + start, -body_length / 2 + end
    return body_length / 2 - end, body_length / 2 - start


def depth_x(side: int, depth: float) -> float:
    return side * (BODY.length / 2 - depth)


def x_prism(side: int, start: float, end: float, width: float, height: float,
            center_y: float = 0.0, center_z: float = 0.0):
    x0, x1 = mirrored_x_span(BODY.length, side, start, end)
    return Box(abs(x1 - x0), width, height).translate(((x0 + x1) / 2, center_y, center_z))


def make_body(config: FormConfig = BODY):
    body = extrude(RectangleRounded(config.length, config.width, config.corner_radius),
                   amount=config.thickness).translate((0, 0, -config.thickness / 2))
    return body.fillet(config.edge_fillet, body.edges())


def side_channel(side: int, start: float, end: float, inner_reach: float,
                 height: float, lead_in: bool = False):
    """Swept lateral opening; the outer ramp still leaves >=0.8 mm roof/floor."""
    direction = -side
    outer, lead_start = BODY.width / 2 + 0.3, BODY.width / 2 - 0.6
    extra = 0.1 if lead_in else 0.0
    points = [(direction * inner_reach, -height / 2),
              (direction * lead_start, -height / 2),
              (direction * outer, -height / 2 - extra),
              (direction * outer, height / 2 + extra),
              (direction * lead_start, height / 2),
              (direction * inner_reach, height / 2)]
    profile = Plane.YZ * Polygon(*points, align=None)
    x0, x1 = mirrored_x_span(BODY.length, side, start, end)
    return extrude(profile, amount=abs(x1 - x0), dir=(1, 0, 0)).translate((x0, 0, 0))


def cavity_segments(spec: ConceptSpec, sides=(-1, 1)) -> list:
    pw, ph = USB_C.plug_width + spec.plug_clearance, USB_C.plug_thickness + spec.plug_clearance
    hw, hh = USB_C.housing_width + spec.housing_clearance, USB_C.housing_thickness + spec.housing_clearance
    cutters = []
    for side in sides:
        cutters.append(x_prism(side, PLUG_START, POCKET_DEPTH, pw, ph))
        if spec.retention_style == "press_fit":
            cutters += [x_prism(side, -0.3, THROAT_LENGTH, hw - 0.95, hh - 0.95),
                        x_prism(side, THROAT_LENGTH - 0.15, HOUSING_CAPTURE, hw, hh)]
            for direction in (-1, 1):
                cutters.append(x_prism(side, THROAT_LENGTH, RELIEF_END, RELIEF_WIDTH,
                                       BODY.thickness - 2 * MIN_WALL,
                                       center_y=direction * (hw / 2 + 0.95)))
        else:
            # Exposed housings need a housing-sized end opening, not the old cable-sized end cap.
            cutters.append(x_prism(side, -0.3, HOUSING_CAPTURE, hw, hh))
        if spec.retention_style == "side_entry":
            cutters += [side_channel(side, -0.3, HOUSING_CAPTURE, hw / 2 - 0.3, hh, True),
                        side_channel(side, PLUG_START, SIDE_TIP_CHANNEL_END, pw / 2 - 0.3, ph)]
    return cutters


def housing_retainers(spec: ConceptSpec) -> list:
    """Each rounded rib projects 0.2 mm and has another 0.2 mm embedded in its wall."""
    hw = USB_C.housing_width + spec.housing_clearance
    hh = USB_C.housing_thickness + spec.housing_clearance
    ribs = []
    for side in (-1, 1):
        for z_sign in (-1, 1):
            z = z_sign * hh / 2
            if spec.retention_style == "push_socket":
                for depth in RIDGE_CENTERS:
                    # Vertical side-wall ribs grow from the floor. An isolated rib on
                    # the underside of the roof would start in mid-air when printed flat.
                    profile = RectangleRounded(RIDGE_BASE, 2 * RIDGE_HEIGHT, 0.15)
                    ribs.append(extrude(profile, amount=RIDGE_SPAN).translate(
                        (depth_x(side, depth), z_sign * hw / 2, -RIDGE_SPAN / 2)))
            elif spec.retention_style == "side_entry":
                profile = Plane.YZ * RectangleRounded(RIDGE_BASE, 2 * RIDGE_HEIGHT, 0.15)
                y = -side * ((USB_C.housing_width + spec.housing_clearance) / 2 + 0.8)
                # Anchor the upper detent in the solid shoulder as well as its roof.
                # This avoids a disconnected first extrusion beneath the roof.
                x0, x1 = mirrored_x_span(BODY.length, side, 0.8, 3.6)
                ribs.append(extrude(profile, amount=x1-x0, dir=(1, 0, 0)).translate((x0, y, z)))
    return ribs


def build_part(spec: ConceptSpec):
    if spec.retention_style in ("right_angle_holder", "right_angle_sample"):
        from right_angle import build_holder, geometry_report
        sample = spec.retention_style == "right_angle_sample"
        geometry_report(spec.fit, sample, spec.inverted_bend)
        return build_holder(spec.fit, sample, spec.inverted_bend)
    if spec.retention_style == "curved_side_by_side_press_fit":
        part = make_curved_side_by_side_body()
        for lane in curved_side_by_side_cutters():
            for cutter in lane:
                part = part - cutter
        if not part.is_valid or len(part.solids()) != 1:
            raise ValueError("Curved side-by-side press-fit: expected one valid solid")
        minimums = curved_side_by_side_minimums()
        if (minimums['inter_lane_void_separation_mm'] < 1.0
                or minimums['enclosed_wall_mm'] < MIN_WALL - 1e-6
                or minimums['closed_end_wall_mm'] < 2.2 - 1e-6):
            raise ValueError(f"Curved side-by-side press-fit: insufficient material: {minimums}")
        return part
    if spec.retention_style == "side_by_side_press_fit":
        part = make_side_by_side_body()
        for lane in side_by_side_cutters():
            for cutter in lane:
                part = part - cutter
        if not part.is_valid or len(part.solids()) != 1:
            raise ValueError("Side-by-side press-fit: expected one valid solid")
        separation, wall = side_by_side_minimums()
        if separation < 1.0 or wall < MIN_WALL - 1e-6:
            raise ValueError("Side-by-side press-fit: insufficient lane separation or enclosed wall")
        return part
    if spec.retention_style == "curved_press_fit":
        part = make_curved_body()
        reference = build_concepts()[0]
        for side in (-1, 1):
            for cutter in cavity_segments(reference, (side,)):
                part = part - curved_socket_transform(cutter, side)
        if not part.is_valid or len(part.solids()) != 1:
            raise ValueError("Curved press-fit: expected one valid solid")
        if curved_divider_thickness() < 1.0 or curved_minimum_enclosed_wall() < MIN_WALL - 1e-6:
            raise ValueError("Curved press-fit: insufficient divider or enclosed relief-slot wall")
        return part
    part = make_body()
    for cutter in cavity_segments(spec):
        part = part - cutter
    for rib in housing_retainers(spec):
        part = part + rib
    if not part.is_valid or len(part.solids()) != 1:
        raise ValueError(f"{spec.slug}: expected one valid solid")
    return part


def curved_body_at_radius(radius: float):
    """Exact tangent straight–arc–straight XZ outline, extruded across the width."""
    half = BODY.thickness / 2
    c, s = cos(HALF_BEND), sin(HALF_BEND)
    upper = ((radius + half) * s, 0, (radius + half) * c - radius)
    lower = ((radius - half) * s, 0, (radius - half) * c - radius)
    upper_end = (upper[0] + POCKET_DEPTH * c, 0, upper[2] - POCKET_DEPTH * s)
    lower_end = (lower[0] + POCKET_DEPTH * c, 0, lower[2] - POCKET_DEPTH * s)

    def mirror(p):
        return (-p[0], p[1], p[2])

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
    body = extrude(Face(outline), amount=BODY.width, dir=(0, 1, 0)).translate((0, -BODY.width/2, 0))
    # Round the four end corners along each socket's local thickness direction.
    end_edges = [e for e in body.edges() if abs(e.length - BODY.thickness) < 1e-6]
    # A 1.6 mm end corner leaves only 0.63 mm beside the unchanged relief slot.
    # Use a smaller exterior radius here to retain the required 0.8 mm skin.
    body = body.fillet(CURVED_END_RADIUS, end_edges)
    return body.fillet(BODY.edge_fillet, body.edges())


@lru_cache(maxsize=1)
def curved_radius() -> float:
    """Solve finished, rounded outside length; never scale the proven sockets."""
    c, s = cos(HALF_BEND), sin(HALF_BEND)
    radius = (BODY.length - 2 * POCKET_DEPTH * c - BODY.thickness * s) / (2 * s)
    for _ in range(8):
        actual = curved_body_at_radius(radius).bounding_box().size.X
        error = BODY.length - actual
        if abs(error) < 1e-6:
            return radius
        radius += error / (2 * s)
    raise ValueError("Unable to solve curved body's 24 mm finished length")


@lru_cache(maxsize=1)
def make_curved_body():
    return curved_body_at_radius(curved_radius())


def curved_local_point(side: int, depth: float, y: float = 0, z: float = 0):
    """Map socket-local depth/width/height coordinates into the finished holder."""
    radius = curved_radius()
    c, s = cos(HALF_BEND), sin(HALF_BEND)
    mouth_x = radius * s + POCKET_DEPTH * c
    mouth_z = radius * c - radius - POCKET_DEPTH * s
    return (side * (mouth_x - depth * c + z * s), y, mouth_z + depth * s + z * c)


def curved_socket_transform(shape, side: int):
    return (shape.translate((-side * BODY.length / 2, 0, 0))
            .rotate(Axis.Y, side * BEND_DEGREES / 2)
            .translate(curved_local_point(side, 0)))


@lru_cache(maxsize=1)
def make_side_by_side_body():
    return make_body(SIDE_BY_SIDE_BODY)


def side_by_side_socket_transform(shape, side: int):
    return shape.translate((side*(SIDE_BY_SIDE_BODY.length-BODY.length)/2, side*LANE_PITCH/2, 0))


def side_by_side_local_point(side: int, depth: float, y: float = 0, z: float = 0):
    return (side*(SIDE_BY_SIDE_BODY.length/2-depth), side*LANE_PITCH/2+y, z)


@lru_cache(maxsize=1)
def side_by_side_cutters():
    reference = build_concepts()[0]
    return tuple(tuple(side_by_side_socket_transform(cutter, side)
                       for cutter in cavity_segments(reference, (side,))) for side in (-1, 1))


@lru_cache(maxsize=1)
def side_by_side_minimums():
    """Exact inter-lane void separation and enclosed relief-to-exterior wall thickness."""
    lanes = side_by_side_cutters()
    separation = min(a.distance_to(b) for a in lanes[0] for b in lanes[1])
    faces = make_side_by_side_body().faces()
    wall = min(relief.distance_to(face) for lane in lanes for relief in lane[-2:] for face in faces)
    return separation, wall


def curved_side_by_side_body_at_radius(radius: float):
    """Annular XZ section: concave wrist face, convex outer face, flat radial ends."""
    config = CURVED_SIDE_BY_SIDE_BODY
    half, s, c = config.thickness/2, sin(HALF_BEND), cos(HALF_BEND)
    upper = ((radius+half)*s, 0, (radius+half)*c-radius)
    lower = ((radius-half)*s, 0, (radius-half)*c-radius)
    mirror = lambda p: (-p[0], p[1], p[2])
    outline = Wire([
        Edge.make_three_point_arc(mirror(upper), (0, 0, half), upper),
        Edge.make_line(upper, lower),
        Edge.make_three_point_arc(lower, (0, 0, -half), mirror(lower)),
        Edge.make_line(mirror(lower), mirror(upper)),
    ])
    body = extrude(Face(outline), amount=config.width, dir=(0, 1, 0)).translate((0, -config.width/2, 0))
    body = body.fillet(config.corner_radius, [e for e in body.edges() if abs(e.length-config.thickness) < 1e-6])
    return body.fillet(config.edge_fillet, body.edges())


@lru_cache(maxsize=1)
def curved_side_by_side_radius() -> float:
    radius = 53.901
    for _ in range(8):
        error = CURVED_SIDE_BY_SIDE_BODY.length-curved_side_by_side_body_at_radius(radius).bounding_box().size.X
        if abs(error) < 1e-6:
            return radius
        radius += error/(2*sin(HALF_BEND))
    raise ValueError("Unable to solve #3D's 15.2 mm finished length")


@lru_cache(maxsize=1)
def make_curved_side_by_side_body():
    return curved_side_by_side_body_at_radius(curved_side_by_side_radius())


def curved_side_by_side_local_point(side: int, depth: float, y: float = 0, z: float = 0):
    """Socket-local depth/width/height, preserving the complete reference #3 fit."""
    radius, s, c = curved_side_by_side_radius(), sin(HALF_BEND), cos(HALF_BEND)
    return (side*(radius*s-depth*c+z*s), side*LANE_PITCH/2+y,
            radius*(c-1)+depth*s+z*c)


def curved_side_by_side_socket_transform(shape, side: int):
    return (shape.translate((-side*BODY.length/2, 0, 0))
            .rotate(Axis.Y, side*BEND_DEGREES/2)
            .translate(curved_side_by_side_local_point(side, 0)))


@lru_cache(maxsize=1)
def curved_side_by_side_cutters():
    reference = build_concepts()[0]
    return tuple(tuple(curved_side_by_side_socket_transform(cutter, side)
                       for cutter in cavity_segments(reference, (side,))) for side in (-1, 1))


@lru_cache(maxsize=1)
def curved_side_by_side_minimums():
    """Exact B-rep distances, including all relief-slot and pocket pairings."""
    body, lanes = make_curved_side_by_side_body(), curved_side_by_side_cutters()
    faces = body.faces()
    # Large cylindrical faces are the two curved skins; small cylinders are edge rounds.
    skins = [f for f in faces if f.geom_type == GeomType.CYLINDER and f.area > 100]
    assert len(skins) == 2
    skin_wall = min(cutter.distance_to(face) for lane in lanes for cutter in lane for face in skins)
    relief_wall = min(relief.distance_to(face) for lane in lanes for relief in lane[-2:] for face in faces)
    end_walls = []
    for side, lane in zip((-1, 1), lanes, strict=True):
        opposite_end = [f for f in faces if f.geom_type == GeomType.PLANE
                        and f.normal_at().X*side < -0.9]
        assert len(opposite_end) == 1
        end_walls.append(lane[0].distance_to(opposite_end[0]))
    return dict(inter_lane_void_separation_mm=min(a.distance_to(b) for a in lanes[0] for b in lanes[1]),
                curved_skin_wall_mm=skin_wall, enclosed_relief_wall_mm=relief_wall,
                enclosed_wall_mm=min(skin_wall, relief_wall), closed_end_wall_mm=min(end_walls))


def default_output_dir(variant: str) -> Path:
    return Path({"compact": "generated/v2", "curved-press-fit": "generated/v3",
                 "side-by-side-press-fit": "generated/v4", "curved-side-by-side-press-fit": "generated/v5",
                 "right-angle-side-by-side-press-fit": "generated/v6",
                 "right-angle-fit-samples": "generated/v6/fit_samples",
                 "right-angle-side-by-side-press-fit-inverted": "generated/v7"}[variant])


def plate_centers(variant: str = "compact"):
    if variant.startswith("right-angle-"):
        from right_angle import layout
        return layout(variant)[2]
    return PLATE_CENTERS if variant == "compact" else ((128.0, 128.0),)


def print_geometry(variant: str = "compact"):
    """Expected dimensions and explicit 3MF transforms, with Z minimum on the bed."""
    if variant.startswith("right-angle-"):
        from right_angle import layout
        dimensions, transforms, _ = layout(variant)
        return dimensions, transforms
    if variant == "curved-side-by-side-press-fit":
        angle = radians(CURVED_SIDE_BY_SIDE_PRINT_ANGLE)
        c, s = cos(angle), sin(angle)
        bounds = make_curved_side_by_side_body().rotate(Axis.Y, CURVED_SIDE_BY_SIDE_PRINT_ANGLE).bounding_box()
        return (tuple(bounds.size), [(c, 0, -s, 0, 1, 0, s, 0, c,
                 128-(bounds.min.X+bounds.max.X)/2, 128, -bounds.min.Z)])
    if variant == "side-by-side-press-fit":
        return ((SIDE_BY_SIDE_BODY.length, SIDE_BY_SIDE_BODY.width, SIDE_BY_SIDE_BODY.thickness),
                [(1, 0, 0, 0, 1, 0, 0, 0, 1, 128, 128, SIDE_BY_SIDE_BODY.thickness/2)])
    if variant == "curved-press-fit":
        bounds = make_curved_body().bounding_box()
        return ((BODY.length, bounds.size.Z, BODY.width),
                [(1, 0, 0, 0, 0, 1, 0, -1, 0,
                  128, 128 + (bounds.min.Z + bounds.max.Z)/2, BODY.width/2)])
    return ((BODY.length, BODY.width, BODY.thickness),
            [(1, 0, 0, 0, 1, 0, 0, 0, 1, x, y, BODY.thickness/2)
             for x, y in PLATE_CENTERS])


def rounded_dimensions(part) -> tuple[float, float, float]:
    size = part.bounding_box().size
    return tuple(round(value, 3) for value in (size.X, size.Y, size.Z))


def write_manifest(concepts: list[GeneratedConcept], output_dir: Path, variant="compact") -> None:
    if variant.startswith("right-angle-"):
        from right_angle import write_manifest as write_right_angle_manifest
        write_right_angle_manifest(concepts, output_dir, variant)
        return
    if variant == "curved-side-by-side-press-fit":
        write_curved_side_by_side_manifest(concepts[0], output_dir)
        return
    if variant == "side-by-side-press-fit":
        write_side_by_side_manifest(concepts[0], output_dir)
        return
    if variant == "curved-press-fit":
        write_curved_manifest(concepts[0], output_dir)
        return
    payload = []
    lines = ["# Compact USB-C retainers — revision 2", "",
             "Three separate one-piece holders. Do not assemble them together.", "",
             "Plate, left to right: **#3 press-fit · #5 side-entry · #9 ribbed push-in**.",
             "Centers: (92,128), (128,128), (164,128) mm; 12 mm gaps.", "",
             "Bodies: 24 × 17 × 8.4 mm. Housing capture: 3.2 mm per end. "
             "Pocket depth: 10.8 mm per end. Center divider: 2.4 mm.",
             "Metal envelope: 6.8 × 8.5 × 2.8 mm. Plastic housing: 12 mm wide × 6.4 mm thick.",
             "A1 / 0.4 mm / Generic PLA / 0.20 mm Standard / Textured PEI. Print flat.",
             "Actual insertion force, grip, and fatigue require testing with your cable.", ""]
    for concept, center in zip(concepts, PLATE_CENTERS, strict=True):
        spec = concept.spec
        item = dict(original_id=spec.original_id, slug=spec.slug, title=spec.title,
                    retention_style=spec.retention_style, dimensions_mm=concept.dimensions_mm,
                    volume_mm3=round(concept.volume_mm3, 3), housing_capture_mm=HOUSING_CAPTURE,
                    pocket_depth_mm=POCKET_DEPTH, center_divider_mm=round(CENTER_DIVIDER, 3),
                    plug_cavity_width_height_mm=[USB_C.plug_width + spec.plug_clearance,
                                                USB_C.plug_thickness + spec.plug_clearance],
                    housing_cavity_width_height_mm=[USB_C.housing_width + spec.housing_clearance,
                                                   USB_C.housing_thickness + spec.housing_clearance],
                    plate_center_xy_mm=center, insertion_note=spec.insertion_note,
                    retention_note=spec.retention_note,
                    step_path=str(concept.step_path.relative_to(output_dir)),
                    stl_path=str(concept.stl_path.relative_to(output_dir)))
        if spec.retention_style == "press_fit":
            item.update(mouth_width_height_mm=[11.25, 5.65], throat_depth_mm=THROAT_LENGTH,
                        relief_slot_width_mm=RELIEF_WIDTH)
        if spec.retention_style == "side_entry":
            item.update(side_housing_channel_height_mm=6.65, detent_gap_mm=6.25,
                        inward_seating_travel_mm=SIDE_SEATING_TRAVEL,
                        metal_side_channel_end_depth_mm=SIDE_TIP_CHANNEL_END)
        if spec.retention_style == "push_socket":
            item.update(rib_projection_mm=RIDGE_HEIGHT, rib_base_mm=RIDGE_BASE,
                        rib_span_mm=RIDGE_SPAN, rib_depths_mm=RIDGE_CENTERS,
                        rib_axis="vertical side-wall ribs, rooted in floor and roof",
                        ribbed_housing_width_gap_mm=11.95)
        payload.append(item)
        lines += [f"## {spec.title}", "", f"- Use: {spec.insertion_note}",
                  f"- Retention: {spec.retention_note}",
                  f"- STEP: `{item['step_path']}`", f"- STL: `{item['stl_path']}`", ""]
    (output_dir / "concepts.json").write_text(json.dumps(payload, indent=2) + "\n")
    (output_dir / "concepts.md").write_text("\n".join(lines) + "\n")
    write_plate_map(output_dir)


def write_curved_side_by_side_manifest(concept: GeneratedConcept, output_dir: Path) -> None:
    spec, config = concept.spec, CURVED_SIDE_BY_SIDE_BODY
    minimums = curved_side_by_side_minimums()
    dimensions, transforms = print_geometry("curved-side-by-side-press-fit")
    item = dict(original_id=3, variant_id="3D", slug=spec.slug, title=spec.title,
                retention_style=spec.retention_style, dimensions_mm=concept.dimensions_mm,
                volume_mm3=round(concept.volume_mm3, 3), bend_degrees=BEND_DEGREES,
                socket_tilt_degrees=BEND_DEGREES/2, centerline_radius_mm=curved_side_by_side_radius(),
                local_body_thickness_mm=config.thickness, lane_pitch_mm=LANE_PITCH,
                socket_axes_y_mm=[-LANE_PITCH/2, LANE_PITCH/2], minimum_nominal_wall_mm=MIN_WALL,
                geometry_minimums=minimums, pocket_depth_mm=POCKET_DEPTH, housing_capture_mm=HOUSING_CAPTURE,
                plug_cavity_width_height_mm=[8.65, 2.95], housing_cavity_width_height_mm=[12.2, 6.6],
                mouth_width_height_mm=[11.25, 5.65], throat_depth_mm=THROAT_LENGTH,
                throat_transition_overlap_mm=0.15, relief_slot_width_mm=RELIEF_WIDTH,
                relief_slot_end_depth_mm=RELIEF_END, corner_radius_mm=config.corner_radius,
                edge_fillet_mm=config.edge_fillet, plate_center_xy_mm=[128, 128],
                print_rotation_y_degrees=CURVED_SIDE_BY_SIDE_PRINT_ANGLE,
                print_dimensions_mm=dimensions, print_transform=transforms[0],
                infill_density_percent=20, infill_pattern="gyroid", wall_loops=3,
                top_shell_layers=5, bottom_shell_layers=5, shell_thickness_mm=1,
                supports_enabled=False, insertion_note=spec.insertion_note, retention_note=spec.retention_note,
                step_path=str(concept.step_path.relative_to(output_dir)),
                stl_path=str(concept.stl_path.relative_to(output_dir)))
    (output_dir / "concepts.json").write_text(json.dumps([item], indent=2)+"\n")
    (output_dir / "concepts.md").write_text(
        f"# {spec.title}\n\n"
        f"Body: {concept.dimensions_mm[0]} × {concept.dimensions_mm[1]} × {concept.dimensions_mm[2]} mm. "
        "Concave wrist face, convex outer face; local radial thickness 9.4 mm.\n\n"
        f"Centerline radius: {item['centerline_radius_mm']:.3f} mm. Socket lanes: ±6.5 mm; "
        "7.5° tilt each, 15° total. The sockets remain straight and open from opposite ends.\n\n"
        f"{spec.insertion_note}\n\n"
        "Reference #3 fit: metal 8.65 × 2.95 mm; housing 12.20 × 6.60 mm; mouth 11.25 × 5.65 mm; "
        "10.8 mm blind pocket, 3.2 mm capture, 0.8 mm nominal throat with 0.15 mm overlap, "
        "and unchanged 0.8 mm relief slots. All dimensions are measured in the socket's local frame.\n\n"
        f"Minimum inter-lane void separation: {minimums['inter_lane_void_separation_mm']:.3f} mm; "
        f"enclosed wall: {minimums['enclosed_wall_mm']:.3f} mm; "
        f"closed end wall: {minimums['closed_end_wall_mm']:.3f} mm.\n\n"
        "Print on the flat negative-X end face, rotated −82.5° about Y. Center: (128,128) mm. "
        "A1 / Generic PLA / 0.4 mm / 0.20 mm Standard / Textured PEI; no supports; "
        "20% gyroid, 3 walls, 5 top and bottom layers with 1 mm shell thickness.\n\n"
        "Physical acceptance: both plugs retain #3's usable fit independently, the curve seats comfortably "
        "on the wrist, and insertion causes no cracking or separation. These require a physical print test.\n")
    part = build_part(spec)
    removed = make_curved_side_by_side_body()-part
    voids = list(removed.solids()) if hasattr(removed, 'solids') else [s for p in removed for s in p.solids()]
    assert len(voids) == 6, "Expected two independent sockets and four separate relief slots"
    validation = dict(valid=part.is_valid, solid_count=len(part.solids()),
                      dimensions_mm=concept.dimensions_mm, independent_removed_void_count=len(voids),
                      bend_degrees=BEND_DEGREES, local_radial_thickness_mm=config.thickness, **minimums)
    (output_dir / "geometry_validation.json").write_text(json.dumps(validation, indent=2)+"\n")
    from preview_curved_side_by_side import write_plate_map
    write_plate_map(part, output_dir)


def write_side_by_side_manifest(concept: GeneratedConcept, output_dir: Path) -> None:
    spec = concept.spec
    separation, wall = side_by_side_minimums()
    dimensions, transforms = print_geometry("side-by-side-press-fit")
    item = dict(original_id=3, variant_id="3C", slug=spec.slug, title=spec.title,
                retention_style=spec.retention_style, dimensions_mm=concept.dimensions_mm,
                volume_mm3=round(concept.volume_mm3, 3), lane_pitch_mm=LANE_PITCH,
                socket_axes_y_mm=[-LANE_PITCH/2, LANE_PITCH/2],
                pocket_depth_mm=POCKET_DEPTH, housing_capture_mm=HOUSING_CAPTURE,
                closed_end_wall_mm=SIDE_BY_SIDE_BODY.length-POCKET_DEPTH,
                minimum_inter_lane_void_separation_mm=separation,
                enclosed_relief_wall_min_mm=wall, minimum_nominal_wall_mm=MIN_WALL,
                plug_cavity_width_height_mm=[8.65, 2.95], housing_cavity_width_height_mm=[12.2, 6.6],
                mouth_width_height_mm=[11.25, 5.65], throat_depth_mm=THROAT_LENGTH,
                throat_transition_overlap_mm=0.15, relief_slot_width_mm=RELIEF_WIDTH,
                corner_radius_mm=SIDE_BY_SIDE_BODY.corner_radius, edge_fillet_mm=SIDE_BY_SIDE_BODY.edge_fillet,
                plate_center_xy_mm=[128, 128], print_dimensions_mm=dimensions,
                print_transform=transforms[0], insertion_note=spec.insertion_note,
                retention_note=spec.retention_note,
                step_path=str(concept.step_path.relative_to(output_dir)),
                stl_path=str(concept.stl_path.relative_to(output_dir)))
    (output_dir / "concepts.json").write_text(json.dumps([item], indent=2)+"\n")
    (output_dir / "concepts.md").write_text(
        f"# {spec.title}\n\n"
        "Flat body: 13 × 30 × 8.4 mm. Two parallel sockets, 13 mm apart, entered from opposite ends.\n\n"
        f"{spec.insertion_note}\n\n"
        "Each lane preserves #3's straight socket geometry: metal 8.65 × 2.95 mm, housing 12.20 × 6.60 mm, "
        "mouth 11.25 × 5.65 mm, nominal throat 0.8 mm with the existing 0.15 mm transition overlap, "
        "and 0.8 mm relief slots. Pocket depth: 10.8 mm. Housing capture: 3.2 mm.\n\n"
        f"Closed end walls: {item['closed_end_wall_mm']:.1f} mm. Minimum inter-lane void separation: "
        f"{separation:.3f} mm. Minimum enclosed relief-slot wall: {wall:.3f} mm.\n\n"
        "Print flat at (128, 128) mm: A1 / Generic PLA / 0.4 mm / 0.20 mm Standard / Textured PEI; supports disabled.\n\n"
        "Physical acceptance: both plugs retain #3's usable fit independently, stay seated when the other "
        "is inserted or removed, and cause no cracking around the shared structure. These require a print test.\n")
    (output_dir / "plate_map.svg").write_text(
        '<svg xmlns="http://www.w3.org/2000/svg" width="700" height="520" viewBox="0 0 700 520">'
        '<rect width="700" height="520" fill="white"/>'
        '<g font-family="Arial,sans-serif" fill="#173329" text-anchor="middle">'
        '<text x="350" y="40" font-size="22">#3C — A1 plate, top view</text>'
        '<rect x="285" y="90" width="130" height="300" rx="8" fill="#d8eee0" stroke="#327449"/>'
        '<text x="350" y="245" font-size="28">#3C</text>'
        '<text x="350" y="440" font-size="17">Centered at (128, 128) mm · print flat</text>'
        '<text x="350" y="475" font-size="17">13 × 30 mm footprint · 8.4 mm print height</text>'
        '</g></svg>\n')


def curved_divider_thickness() -> float:
    pockets = [curved_socket_transform(x_prism(side, PLUG_START, POCKET_DEPTH, 8.65, 2.95), side)
               for side in (-1, 1)]
    return pockets[0].distance_to(pockets[1])


@lru_cache(maxsize=1)
def curved_minimum_enclosed_wall() -> float:
    """Exact distance from each enclosed relief void to the outside CAD faces."""
    body = make_curved_body()
    reliefs = [curved_socket_transform(
        x_prism(side, THROAT_LENGTH, RELIEF_END, RELIEF_WIDTH, BODY.thickness-2*MIN_WALL,
                center_y=direction*7.05), side)
        for side in (-1, 1) for direction in (-1, 1)]
    return min(relief.distance_to(face) for relief in reliefs for face in body.faces())


def write_curved_manifest(concept: GeneratedConcept, output_dir: Path) -> None:
    spec = concept.spec
    print_dimensions, transforms = print_geometry("curved-press-fit")
    item = dict(original_id=3, variant_id="3B", slug=spec.slug, title=spec.title,
                retention_style=spec.retention_style, dimensions_mm=concept.dimensions_mm,
                volume_mm3=round(concept.volume_mm3, 3), bend_degrees=BEND_DEGREES,
                socket_tilt_degrees=BEND_DEGREES / 2, centerline_radius_mm=curved_radius(),
                local_body_thickness_mm=BODY.thickness, minimum_nominal_wall_mm=MIN_WALL,
                end_corner_radius_mm=CURVED_END_RADIUS, edge_fillet_mm=BODY.edge_fillet,
                enclosed_relief_wall_min_mm=curved_minimum_enclosed_wall(),
                housing_capture_mm=HOUSING_CAPTURE, pocket_depth_mm=POCKET_DEPTH,
                center_divider_min_mm=curved_divider_thickness(),
                plug_cavity_width_height_mm=[8.65, 2.95], housing_cavity_width_height_mm=[12.2, 6.6],
                mouth_width_height_mm=[11.25, 5.65], throat_depth_mm=THROAT_LENGTH,
                relief_slot_width_mm=RELIEF_WIDTH, plate_center_xy_mm=[128, 128],
                print_dimensions_mm=print_dimensions, print_transform=transforms[0],
                insertion_note=spec.insertion_note, retention_note=spec.retention_note,
                step_path=str(concept.step_path.relative_to(output_dir)),
                stl_path=str(concept.stl_path.relative_to(output_dir)))
    (output_dir / "concepts.json").write_text(json.dumps([item], indent=2) + "\n")
    (output_dir / "concepts.md").write_text(
        f"# {spec.title}\n\n"
        f"Body: {concept.dimensions_mm[0]} × {concept.dimensions_mm[1]} × {concept.dimensions_mm[2]} mm. "
        "15° total bend; each straight socket tilts 7.5°. The concave underside faces the wrist.\n\n"
        f"Finished centerline arc radius: {curved_radius():.3f} mm. "
        f"Minimum central pocket separation: {item['center_divider_min_mm']:.3f} mm.\n\n"
        "The winning #3 mouth, cavity, 0.8 mm throat, relief slots, 10.8 mm pocket depth, "
        "and 3.2 mm housing capture are preserved in each socket's local frame.\n\n"
        f"{spec.insertion_note}\n\n"
        "Print on the flat long side: the original 17 mm width becomes print height. "
        "A1 / Generic PLA / 0.4 mm / 0.20 mm Standard / Textured PEI; supports disabled.\n\n"
        "Physical acceptance: retain #3's fit, improve wrist seating, and show no central cracking "
        "or separation during insertion. Grip, comfort and fatigue require a physical print test.\n")
    height = print_dimensions[1]
    (output_dir / "plate_map.svg").write_text(
        '<svg xmlns="http://www.w3.org/2000/svg" width="700" height="300" viewBox="0 0 700 300">'
        '<rect width="700" height="300" fill="white"/>'
        '<g font-family="Arial,sans-serif" fill="#173329" text-anchor="middle">'
        '<text x="350" y="35" font-size="21">#3B — A1 plate, top view</text>'
        f'<rect x="230" y="95" width="240" height="{height*10:.2f}" rx="12" fill="#d8eee0" stroke="#327449"/>'
        '<text x="350" y="150" font-size="28">#3B</text>'
        '<text x="350" y="240" font-size="17">Centered at (128, 128) mm · printed on its flat long side</text>'
        '<text x="350" y="273" font-size="16">24 mm long · 17 mm print height · 15° total bend</text>'
        '</g></svg>\n')


def write_plate_map(output_dir: Path) -> None:
    svg = ['<svg xmlns="http://www.w3.org/2000/svg" width="900" height="260" viewBox="0 0 900 260">',
           '<rect width="900" height="260" fill="#ffffff"/>',
           '<g font-family="Arial,sans-serif" fill="#173329" text-anchor="middle">',
           '<text x="450" y="28" font-size="18">Compact v2 — top view, back of plate at top</text>']
    for spec, (cx, _) in zip(build_concepts(), PLATE_CENTERS, strict=True):
        x = 450 + (cx - 128) * 7
        svg += [f'<rect x="{x - 84}" y="65" width="168" height="119" rx="11.2" '
                'fill="#d8eee0" stroke="#327449" stroke-width="2"/>',
                f'<text x="{x}" y="132" font-size="28">#{spec.original_id}</text>',
                f'<text x="{x}" y="208" font-size="17">{spec.title.split("Compact ")[1]}</text>']
    svg += ['<text x="450" y="246" font-size="16">Front edge / closest to you · 12 mm gaps</text>',
            '</g></svg>']
    (output_dir / "plate_map.svg").write_text("\n".join(svg) + "\n")


def generate(output_dir: Path, export_mesh: bool = True, export_step_file: bool = True,
             variant: str = "compact", fit: str = "standard") -> list[GeneratedConcept]:
    output_dir.mkdir(parents=True, exist_ok=True)
    for subdir in ("step", "stl"):
        (output_dir / subdir).mkdir(exist_ok=True)
    generated = []
    for spec in build_concepts(variant, fit):
        part = build_part(spec)
        step_path = output_dir / "step" / f"{spec.slug}.step"
        stl_path = output_dir / "stl" / f"{spec.slug}.stl"
        if export_step_file:
            export_step(part, step_path)
        if export_mesh:
            export_stl(part, stl_path, tolerance=0.02, angular_tolerance=0.1)
        generated.append(GeneratedConcept(spec, rounded_dimensions(part), part.volume, step_path, stl_path))
        if variant == "curved-press-fit":
            from preview_curved import write_preview
            write_preview(part, output_dir)
        elif variant == "side-by-side-press-fit":
            from preview_side_by_side import write_preview
            write_preview(part, output_dir)
        elif variant == "curved-side-by-side-press-fit":
            from preview_curved_side_by_side import write_preview
            write_preview(part, output_dir)
    write_manifest(generated, output_dir, variant)
    if variant.startswith("right-angle-"):
        from preview_right_angle import write_preview, write_plate_map
        write_preview(generated, output_dir, variant)
        write_plate_map(generated, output_dir, variant)
    return generated


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(description="Generate compact USB-C cable retainers and #3B–#3E variations.")
    parser.add_argument("--variant", choices=VARIANTS, default="compact")
    parser.add_argument("--fit", choices=("gentle", "standard", "firm"), default="standard",
                        help="Trial retaining-mouth fit for the #3E holder; samples always include all three.")
    parser.add_argument("--output-dir", type=Path,
                        help="Output folder (compact: v2; #3B: v3; #3C: v4; #3D: v5; #3E: v6; #3E inverted: v7, under generated/).")
    parser.add_argument("--skip-stl", action="store_true", help="Skip STL export.")
    parser.add_argument("--skip-step", action="store_true", help="Skip STEP export.")
    args = parser.parse_args()
    if args.fit != "standard" and args.variant not in ("right-angle-side-by-side-press-fit", "right-angle-side-by-side-press-fit-inverted"):
        parser.error("--fit is only selectable for right-angle-side-by-side-press-fit")
    return args


def main() -> int:
    args = parse_args()
    output_dir = args.output_dir or default_output_dir(args.variant)
    generated = generate(output_dir, not args.skip_stl, not args.skip_step, args.variant, args.fit)
    print(f"Generated {len(generated)} models in {output_dir.resolve()}")
    for concept in generated:
        print(f"- {concept.spec.title}: {concept.dimensions_mm} mm; {concept.volume_mm3:.1f} mm³")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

from __future__ import annotations

import argparse
import json
from dataclasses import dataclass
from pathlib import Path

from build123d import Box, RectangleRounded, SlotOverall, export_step, export_stl, extrude


@dataclass(frozen=True)
class UsbCEnvelope:
    plug_length: float = 6.8
    plug_width: float = 8.5
    plug_thickness: float = 2.8
    housing_length: float = 8.8
    housing_width: float = 12.0
    housing_thickness: float = 6.4
    cable_width: float = 4.5
    cable_thickness: float = 3.2
    tip_clearance: float = 0.8

    @property
    def captured_length(self) -> float:
        return self.housing_length + self.plug_length + self.tip_clearance


@dataclass(frozen=True)
class MaterialProfile:
    label: str
    plug_clearance: float
    housing_clearance: float
    throat_reduction: float
    side_slot_reduction: float
    relief_slot_width: float
    material_note: str


@dataclass(frozen=True)
class FormConfig:
    key: str
    label: str
    length: float
    width: float
    thickness: float
    corner_radius: float
    edge_fillet: float
    inner_length: float | None = None
    inner_width: float | None = None


@dataclass(frozen=True)
class ConceptSpec:
    slug: str
    form: str
    retention_style: str
    title: str
    material_profile: MaterialProfile


@dataclass(frozen=True)
class GeneratedConcept:
    spec: ConceptSpec
    dimensions_mm: tuple[float, float, float]
    insertion_note: str
    plug_retention_note: str
    housing_retention_note: str
    material_note: str
    step_path: Path
    stl_path: Path


USB_C = UsbCEnvelope()

STIFF_PROFILE = MaterialProfile(
    label="stiffer",
    plug_clearance=0.25,
    housing_clearance=0.35,
    throat_reduction=0.55,
    side_slot_reduction=0.55,
    relief_slot_width=0.0,
    material_note=(
        "Best for firmer TPU or semi-rigid elastomer. The body stays more solid and "
        "relies on a shallow snap throat instead of large flex windows."
    ),
)

COMPLIANT_PROFILE = MaterialProfile(
    label="more flexible",
    plug_clearance=0.15,
    housing_clearance=0.20,
    throat_reduction=0.95,
    side_slot_reduction=0.85,
    relief_slot_width=0.80,
    material_note=(
        "Best for soft TPU or silicone-like elastomer. The retention comes from a more "
        "aggressive snap mouth backed by side relief slots."
    ),
)

BALANCED_PROFILE = MaterialProfile(
    label="balanced flex",
    plug_clearance=0.20,
    housing_clearance=0.25,
    throat_reduction=0.75,
    side_slot_reduction=0.70,
    relief_slot_width=0.0,
    material_note=(
        "Best for medium-flex elastomer. It splits the difference between secure snap-in "
        "retention and easier removal."
    ),
)

FORM_CONFIGS = {
    "straight_bar": FormConfig(
        key="straight_bar",
        label="Straight bar",
        length=46.0,
        width=18.0,
        thickness=8.2,
        corner_radius=4.0,
        edge_fillet=0.9,
    ),
    "oval_ring": FormConfig(
        key="oval_ring",
        label="Oval ring",
        length=60.0,
        width=28.0,
        thickness=7.8,
        corner_radius=0.0,
        edge_fillet=0.8,
        inner_length=18.0,
        inner_width=12.0,
    ),
    "flat_tab": FormConfig(
        key="flat_tab",
        label="Flat tab",
        length=44.0,
        width=20.0,
        thickness=7.4,
        corner_radius=6.0,
        edge_fillet=0.8,
    ),
}

INSERTION_NOTES = {
    "push_socket": (
        "Straight axial push-in from each outer end. Removal is a direct pull while the "
        "outer throat relaxes enough to let the housing pass back out."
    ),
    "press_fit": (
        "Axial press-in through a narrower snap throat. Removal uses a peel-and-pull motion "
        "so the relief windows can open before the housing clears."
    ),
    "side_entry": (
        "Lateral slide-in through mirrored side channels, then a short inward push seats the "
        "plug against the blind stop. Removal reverses that slide while the lips flex."
    ),
}

PLUG_RETENTION_NOTES = {
    "push_socket": (
        "Firm plug retention happens at the close-fit inner plug pocket and the shoulder "
        "between the housing chamber and the smaller plug recess."
    ),
    "press_fit": (
        "Firm plug retention comes from the same stepped plug pocket, but with a tighter "
        "entry throat so the tip stays deep in the blind recess during wear."
    ),
    "side_entry": (
        "Firm plug retention occurs at the blind inner plug pocket; the plug cannot translate "
        "far enough to escape unless the whole connector is first slid back to the side slot."
    ),
}

HOUSING_RETENTION_NOTES = {
    "push_socket": (
        "Moderate housing retention comes from the recessed mouth being smaller than the "
        "housing envelope, while still large enough for repeated snap-in use."
    ),
    "press_fit": (
        "Moderate housing retention is handled by the compliant snap throat and flanking "
        "relief slots so the housing is captured without needing a hard rigid clamp."
    ),
    "side_entry": (
        "Moderate housing retention comes from top and bottom lips over the side channel, "
        "which keep the housing captured while leaving insertion force manageable."
    ),
}

FORM_NOTES = {
    "straight_bar": "Compact linear spine with mirrored inward-facing pockets.",
    "oval_ring": "Closed-loop body that reduces snagging and reads most like jewelry.",
    "flat_tab": "Lowest-profile planar body aimed at the smallest wearable footprint.",
}


def build_concepts() -> list[ConceptSpec]:
    forms = [
        ("straight_bar", "Straight bar"),
        ("oval_ring", "Oval ring"),
        ("flat_tab", "Flat tab"),
    ]
    styles = [
        ("push_socket", "Push-in socket", STIFF_PROFILE),
        ("press_fit", "Press-fit recess", COMPLIANT_PROFILE),
        ("side_entry", "Side-entry slide-in", BALANCED_PROFILE),
    ]

    concepts: list[ConceptSpec] = []
    for form_key, form_label in forms:
        for style_key, style_label, profile in styles:
            concepts.append(
                ConceptSpec(
                    slug=f"{form_key}_{style_key}",
                    form=form_key,
                    retention_style=style_key,
                    title=f"{form_label} / {style_label}",
                    material_profile=profile,
                )
            )
    return concepts


def combine(solids: list):
    result = solids[0]
    for solid in solids[1:]:
        result = result + solid
    return result


def mirrored_x_span(body_length: float, side: int, start: float, end: float) -> tuple[float, float]:
    if side == -1:
        return -body_length / 2 + start, -body_length / 2 + end
    return body_length / 2 - end, body_length / 2 - start


def x_prism(
    body_length: float,
    side: int,
    start: float,
    end: float,
    width: float,
    height: float,
    center_y: float = 0.0,
    center_z: float = 0.0,
):
    x0, x1 = mirrored_x_span(body_length, side, start, end)
    return Box(abs(x1 - x0), width, height).translate(((x0 + x1) / 2, center_y, center_z))


def y_slot_prism(
    body_length: float,
    body_width: float,
    side: int,
    start: float,
    end: float,
    slot_direction: int,
    height: float,
    inner_reach: float,
):
    x0, x1 = mirrored_x_span(body_length, side, start, end)
    outer_y = slot_direction * (body_width / 2 + 0.25)
    inner_y = slot_direction * inner_reach
    return Box(abs(x1 - x0), abs(outer_y - inner_y), height).translate(
        ((x0 + x1) / 2, (outer_y + inner_y) / 2, 0)
    )


def make_body(config: FormConfig):
    if config.key == "oval_ring":
        assert config.inner_length is not None
        assert config.inner_width is not None
        body = extrude(
            SlotOverall(config.length, config.width) - SlotOverall(config.inner_length, config.inner_width),
            amount=config.thickness,
        )
    else:
        body = extrude(
            RectangleRounded(config.length, config.width, config.corner_radius),
            amount=config.thickness,
        )

    body = body.translate((0, 0, -config.thickness / 2))
    return body.fillet(config.edge_fillet, body.edges())


def cavity_segments(spec: ConceptSpec, config: FormConfig) -> list:
    profile = spec.material_profile
    plug_width = USB_C.plug_width + profile.plug_clearance
    plug_height = USB_C.plug_thickness + profile.plug_clearance
    housing_width = USB_C.housing_width + profile.housing_clearance
    housing_height = USB_C.housing_thickness + profile.housing_clearance
    cable_width = USB_C.cable_width + 0.35
    cable_height = USB_C.cable_thickness + 0.30

    throat_width = max(cable_width, housing_width - profile.throat_reduction)
    throat_height = max(cable_height, housing_height - profile.throat_reduction)

    front_setback = 1.2
    throat_length = 2.2
    housing_start = throat_length
    housing_end = housing_start + USB_C.housing_length
    plug_start = housing_end - 0.15
    plug_end = housing_end + USB_C.plug_length + USB_C.tip_clearance

    segments: list = []
    for side in (-1, 1):
        if spec.retention_style == "side_entry":
            segments.extend(
                [
                    x_prism(
                        config.length,
                        side,
                        -0.2,
                        front_setback + 1.4,
                        cable_width,
                        cable_height,
                    ),
                    x_prism(
                        config.length,
                        side,
                        front_setback,
                        front_setback + USB_C.housing_length,
                        housing_width,
                        housing_height,
                    ),
                    x_prism(
                        config.length,
                        side,
                        front_setback + USB_C.housing_length - 0.15,
                        front_setback + USB_C.housing_length + USB_C.plug_length + USB_C.tip_clearance,
                        plug_width,
                        plug_height,
                    ),
                    y_slot_prism(
                        config.length,
                        config.width,
                        side,
                        front_setback - 0.2,
                        front_setback + USB_C.captured_length,
                        slot_direction=-side,
                        height=max(cable_height, housing_height - profile.side_slot_reduction),
                        inner_reach=housing_width / 2 - 0.30,
                    ),
                ]
            )
            continue

        segments.extend(
            [
                x_prism(
                    config.length,
                    side,
                    -0.2,
                    throat_length,
                    throat_width,
                    throat_height,
                ),
                x_prism(
                    config.length,
                    side,
                    housing_start - 0.15,
                    housing_end,
                    housing_width,
                    housing_height,
                ),
                x_prism(
                    config.length,
                    side,
                    plug_start,
                    plug_end,
                    plug_width,
                    plug_height,
                ),
            ]
        )

        if spec.retention_style == "press_fit":
            relief_height = max(config.thickness - 1.6, cable_height + 1.0)
            relief_center = housing_width / 2 + 0.95
            relief_end = throat_length + USB_C.housing_length * 0.82
            segments.extend(
                [
                    x_prism(
                        config.length,
                        side,
                        0.6,
                        relief_end,
                        profile.relief_slot_width,
                        relief_height,
                        center_y=relief_center,
                    ),
                    x_prism(
                        config.length,
                        side,
                        0.6,
                        relief_end,
                        profile.relief_slot_width,
                        relief_height,
                        center_y=-relief_center,
                    ),
                ]
            )
    return segments


def build_part(spec: ConceptSpec):
    config = FORM_CONFIGS[spec.form]
    body = make_body(config)
    features = combine(cavity_segments(spec, config))
    return body - features


def rounded_dimensions(part) -> tuple[float, float, float]:
    size = part.bounding_box().size
    return tuple(round(value, 2) for value in (size.X, size.Y, size.Z))


def write_manifest(concepts: list[GeneratedConcept], output_dir: Path) -> None:
    md_path = output_dir / "concepts.md"
    json_path = output_dir / "concepts.json"

    lines = [
        "# Wearable USB-C Retainer Concepts",
        "",
        "All concepts keep both USB-C ends facing each other on the same plane and assume a typical connector envelope:",
        "",
        (
            f"- Plug envelope: {USB_C.plug_length:.1f} x {USB_C.plug_width:.1f} x "
            f"{USB_C.plug_thickness:.1f} mm"
        ),
        (
            f"- Housing envelope: {USB_C.housing_length:.1f} x {USB_C.housing_width:.1f} x "
            f"{USB_C.housing_thickness:.1f} mm"
        ),
        f"- Cable pass-through allowance: {USB_C.cable_width:.1f} x {USB_C.cable_thickness:.1f} mm",
        "",
    ]

    json_payload = []
    for concept in concepts:
        dims = " x ".join(f"{value:.2f}" for value in concept.dimensions_mm)
        lines.extend(
            [
                f"## {concept.spec.title}",
                "",
                f"- Form note: {FORM_NOTES[concept.spec.form]}",
                f"- Overall dimensions: {dims} mm",
                f"- Insertion / removal: {concept.insertion_note}",
                f"- Firm plug retention: {concept.plug_retention_note}",
                f"- Moderate housing retention: {concept.housing_retention_note}",
                f"- Better suited for: {concept.material_note}",
                f"- STEP: `{concept.step_path.name}`",
                f"- STL: `{concept.stl_path.name}`",
                "",
            ]
        )
        json_payload.append(
            {
                "slug": concept.spec.slug,
                "title": concept.spec.title,
                "form": concept.spec.form,
                "retention_style": concept.spec.retention_style,
                "material_profile": concept.spec.material_profile.label,
                "dimensions_mm": concept.dimensions_mm,
                "insertion_note": concept.insertion_note,
                "plug_retention_note": concept.plug_retention_note,
                "housing_retention_note": concept.housing_retention_note,
                "material_note": concept.material_note,
                "step_path": str(concept.step_path),
                "stl_path": str(concept.stl_path),
            }
        )

    md_path.write_text("\n".join(lines), encoding="utf-8")
    json_path.write_text(json.dumps(json_payload, indent=2), encoding="utf-8")


def generate(output_dir: Path, export_mesh: bool = True, export_step_file: bool = True) -> list[GeneratedConcept]:
    output_dir.mkdir(parents=True, exist_ok=True)
    step_dir = output_dir / "step"
    stl_dir = output_dir / "stl"
    step_dir.mkdir(exist_ok=True)
    stl_dir.mkdir(exist_ok=True)

    generated: list[GeneratedConcept] = []
    for spec in build_concepts():
        part = build_part(spec)
        step_path = step_dir / f"{spec.slug}.step"
        stl_path = stl_dir / f"{spec.slug}.stl"

        if export_step_file:
            export_step(part, step_path)
        if export_mesh:
            export_stl(part, stl_path)

        generated.append(
            GeneratedConcept(
                spec=spec,
                dimensions_mm=rounded_dimensions(part),
                insertion_note=INSERTION_NOTES[spec.retention_style],
                plug_retention_note=PLUG_RETENTION_NOTES[spec.retention_style],
                housing_retention_note=HOUSING_RETENTION_NOTES[spec.retention_style],
                material_note=spec.material_profile.material_note,
                step_path=step_path,
                stl_path=stl_path,
            )
        )

    write_manifest(generated, output_dir)
    return generated


def parse_args() -> argparse.Namespace:
    parser = argparse.ArgumentParser(
        description="Generate build123d concept models for a wearable USB-C cable retainer."
    )
    parser.add_argument(
        "--output-dir",
        type=Path,
        default=Path("generated"),
        help="Directory for generated STEP, STL, and manifest outputs.",
    )
    parser.add_argument(
        "--skip-stl",
        action="store_true",
        help="Skip STL export if only solid models are needed.",
    )
    parser.add_argument(
        "--skip-step",
        action="store_true",
        help="Skip STEP export if only meshes are needed.",
    )
    return parser.parse_args()


def main() -> int:
    args = parse_args()
    generated = generate(
        output_dir=args.output_dir,
        export_mesh=not args.skip_stl,
        export_step_file=not args.skip_step,
    )

    print(f"Generated {len(generated)} concepts in {args.output_dir.resolve()}")
    for concept in generated:
        dims = " x ".join(f"{value:.2f}" for value in concept.dimensions_mm)
        print(f"- {concept.spec.slug}: {dims} mm")
    print(f"Concept manifest: {(args.output_dir / 'concepts.md').resolve()}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())

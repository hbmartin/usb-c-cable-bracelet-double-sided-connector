# Wearable USB-C Cable Retainer Concepts

This project generates a concept set for a single-piece wearable retainer that captures both ends of a USB-C to USB-C cable so the cable can be worn as a bracelet or necklace.

The models are implemented in `build123d` and explore:

- 3 body forms: straight bar, oval ring, flat tab
- 3 retention styles: push-in socket, press-fit recess, side-entry slide-in
- material behavior tuned toward stiffer, more flexible, and balanced elastomeric prints

## Usage

Install and run with `uv`:

```bash
uv run python main.py
```

Generated outputs land in `generated/` by default:

- `generated/step/*.step`
- `generated/stl/*.stl`
- `generated/concepts.md`
- `generated/concepts.json`

Optional flags:

```bash
uv run python main.py --output-dir concept_exports
uv run python main.py --skip-stl
uv run python main.py --skip-step
```

## Modeling Assumptions

The concept set uses a generic USB-C connector envelope rather than a cable-brand-specific profile:

- plug envelope: `6.8 x 8.5 x 2.8 mm`
- housing envelope: `8.8 x 12.0 x 6.4 mm`
- cable pass-through allowance: `4.5 x 3.2 mm`

These values are intentionally approximate so the CAD stays focused on concept direction:

- firm plug capture comes from the blind inner plug pocket and the housing-to-plug shoulder
- moderate housing capture comes from a reduced mouth or side channel that can flex in TPU-like materials
- both connector ends remain inward-facing and coplanar

## Notes

- `push_socket` variants are biased toward firmer TPU behavior
- `press_fit` variants are biased toward softer, more compliant elastomers
- `side_entry` variants target a middle ground between security and ease of removal

The generated `concepts.md` manifest includes dimensions plus insertion, retention, and material notes for every concept.

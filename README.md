# Compact USB-C cable retainers

**Winning design: #3 compact press-fit.** The user selected #3 as the preferred design from the compact v2 models.

Revision 2 contains three separate, one-piece cable holders, retaining the IDs from the original nine-part plate:

| Left to right on the new plate | Mechanism | Revision |
| --- | --- | --- |
| **#3** | Axial press-fit | Original snug socket and mouth widths/heights; shortened throat and housing capture; relief slots retained. |
| **#5** | Side-entry | Stepped lateral access for the housing and metal tip; rounded housing detents; slide inward 0.8 mm to retain the tip behind the side wall. |
| **#9** | Ribbed push-in | Two opposing pairs of rounded vertical ribs in each housing pocket; they grip the plastic housing and grow from the floor without floating roof ribs. |

All bodies are **24 × 17 × 8.4 mm**, about 45% shorter than the original #3. Both metal tips remain inward-facing and enclosed; only the front **3.2 mm** of each plastic housing is captured. Most of each housing stays exposed. These holders do not assemble together.

The oval designs and other alternatives are no longer generated. Original exports remain in `generated/` for reference; compact output defaults to `generated/v2/`.

## Curved #3B variation

**#3B 15° curved press-fit** follows the wrist with two straight sockets tilted **7.5° each**, joined by a smooth, tangent center arc. Its finished dimensions are **24 × 17 × 9.777 mm**: the overall length and width match #3, while the bend increases overall height. The local body thickness remains **8.4 mm**.

The winning #3 socket and mouth dimensions, nominal 0.8 mm throat, 0.8 mm relief slots, 10.8 mm pocket depth, and 3.2 mm housing capture are preserved in each socket's local frame. The finished centerline radius is **6.075 mm**, with **1.201 mm minimum separation** between the pockets. Exterior end corners use a 0.8 mm radius so the enclosed relief-slot walls retain at least **0.8 mm** of material. The original straight #3 and all v2 exports are preserved.

Wear #3B with the **concave underside toward the wrist**. Push each plug straight along its own tilted socket axis toward the center. Pull outward along that same axis to remove it.

Generate the variation and its A1 project:

```bash
uv run python main.py --variant curved-press-fit
uv run python build_plate.py --variant curved-press-fit
```

This mode defaults to **`generated/v3/`**; `--output-dir` overrides it. Existing `--skip-stl`, `--skip-step`, and `--bambu-studio` options retain their behavior on their respective commands. Running without `--variant` still generates the original v2 plate.

The [A1 print project](generated/v3/curved_press_fit_3B_A1_PLA.3mf) contains one centered #3B using Generic PLA, a 0.4 mm nozzle, 0.20 mm Standard layers, and Textured PEI. It is oriented **on its flat long side**, making the original 17 mm width the print height. Supports are disabled. Open the project in Bambu Studio and click **Slice plate**.

The [CAD preview and side section](generated/v3/preview.png) show the straight socket axes and total bend. [Layer-path images](generated/v3/layer_paths.png), `toolpath_review.json`, and `validation.json` record the native slice and bridge checks. Physical acceptance still requires testing with the cable: retain #3's usable fit, improve wrist seating, and show no cracking or separation at the center during insertion.

## Side-by-side #3C variation

**#3C Side-by-side press-fit** is a flat **13 × 30 × 8.4 mm** holder with two parallel sockets **13 mm apart**, centered at ±6.5 mm across its width. One plug enters from each end, with the plugs' wide faces parallel to the top and the cables exiting opposite ends. Each plug has its own blind pocket.

Each socket reuses #3's geometry through translation: **8.65 × 2.95 mm** metal pocket, **12.20 × 6.60 mm** housing pocket, **11.25 × 5.65 mm** mouth, nominal **0.8 mm throat** with the existing transition overlap, and **0.8 mm relief slots**. Pocket depth remains **10.8 mm** and housing capture **3.2 mm**. The closed end walls are **2.2 mm** thick. The closest separation between the lanes' cavities and relief slots is **1.044 mm**, and enclosed relief-slot walls retain at least **0.8 mm**. Exterior corner radii are 0.8 mm with 0.4 mm edge fillets.

| Design | Body dimensions | Socket arrangement |
| --- | --- | --- |
| Winning #3 | 24 × 17 × 8.4 mm | Two aligned sockets entered from opposite ends. |
| Curved #3B | 24 × 17 × 9.777 mm | Two straight sockets tilted 7.5° each around a curved center. |
| Side-by-side #3C | 13 × 30 × 8.4 mm | Two parallel, offset sockets entered from opposite ends. |
| Curved side-by-side #3D | 15.2 × 30 × 9.774 mm | Two offset sockets tilted 7.5° each, with concave wrist and convex outer faces. |

Push each plug straight into its own lane and pull straight outward to remove it. The [top cutaway](generated/v4/preview.png) shows both openings and the opposite insertion directions.

```bash
uv run python main.py --variant side-by-side-press-fit
uv run python build_plate.py --variant side-by-side-press-fit
```

This mode defaults to **`generated/v4/`**, containing STEP, STL, manifests, the CAD preview, a plate map, and validation results. Existing output overrides and skip options retain their behavior, and default generation remains the compact v2 plate. All previous exports, including #3 and #3B, are preserved.

The [#3C A1 project](generated/v4/side_by_side_press_fit_3C_A1_PLA.3mf) contains one centered holder **printed flat at 8.4 mm height**, using Generic PLA, a 0.4 mm nozzle, 0.20 mm Standard layers, Textured PEI, and no supports. Open it in Bambu Studio and click **Slice plate**. Native slicing and [layer-path inspection](generated/v4/layer_paths.png) check for floating islands and bridge anchoring; `validation.json` and `toolpath_review.json` record the results.

Physical acceptance requires a print test: both plugs should retain #3's usable fit independently, remain seated when the other is inserted or removed, and cause no cracking around the shared structure.

## Curved, counter-angled #3D variation

**#3D 15° curved side-by-side press-fit** retains #3C's two lanes **13 mm apart**, with each complete, straight socket tilted **7.5°** in the opposite direction. The body has a **concave wrist face and convex outer face**. Finished dimensions are **15.2 × 30 × 9.774 mm**, with **9.4 mm local radial thickness** and a solved **53.901 mm centerline radius**. The extra 2.2 mm of length preserves the space between the unchanged relief slots.

Each socket preserves the winning #3 fit through rigid rotation and translation: **8.65 × 2.95 mm** metal pocket, **12.20 × 6.60 mm** housing pocket, **11.25 × 5.65 mm** mouth, **10.8 mm** pocket depth, **3.2 mm** capture, **0.8 mm** nominal throat with the original **0.15 mm overlap**, and unchanged **0.8 mm relief slots** ending 6 mm inside the opening. The rounded body has **1.225 mm minimum inter-lane separation**, **0.8 mm minimum enclosed walls**, **0.987 mm minimum curved skin**, and **3.137 mm minimum closed end walls**. Exterior corner radii are 0.8 mm; edge fillets are 0.4 mm.

Wear the concave side against the wrist. Push each plug straight into its own tilted socket from the opposite ends, and withdraw along the same axis. The [CAD preview and top cutaway](generated/v5/preview.png) show the lanes; the [actual side sections](generated/v5/side_sections.png) show that both sockets stay straight inside the curved body. #3D adds wrist curvature and socket tilt to #3C while retaining its lane spacing and local fit. The winning #3 and all earlier designs remain available.

```bash
uv run python main.py --variant curved-side-by-side-press-fit
uv run python build_plate.py --variant curved-side-by-side-press-fit
```

Output defaults to **`generated/v5/`**. Existing output-directory overrides and skip options retain their behavior. This folder contains STEP, STL, manifests, previews, a plate map, CAD validation, native slice results, and the [#3D A1 print project](generated/v5/curved_side_by_side_press_fit_3D_A1_PLA.3mf).

The holder prints on its **flat negative-X end face**, rotated **−82.5° about Y**. This preserves the curved wrist face and produces a **10.99 × 30 mm print envelope, 15.08 mm tall**, centered at (128,128) mm. Use **A1 / Generic PLA / 0.4 mm / 0.20 mm Standard / Textured PEI**, **20% gyroid infill**, **three wall loops**, and **five top and bottom layers with 1 mm shell thickness**. Supports are disabled. The [plate map](generated/v5/plate_map.png) shows the bed-facing opening.

The final native slice takes approximately **20–21 minutes and 3.3 g PLA**. [Layer-path inspection](generated/v5/layer_paths.png) checks both entry lips, relief-slot transitions, blind pocket closures, floating islands, and bridge anchoring. Socket-core probes check the actual extrusion paths for blocked openings; full socket dimensions and insertion paths are checked in CAD. `geometry_validation.json`, `validation.json`, and `toolpath_review.json` record the results. The project marks the custom strength settings as process overrides so Bambu Studio retains them when importing its Standard preset. Open the editable project in Bambu Studio and click **Slice plate** before printing.

Physical acceptance requires printing: both plugs retain #3's usable fit independently, remain seated when the other is inserted or removed, seat comfortably on the wrist, and cause no cracking or separation. Stop if insertion requires excessive force.

## Print #3B and #3C together

The [combined A1 project](generated/comparison_3B_3C/connectors_3B_3C_A1_PLA.3mf) contains one of each variation, centered as a group with a **12 mm gap**. **#3B is on the left, on its flat long side at 17 mm print height; #3C is on the right, flat at 8.4 mm height.** The [numbered plate map](generated/comparison_3B_3C/plate_map.png) shows their positions.

Both print together by layer using **A1 / Generic PLA / 0.4 mm nozzle / 0.20 mm Standard / Textured PEI**, with supports disabled. Native slicing estimates **25 minutes and 4.5 g PLA** across 85 layers, with no slice warnings, support toolpaths, or floating layer islands. The [layer-path review](generated/comparison_3B_3C/layer_paths.png) includes the entry lips, pocket roofs, and relief-slot bridges.

```bash
uv run python build_plate.py --variant comparison-3b-3c
```

This command reuses the preserved v3 and v4 STLs without changing either model. It saves the editable 3MF, plate map, source-hash manifest, validation results, and validated toolpaths under **`generated/comparison_3B_3C/`**. Open the 3MF in Bambu Studio and click **Slice plate** before printing; the saved project has no cached G-code. Existing generation defaults remain unchanged.

## Generate CAD and meshes

```bash
uv sync --locked
uv run python main.py
```

The existing options remain available:

```bash
uv run python main.py --output-dir custom_exports
uv run python main.py --skip-stl
uv run python main.py --skip-step
```

Outputs include three STEP files, three STL files, `concepts.json`, `concepts.md`, and `plate_map.svg`.

## Build the A1 PLA plate

After generating the STLs:

```bash
uv run python build_plate.py
```

This uses the installed Bambu Studio CLI and the complete A1/PLA settings from the preserved original `generated/all_connectors_A1_PLA.3mf` project. It runs with an isolated temporary Bambu data directory and does not connect to or start the printer.

The resulting `generated/v2/compact_connectors_A1_PLA.3mf` uses:

- Bambu Lab A1, 0.4 mm nozzle, Generic PLA, Textured PEI plate.
- The 0.20 mm Standard A1 process, with supports disabled.
- #3, #5, #9 left to right at (92,128), (128,128), (164,128) mm, with **12 mm gaps**.
- Flat printing, no auto-orientation, no auto-arrangement, and no scale changes.

The builder verifies the final 3MF geometry, names, placements, settings, a single sliced plate, zero support toolpaths, and an empty slice-warning report before delivering the file. It also saves `validation.json` and `slicing.log`.

The 3MF is an editable project without cached G-code or thumbnails. Open it in Bambu Studio and click **Slice plate** before printing. The separately saved `validated_toolpaths.gcode` is the native slice used for validation. Avoiding CLI thumbnail export also avoids a macOS crash-recovery dialog in Bambu's OpenGL window initialization.

For another Bambu Studio installation or output location:

```bash
uv run python build_plate.py --bambu-studio /path/to/BambuStudio --output-dir custom_exports
```

Generate STLs into that output location first.

## Fit and geometry

Pocket depth is 10.8 mm per end, leaving a solid 2.4 mm central divider. Housing-pocket roofs/floors have at least 0.8 mm nominal material. The generic metal envelope remains 6.8 × 8.5 × 2.8 mm; housing width/thickness is 12 × 6.4 mm.

Socket width × height is preserved independently of the smaller body:

| ID | Metal-tip pocket | Housing pocket | Local retention |
| --- | --- | --- | --- |
| #3 | 8.65 × 2.95 mm | 12.20 × 6.60 mm | 11.25 × 5.65 mm mouth, 0.8 mm throat and relief slots. |
| #5 | 8.70 × 3.00 mm | 12.25 × 6.65 mm | Opposing 0.2 mm detents create a local 6.25 mm vertical gap. Upper detents extend into the housing stop so they are connected when printing begins. |
| #9 | 8.75 × 3.05 mm | 12.35 × 6.75 mm | Opposing 0.2 mm ribs create an 11.95 mm width gap. Each rib has a 0.8 mm axial base and 8 mm vertical span, rooted in floor and roof; pairs are 1.3 and 2.5 mm inside each end. |

The 8 mm ribs in #9 run vertically along the side walls, rather than hanging below the roof. This preserves the specified rib dimensions while avoiding unsupported first extrusions. No ridges enter the metal-tip pockets.

## Verify and test the prints

```bash
uv run python -m unittest -v
```

The geometric checks cover valid single solids, body dimensions, the central divider, the original socket sizes, roof/floor thickness, actual rib material, and the side-entry tip's lateral loading path and seated side-wall capture. Export also checks that every STL mesh is closed and two-manifold.

Geometry and slicing cannot measure insertion force or repeated-use durability. With your actual cable, test each piece off your wrist first:

1. #3 should retain a usable snug fit; stop if PLA requires excessive force.
2. #5 should slide in sideways and seat with a short inward movement; pull outward before sliding out.
3. #9 should grip its plastic housings more securely than the original without housing damage.

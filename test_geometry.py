"""Geometric acceptance checks, including loading access and material at the grip features."""
import tempfile
import unittest
import json
import zipfile
import xml.etree.ElementTree as ET
from pathlib import Path

from main import BODY, USB_C, build_concepts, build_part, depth_x, generate, make_body, x_prism


class CompactGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.specs = {s.original_id: s for s in build_concepts()}
        cls.parts = {n: build_part(s).solids()[0] for n, s in cls.specs.items()}
        cls.blank = make_body().solids()[0]

    def test_three_valid_single_bodies_at_requested_dimensions(self):
        self.assertEqual(set(self.specs), {3, 5, 9})
        for n, part in self.parts.items():
            with self.subTest(n=n):
                self.assertTrue(part.is_valid)
                self.assertEqual(len(part.solids()), 1)
                size = part.bounding_box().size
                for actual, expected in zip((size.X, size.Y, size.Z), (24, 17, 8.4)):
                    self.assertAlmostEqual(actual, expected, places=5)

    def test_pocket_depth_and_solid_central_divider(self):
        for n, part in self.parts.items():
            for side in (-1, 1):
                with self.subTest(n=n, side=side):
                    self.assertFalse(part.is_inside((depth_x(side, 10.79), 0, 0)))
                    self.assertTrue(part.is_inside((depth_x(side, 10.81), 0, 0)))
                    self.assertTrue(part.is_inside((0, 0, 0)))

    def test_original_tip_clearances_remain_smooth(self):
        for n, part in self.parts.items():
            spec = self.specs[n]
            half_w = (USB_C.plug_width + spec.plug_clearance) / 2
            half_h = (USB_C.plug_thickness + spec.plug_clearance) / 2
            for side in (-1, 1):
                x = depth_x(side, 10.4)  # Past side entrance; all four tip-pocket walls exist.
                for axis, half in ((1, half_w), (2, half_h)):
                    for sign in (-1, 1):
                        inside = [x, 0, 0]
                        outside = [x, 0, 0]
                        inside[axis] = sign * (half - 0.01)
                        outside[axis] = sign * (half + 0.01)
                        self.assertFalse(part.is_inside(inside), (n, inside))
                        self.assertTrue(part.is_inside(outside), (n, outside))

    def test_press_fit_preserves_reference_mouth_and_housing(self):
        part = self.parts[3]
        for side in (-1, 1):
            for depth, width, height in ((0.3, 11.25, 5.65), (2.0, 12.2, 6.6)):
                x = depth_x(side, depth)
                self.assertFalse(part.is_inside((x, width / 2 - 0.01, 0)))
                self.assertTrue(part.is_inside((x, width / 2 + 0.01, 0)))
                self.assertFalse(part.is_inside((x, 0, height / 2 - 0.01)))
                self.assertTrue(part.is_inside((x, 0, height / 2 + 0.01)))
            # Both relief slots are 0.8 mm across; they stop before the central divider.
            for sign in (-1, 1):
                self.assertFalse(part.is_inside((depth_x(side, 4), sign * 7.05, 0)))
                self.assertTrue(part.is_inside((depth_x(side, 4), sign * 7.46, 0)))
                self.assertTrue(part.is_inside((depth_x(side, 6.1), sign * 7.05, 0)))

    def test_ribs_are_on_housing_faces_and_have_requested_extent(self):
        part = self.parts[9]
        for side in (-1, 1):
            for depth in (1.3, 2.5):
                x = depth_x(side, depth)
                for sign in (-1, 1):
                    self.assertTrue(part.is_inside((x, sign * 6.05, 0)))
                    self.assertFalse(part.is_inside((x, sign * 5.96, 0)))
                    self.assertFalse(part.is_inside((depth_x(side, depth + 0.41), sign * 6.05, 0)))
                    # Ribs are rooted in the existing floor, rather than hanging under the roof.
                    self.assertTrue(part.is_inside((x, sign * 6.05, -3.9)))
            self.assertFalse(part.is_inside((depth_x(side, 1.9), 6.05, 0)))

    def test_side_entry_tip_can_load_but_cannot_exit_laterally_when_seated(self):
        part = self.parts[5]
        for side in (-1, 1):
            direction = -side
            # A nominal metal plug can travel sideways at the unseated position.
            tip = x_prism(side, 2.4, 9.2, 8.5, 2.8)
            for offset in (0, 2, 4, 6, 8, 10, 14):
                overlap = part.intersect(tip.translate((0, direction * offset, 0)))
                self.assertLess(abs(overlap.volume), 1e-5, (side, offset, overlap.volume))
            # After a 0.8 mm inward slide, the closed wall blocks lateral removal.
            seated = x_prism(side, 3.2, 10.0, 8.5, 2.8)
            self.assertLess(abs(part.intersect(seated).volume), 1e-5)
            self.assertGreater(part.intersect(seated.translate((0, direction, 0))).volume, 0.1)
            # The detents reduce the local gap to 6.25, not the whole side opening.
            x, y = depth_x(side, 1.6), direction * 6.925
            self.assertTrue(part.is_inside((x, y, 3.2)))
            self.assertFalse(part.is_inside((x, y, 3.10)))
            self.assertFalse(part.is_inside((x, direction * 6.3, 3.2)))

    def test_minimum_roof_and_floor_at_all_cut_features(self):
        # Sampling the entire footprint at 0.799 mm below each outside face catches
        # relief, mouth, rib, and side-channel cuts that pierce the 0.8 mm skin.
        for n, part in self.parts.items():
            for xi in range(-23, 24):
                for yi in range(-16, 17):
                    for sign in (-1, 1):
                        point = (xi / 2, yi / 2, sign * (BODY.thickness / 2 - 0.799))
                        if self.blank.is_inside(point):
                            self.assertTrue(part.is_inside(point), (n, point))

    def test_existing_skip_flags_allow_manifest_only_generation(self):
        with tempfile.TemporaryDirectory() as temp:
            folder = Path(temp)
            result = generate(folder, export_mesh=False, export_step_file=False)
            self.assertEqual(len(result), 3)
            self.assertFalse(list(folder.rglob('*.stl')))
            self.assertFalse(list(folder.rglob('*.step')))
            self.assertTrue((folder / 'concepts.json').exists())
            self.assertTrue((folder / 'plate_map.svg').exists())

    def test_delivered_archive_contains_only_the_three_revisions_and_no_stale_toolpaths(self):
        from build_plate import ROOT, verify_project
        path = ROOT / 'generated/v2/compact_connectors_A1_PLA.3mf'
        if not path.exists():
            self.skipTest('Run build_plate.py to produce the native-validated project')
        report = verify_project(path)
        self.assertEqual(len(report['objects']), 3)
        with zipfile.ZipFile(path) as archive:
            names = archive.namelist()
            self.assertEqual(len([p for p in names if p.startswith('3D/Objects/')]), 3)
            self.assertFalse(any('gcode' in p or p.endswith('.png') for p in names))
            settings = ET.fromstring(archive.read('Metadata/model_settings.config'))
            self.assertIsNone(settings.find('assemble'))
            relationships = archive.read('3D/_rels/3dmodel.model.rels').decode()
            self.assertNotIn('ns0:', relationships)
            for rel in ET.fromstring(relationships):
                self.assertIn(rel.attrib['Target'].lstrip('/'), names)
        validation = json.loads((ROOT / 'generated/v2/validation.json').read_text())
        self.assertEqual(validation['slice_warning'], '')
        self.assertFalse(validation['supports_enabled'])


if __name__ == '__main__':
    unittest.main()

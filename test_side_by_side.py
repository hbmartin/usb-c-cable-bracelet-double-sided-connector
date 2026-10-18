"""CAD, insertion, compatibility, and native-project acceptance for #3C."""
import json
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

from build123d import import_step
from main import (build_concepts, build_part, default_output_dir, make_side_by_side_body,
                  plate_centers, print_geometry, side_by_side_local_point,
                  side_by_side_minimums, side_by_side_socket_transform, x_prism)

ROOT = Path(__file__).resolve().parent
VARIANT = 'side-by-side-press-fit'


class SideBySideGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.spec = build_concepts(VARIANT)[0]
        cls.part = build_part(cls.spec)
        cls.blank = make_side_by_side_body()

    def test_valid_single_solid_at_requested_dimensions(self):
        self.assertTrue(self.part.is_valid)
        self.assertEqual(len(self.part.solids()), 1)
        bounds = self.part.bounding_box().size
        for actual, expected in zip((bounds.X, bounds.Y, bounds.Z), (13, 30, 8.4)):
            self.assertAlmostEqual(actual, expected, places=5)

    def test_two_opposite_facing_lanes_and_independent_blind_stops(self):
        self.assertEqual(side_by_side_local_point(-1, 0), (-6.5, -6.5, 0))
        self.assertEqual(side_by_side_local_point(1, 0), (6.5, 6.5, 0))
        for side in (-1, 1):
            self.assertFalse(self.part.is_inside(side_by_side_local_point(side, 0.01)))
            self.assertFalse(self.part.is_inside(side_by_side_local_point(side, 10.79)))
            self.assertTrue(self.part.is_inside(side_by_side_local_point(side, 10.81)))
            self.assertTrue(self.part.is_inside(side_by_side_local_point(side, 12.99)))
            stop_x, _, _ = side_by_side_local_point(side, 10.8)
            self.assertAlmostEqual(6.5-abs(stop_x), 2.2)
        difference = self.blank-self.part
        voids = list(difference.solids()) if hasattr(difference, 'solids') else [s for p in difference for s in p.solids()]
        # Two blind sockets and four separate enclosed relief slots; none merge across lanes.
        self.assertEqual(len(voids), 6)

    def test_winning_socket_dimensions_and_throat_transition(self):
        for side in (-1, 1):
            for depth, width, height in ((0.3, 11.25, 5.65), (2, 12.2, 6.6), (8, 8.65, 2.95)):
                for sign in (-1, 1):
                    with self.subTest(side=side, depth=depth, sign=sign):
                        self.assertFalse(self.part.is_inside(side_by_side_local_point(side, depth, sign*(width/2-.01))))
                        self.assertTrue(self.part.is_inside(side_by_side_local_point(side, depth, sign*(width/2+.01))))
                        self.assertFalse(self.part.is_inside(side_by_side_local_point(side, depth, 0, sign*(height/2-.01))))
                        self.assertTrue(self.part.is_inside(side_by_side_local_point(side, depth, 0, sign*(height/2+.01))))
            # Reference #3's nominal 0.8 mm throat overlaps the housing relief by 0.15 mm.
            self.assertTrue(self.part.is_inside(side_by_side_local_point(side, .64, 5.9)))
            self.assertFalse(self.part.is_inside(side_by_side_local_point(side, .66, 5.9)))
            for sign in (-1, 1):
                self.assertFalse(self.part.is_inside(side_by_side_local_point(side, 4, sign*7.05)))
                self.assertTrue(self.part.is_inside(side_by_side_local_point(side, 4, sign*7.46)))
                self.assertTrue(self.part.is_inside(side_by_side_local_point(side, 6.1, sign*7.05)))

    def test_both_metal_tips_follow_unobstructed_straight_insertion_paths(self):
        seated = []
        for side in (-1, 1):
            for withdrawal in (0, 1, 3, 6, 10, 13):
                tip = side_by_side_socket_transform(x_prism(side, 3.2-withdrawal, 10-withdrawal, 8.5, 2.8), side)
                self.assertLess(abs(self.part.intersect(tip).volume), 1e-6, (side, withdrawal))
                if withdrawal == 0:
                    seated.append(tip)
            housing = side_by_side_socket_transform(x_prism(side, .8, 3.2, 12, 6.4), side)
            self.assertLess(abs(self.part.intersect(housing).volume), 1e-6)
        self.assertGreater(seated[0].distance_to(seated[1]), 0)

    def test_minimum_enclosed_walls_and_inter_lane_separation(self):
        separation, wall = side_by_side_minimums()
        self.assertGreaterEqual(separation, 1)
        self.assertAlmostEqual(separation, (1+.3**2)**.5, places=6)
        self.assertGreaterEqual(wall, .8-1e-6)
        # Probe 0.799 mm beneath both outside faces over the entire footprint.
        for xi in range(-12, 13):
            for yi in range(-29, 30):
                for sign in (-1, 1):
                    point = (xi/2, yi/2, sign*(4.2-.799))
                    if self.blank.is_inside(point):
                        self.assertTrue(self.part.is_inside(point), point)

    def test_flat_centered_print_orientation_and_unchanged_defaults(self):
        self.assertEqual(default_output_dir(VARIANT), Path('generated/v4'))
        self.assertEqual(default_output_dir('compact'), Path('generated/v2'))
        self.assertEqual(default_output_dir('curved-press-fit'), Path('generated/v3'))
        self.assertEqual([s.original_id for s in build_concepts()], [3, 5, 9])
        dimensions, transforms = print_geometry(VARIANT)
        self.assertEqual(dimensions, (13, 30, 8.4))
        self.assertEqual(transforms, [(1, 0, 0, 0, 1, 0, 0, 0, 1, 128, 128, 4.2)])
        self.assertEqual(plate_centers(VARIANT), ((128, 128),))

    def test_previous_curved_model_matches_preserved_step(self):
        spec = build_concepts('curved-press-fit')[0]
        preserved = import_step(ROOT/'generated/v3/step'/f'{spec.slug}.step')
        current = build_part(spec)
        self.assertAlmostEqual(current.volume, preserved.volume, places=6)
        for difference in (current-preserved, preserved-current):
            volume = difference.volume if hasattr(difference, 'volume') else sum(p.volume for p in difference)
            self.assertLess(abs(volume), 1e-5)

    def test_cli_custom_output_and_existing_skip_options(self):
        with tempfile.TemporaryDirectory() as temp:
            output = Path(temp)/'custom'
            result = subprocess.run([sys.executable, str(ROOT/'main.py'), '--variant', VARIANT,
                                     '--output-dir', str(output), '--skip-stl', '--skip-step'],
                                    cwd=ROOT, text=True, capture_output=True, check=True)
            self.assertIn('#3C Side-by-side press-fit', result.stdout)
            self.assertFalse(list(output.rglob('*.stl')))
            self.assertFalse(list(output.rglob('*.step')))
            self.assertTrue((output/'preview.png').exists())
            self.assertTrue((output/'plate_map.svg').exists())
            manifest = json.loads((output/'concepts.json').read_text())
            self.assertEqual(len(manifest), 1)
            self.assertEqual(manifest[0]['variant_id'], '3C')
            self.assertEqual(manifest[0]['dimensions_mm'], [13, 30, 8.4])

    def test_delivered_stl_and_native_project(self):
        from build_plate import stl_mesh, verify_project
        output = ROOT/'generated/v4'
        project = output/'side_by_side_press_fit_3C_A1_PLA.3mf'
        if not project.exists():
            self.skipTest('Generate and build the #3C project first')
        _, count = stl_mesh(output/'stl'/f'{self.spec.slug}.stl')
        self.assertGreater(count, 0)  # stl_mesh independently verifies every edge has two faces.
        report = verify_project(project, VARIANT)
        self.assertEqual(len(report['objects']), 1)
        self.assertEqual(report['objects'][0]['name'], '#3C Side-by-side press-fit')
        with zipfile.ZipFile(project) as archive:
            config = json.loads(archive.read('Metadata/project_settings.config'))
            self.assertEqual(config['curr_bed_type'], 'Textured PEI Plate')
            self.assertEqual(len([n for n in archive.namelist() if n.startswith('3D/Objects/')]), 1)
        validation = json.loads((output/'validation.json').read_text())
        self.assertEqual(validation['layer_count'], 42)
        self.assertEqual(validation['slice_warning'], '')
        self.assertFalse(validation['supports_enabled'])
        self.assertEqual(validation['floating_layer_islands'], [])
        self.assertGreater(validation['bridge_path_starts_checked'], 0)
        self.assertLessEqual(validation['maximum_bridge_start_distance_mm'], .25)
        self.assertLessEqual(validation['maximum_bridge_end_distance_mm'], .25)
        from toolpath_review import read_layers
        layers = read_layers(output/'validated_toolpaths.gcode')
        self.assertEqual(len(layers), 42)
        self.assertTrue(all(layers.values()))
        self.assertTrue(all(120.5 <= point[0] <= 135.5 and 111.5 <= point[1] <= 144.5
                            for segments in layers.values() for segment in segments for point in segment[:2]))


if __name__ == '__main__':
    unittest.main()

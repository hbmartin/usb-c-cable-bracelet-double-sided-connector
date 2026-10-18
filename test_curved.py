"""Acceptance checks for the 15° variation and its independent A1 project."""
import json
from math import acos, atan2, degrees
from pathlib import Path
import tempfile
import unittest

from build123d import GeomType, Plane, Vector, import_step, section
from main import (BODY, build_concepts, build_part, curved_divider_thickness, curved_minimum_enclosed_wall,
                  curved_local_point, curved_socket_transform, default_output_dir,
                  generate, make_curved_body, print_geometry, x_prism)

ROOT = Path(__file__).resolve().parent


class CurvedGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.spec = build_concepts('curved-press-fit')[0]
        cls.part = build_part(cls.spec)

    def test_valid_single_solid_and_finished_dimensions(self):
        self.assertTrue(self.part.is_valid)
        self.assertEqual(len(self.part.solids()), 1)
        bounds = self.part.bounding_box().size
        self.assertAlmostEqual(bounds.X, 24, places=5)
        self.assertAlmostEqual(bounds.Y, 17, places=5)
        self.assertGreater(bounds.Z, 9.6)
        self.assertLess(bounds.Z, 10.0)

    def test_straight_socket_axes_have_fifteen_degree_total_bend(self):
        directions = []
        for side in (-1, 1):
            direction = (Vector(curved_local_point(side, 10)) -
                         Vector(curved_local_point(side, 0))).normalized()
            directions.append(direction)
            self.assertAlmostEqual(degrees(atan2(direction.Z, abs(direction.X))), 7.5)
            midpoint = Vector(curved_local_point(side, 5))
            self.assertLess((midpoint - (Vector(curved_local_point(side, 0)) +
                                        Vector(curved_local_point(side, 10)))/2).length, 1e-8)
        self.assertAlmostEqual(degrees(acos(-directions[0].dot(directions[1]))), 15)

    def test_pockets_have_solid_divider_and_unchanged_depth(self):
        self.assertGreaterEqual(curved_divider_thickness(), 1.0)
        for side in (-1, 1):
            self.assertFalse(self.part.is_inside(curved_local_point(side, 10.79)))
            self.assertTrue(self.part.is_inside(curved_local_point(side, 10.81)))
        for z in (-3.5, -1.5, 0, 3.5):
            self.assertTrue(self.part.is_inside((0, 0, z)))

    def test_center_arc_meets_both_straight_body_sections_tangentially(self):
        edges = section(make_curved_body(), section_by=Plane.XZ).edges()
        arcs = [e for e in edges if e.geom_type == GeomType.CIRCLE and e.radius > 1]
        self.assertEqual(len(arcs), 2)  # Convex outer face and concave wrist face.
        for arc in arcs:
            for end in (0, 1):
                point = arc.position_at(end)
                matches = [(line, t) for line in edges if line.geom_type == GeomType.LINE
                           for t in (0, 1) if (line.position_at(t)-point).length < 1e-6]
                self.assertEqual(len(matches), 1)
                line, t = matches[0]
                self.assertAlmostEqual(abs(arc.tangent_at(end).dot(line.tangent_at(t))), 1, places=6)

    def test_proven_socket_dimensions_in_both_local_frames(self):
        for side in (-1, 1):
            for depth, width, height in ((0.3, 11.25, 5.65), (2, 12.2, 6.6), (8, 8.65, 2.95)):
                with self.subTest(side=side, depth=depth):
                    for sign in (-1, 1):
                        self.assertFalse(self.part.is_inside(curved_local_point(side, depth, sign*(width/2-0.01))))
                        self.assertTrue(self.part.is_inside(curved_local_point(side, depth, sign*(width/2+0.01))))
                        self.assertFalse(self.part.is_inside(curved_local_point(side, depth, 0, sign*(height/2-0.01))))
                        self.assertTrue(self.part.is_inside(curved_local_point(side, depth, 0, sign*(height/2+0.01))))
            # The 0.8 mm throat and 0.8 mm relief slots are rigidly carried with each socket.
            # Preserve the reference's 0.15 mm overlap at the back of the nominal throat.
            self.assertTrue(self.part.is_inside(curved_local_point(side, 0.64, 5.9)))
            self.assertFalse(self.part.is_inside(curved_local_point(side, 0.66, 5.9)))
            for sign in (-1, 1):
                self.assertFalse(self.part.is_inside(curved_local_point(side, 4, sign*7.05)))
                self.assertTrue(self.part.is_inside(curved_local_point(side, 4, sign*7.46)))
                self.assertTrue(self.part.is_inside(curved_local_point(side, 6.1, sign*7.05)))

    def test_metal_tip_can_follow_each_entire_straight_insertion_path(self):
        for side in (-1, 1):
            for withdrawal in (0, 1, 3, 6, 10, 13):
                tip = curved_socket_transform(x_prism(side, 3.2-withdrawal, 10-withdrawal, 8.5, 2.8), side)
                self.assertLess(abs(self.part.intersect(tip).volume), 1e-6, (side, withdrawal))

    def test_nominal_roof_floor_and_solid_curved_center(self):
        self.assertGreaterEqual(curved_minimum_enclosed_wall(), 0.8-1e-6)
        # Probe 0.799 mm below both local outside faces, across cavities and relief slots.
        for side in (-1, 1):
            for depth in (0.9, 1.3, 2, 3.2, 4, 5.9, 6.1, 8, 10, 10.79):
                for y in (-7.4, -7.05, -6.7, -6.1, -4, 0, 4, 6.1, 6.7, 7.05, 7.4):
                    for sign in (-1, 1):
                        point = curved_local_point(side, depth, y, sign*(BODY.thickness/2-0.799))
                        self.assertTrue(self.part.is_inside(point), (side, depth, y, sign))
        self.assertTrue(self.part.is_inside((0, 0, 4.19)))
        self.assertTrue(self.part.is_inside((0, 0, -4.19)))

    def test_original_models_match_preserved_step_geometry(self):
        for spec in build_concepts():
            with self.subTest(spec=spec.slug):
                preserved = import_step(ROOT / 'generated/v2/step' / f'{spec.slug}.step')
                current = build_part(spec)
                self.assertAlmostEqual(current.volume, preserved.volume, places=6)
                for difference in (current - preserved, preserved - current):
                    volume = difference.volume if hasattr(difference, 'volume') else sum(s.volume for s in difference)
                    self.assertLess(abs(volume), 1e-5)

    def test_side_orientation_is_centered_and_on_the_bed(self):
        dimensions, transforms = print_geometry('curved-press-fit')
        self.assertEqual(len(transforms), 1)
        self.assertEqual(dimensions[0], 24)
        self.assertEqual(dimensions[2], 17)
        bounds = make_curved_body().bounding_box()
        transform = transforms[0]
        self.assertAlmostEqual(-bounds.max.Z+transform[10]+dimensions[1]/2, 128)
        self.assertAlmostEqual(bounds.min.Y+transform[11], 0, places=6)

    def test_curved_exports_have_independent_defaults_and_respect_skip_flags(self):
        self.assertEqual(default_output_dir('compact'), Path('generated/v2'))
        self.assertEqual(default_output_dir('curved-press-fit'), Path('generated/v3'))
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp)
            result = generate(out, export_mesh=False, export_step_file=False, variant='curved-press-fit')
            self.assertEqual(len(result), 1)
            self.assertFalse(list(out.rglob('*.stl')))
            self.assertFalse(list(out.rglob('*.step')))
            self.assertTrue((out / 'preview.png').exists())
            manifest = json.loads((out / 'concepts.json').read_text())
            self.assertEqual(manifest[0]['variant_id'], '3B')
            self.assertEqual(manifest[0]['bend_degrees'], 15)
            self.assertGreaterEqual(manifest[0]['center_divider_min_mm'], 1)

    def test_delivered_curved_print_archive(self):
        from build_plate import verify_project
        path = ROOT / 'generated/v3/curved_press_fit_3B_A1_PLA.3mf'
        if not path.exists():
            self.skipTest('Build the curved A1 project first')
        report = verify_project(path, 'curved-press-fit')
        self.assertEqual(len(report['objects']), 1)
        self.assertEqual(report['objects'][0]['name'], '#3B 15° curved press-fit')
        validation = json.loads((path.parent / 'validation.json').read_text())
        self.assertEqual(validation['slice_warning'], '')
        self.assertEqual(validation['layer_count'], 85)
        self.assertFalse(validation['supports_enabled'])
        self.assertEqual(validation['floating_layer_islands'], [])
        self.assertGreater(validation['bridge_path_starts_checked'], 0)
        self.assertLessEqual(validation['maximum_bridge_start_distance_mm'], 0.25)
        self.assertLessEqual(validation['maximum_bridge_end_distance_mm'], 0.25)
        from toolpath_review import read_layers
        layers = read_layers(path.parent / 'validated_toolpaths.gcode')
        self.assertEqual(len(layers), 85)
        self.assertTrue(all(segments for segments in layers.values()))
        self.assertTrue(all(115 <= point[0] <= 141 and 121 <= point[1] <= 135
                            for segments in layers.values() for segment in segments
                            for point in segment[:2]))


if __name__ == '__main__':
    unittest.main()

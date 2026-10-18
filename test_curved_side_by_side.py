"""CAD fit, independent sockets, preservation, and native print acceptance for #3D."""
import json
from math import acos, atan2, degrees
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

from build123d import Axis, GeomType, Plane, Vector, import_step, section
from main import (CURVED_SIDE_BY_SIDE_PRINT_ANGLE, VARIANTS, build_concepts, build_part,
                  curved_side_by_side_local_point,
                  curved_side_by_side_minimums, curved_side_by_side_radius,
                  curved_side_by_side_socket_transform, default_output_dir,
                  make_curved_side_by_side_body, print_geometry, x_prism)

ROOT = Path(__file__).resolve().parent
VARIANT = 'curved-side-by-side-press-fit'


class CurvedSideBySideGeometryTests(unittest.TestCase):
    @classmethod
    def setUpClass(cls):
        cls.spec = build_concepts(VARIANT)[0]
        cls.part = build_part(cls.spec)
        cls.blank = make_curved_side_by_side_body()

    def test_single_valid_solid_and_curved_faces_at_selected_dimensions(self):
        self.assertTrue(self.part.is_valid)
        self.assertEqual(len(self.part.solids()), 1)
        bounds = self.part.bounding_box().size
        self.assertAlmostEqual(bounds.X, 15.2, places=5)
        self.assertAlmostEqual(bounds.Y, 30, places=5)
        self.assertAlmostEqual(bounds.Z, 9.774, places=3)
        edges = section(self.blank, section_by=Plane.XZ).edges()
        radii = sorted(e.radius for e in edges if e.geom_type == GeomType.CIRCLE and e.radius > 10)
        self.assertEqual(len(radii), 2)
        self.assertAlmostEqual(radii[1]-radii[0], 9.4, places=6)
        self.assertAlmostEqual(sum(radii)/2, curved_side_by_side_radius(), places=6)

    def test_straight_axes_are_offset_thirteen_mm_and_counter_tilted_fifteen_degrees(self):
        directions = []
        for side in (-1, 1):
            start = Vector(curved_side_by_side_local_point(side, 0))
            end = Vector(curved_side_by_side_local_point(side, 10))
            midpoint = Vector(curved_side_by_side_local_point(side, 5))
            direction = (end-start).normalized()
            directions.append(direction)
            self.assertAlmostEqual(start.Y, side*6.5)
            self.assertAlmostEqual(end.Y, side*6.5)
            self.assertLess((midpoint-(start+end)/2).length, 1e-8)
            self.assertAlmostEqual(degrees(atan2(direction.Z, abs(direction.X))), 7.5)
        self.assertAlmostEqual(degrees(acos(-directions[0].dot(directions[1]))), 15)

    def test_independent_blind_pockets_and_material_at_all_required_minimums(self):
        removed = self.blank-self.part
        voids = list(removed.solids()) if hasattr(removed, 'solids') else [s for p in removed for s in p.solids()]
        self.assertEqual(len(voids), 6)  # Two sockets and four enclosed, independent relief slots.
        minimums = curved_side_by_side_minimums()
        self.assertAlmostEqual(minimums['inter_lane_void_separation_mm'], 1.225, places=6)
        self.assertGreaterEqual(minimums['enclosed_wall_mm'], .8-1e-6)
        self.assertGreaterEqual(minimums['curved_skin_wall_mm'], .8)
        self.assertGreaterEqual(minimums['closed_end_wall_mm'], 2.2)
        for side in (-1, 1):
            self.assertFalse(self.part.is_inside(curved_side_by_side_local_point(side, 10.79)))
            self.assertTrue(self.part.is_inside(curved_side_by_side_local_point(side, 10.81)))

    def test_winning_socket_sizes_throat_overlap_and_relief_slots_in_both_frames(self):
        for side in (-1, 1):
            for depth, width, height in ((.3, 11.25, 5.65), (2, 12.2, 6.6), (8, 8.65, 2.95)):
                for sign in (-1, 1):
                    with self.subTest(side=side, depth=depth, sign=sign):
                        self.assertFalse(self.part.is_inside(curved_side_by_side_local_point(side, depth, sign*(width/2-.01))))
                        self.assertTrue(self.part.is_inside(curved_side_by_side_local_point(side, depth, sign*(width/2+.01))))
                        self.assertFalse(self.part.is_inside(curved_side_by_side_local_point(side, depth, 0, sign*(height/2-.01))))
                        self.assertTrue(self.part.is_inside(curved_side_by_side_local_point(side, depth, 0, sign*(height/2+.01))))
            self.assertTrue(self.part.is_inside(curved_side_by_side_local_point(side, .64, 5.9)))
            self.assertFalse(self.part.is_inside(curved_side_by_side_local_point(side, .66, 5.9)))
            for sign in (-1, 1):
                self.assertFalse(self.part.is_inside(curved_side_by_side_local_point(side, 4, sign*7.05)))
                self.assertFalse(self.part.is_inside(curved_side_by_side_local_point(side, 4, sign*7.44)))
                self.assertTrue(self.part.is_inside(curved_side_by_side_local_point(side, 4, sign*7.46)))
                self.assertTrue(self.part.is_inside(curved_side_by_side_local_point(side, 6.01, sign*7.05)))

    def test_continuous_metal_insertion_sweep_and_seated_housings_are_clear(self):
        for side in (-1, 1):
            # The swept tip fills every depth visited during insertion, rather than just sampled poses.
            tip_sweep = curved_side_by_side_socket_transform(x_prism(side, -7, 10, 8.5, 2.8), side)
            self.assertLess(abs(self.part.intersect(tip_sweep).volume), 1e-6)
            housing = curved_side_by_side_socket_transform(x_prism(side, .8, 3.2, 12, 6.4), side)
            self.assertLess(abs(self.part.intersect(housing).volume), 1e-6)
            swept_housing = curved_side_by_side_socket_transform(x_prism(side, -1, 3.2, 12, 6.4), side)
            self.assertGreater(self.part.intersect(swept_housing).volume, 1)  # Reference throat interference remains.

    def test_end_face_print_orientation_is_centered_flat_and_on_bed(self):
        dimensions, transforms = print_geometry(VARIANT)
        a = transforms[0]
        oriented = self.blank.rotate(Axis.Y, CURVED_SIDE_BY_SIDE_PRINT_ANGLE).translate(tuple(a[9:]))
        bounds = oriented.bounding_box()
        self.assertAlmostEqual(bounds.min.Z, 0, places=6)
        for lo, hi in ((bounds.min.X, bounds.max.X), (bounds.min.Y, bounds.max.Y)):
            self.assertAlmostEqual((lo+hi)/2, 128, places=6)
        for actual, expected in zip(bounds.size, dimensions):
            self.assertAlmostEqual(actual, expected, places=6)
        self.assertAlmostEqual(dimensions[2], 15.076806, places=5)
        bottom_faces = [f for f in oriented.faces() if f.geom_type == GeomType.PLANE and f.normal_at().Z < -.999]
        self.assertEqual(len(bottom_faces), 1)
        self.assertGreater(bottom_faces[0].area, 200)

    def test_previous_side_by_side_model_and_defaults_are_preserved(self):
        self.assertEqual(VARIANTS[:3], ('compact', 'curved-press-fit', 'side-by-side-press-fit'))
        self.assertEqual(default_output_dir(VARIANT), Path('generated/v5'))
        self.assertEqual([s.original_id for s in build_concepts()], [3, 5, 9])
        spec = build_concepts('side-by-side-press-fit')[0]
        preserved = import_step(ROOT/'generated/v4/step'/f'{spec.slug}.step')
        current = build_part(spec)
        self.assertAlmostEqual(current.volume, preserved.volume, places=6)
        for difference in (current-preserved, preserved-current):
            volume = difference.volume if hasattr(difference, 'volume') else sum(p.volume for p in difference)
            self.assertLess(abs(volume), 1e-5)

    def test_custom_output_and_skip_flags_include_illustrations_and_validation(self):
        with tempfile.TemporaryDirectory() as temp:
            output = Path(temp)/'custom'
            result = subprocess.run([sys.executable, str(ROOT/'main.py'), '--variant', VARIANT,
                                     '--output-dir', str(output), '--skip-stl', '--skip-step'],
                                    cwd=ROOT, text=True, capture_output=True, check=True)
            self.assertIn('#3D 15° curved side-by-side press-fit', result.stdout)
            self.assertFalse(list(output.rglob('*.stl')))
            self.assertFalse(list(output.rglob('*.step')))
            for name in ('preview.png', 'side_sections.png', 'plate_map.svg', 'geometry_validation.json'):
                self.assertTrue((output/name).exists(), name)
            manifest = json.loads((output/'concepts.json').read_text())[0]
            self.assertEqual(manifest['variant_id'], '3D')
            self.assertEqual(manifest['dimensions_mm'], [15.2, 30, 9.774])
            self.assertEqual(manifest['infill_density_percent'], 20)

    def test_native_project_closed_stl_print_settings_and_unblocked_toolpaths(self):
        from build_plate import CURVED_SIDE_BY_SIDE_SETTINGS, stl_mesh, verify_project
        output = ROOT/'generated/v5'
        path = output/'curved_side_by_side_press_fit_3D_A1_PLA.3mf'
        self.assertTrue(path.exists(), 'Build the #3D project before acceptance tests')
        stl_mesh(output/'stl'/f'{self.spec.slug}.stl')
        report = verify_project(path, VARIANT)
        self.assertEqual(len(report['objects']), 1)
        self.assertEqual(report['objects'][0]['name'], self.spec.title)
        with zipfile.ZipFile(path) as archive:
            config = json.loads(archive.read('Metadata/project_settings.config'))
        for key, value in CURVED_SIDE_BY_SIDE_SETTINGS.items():
            self.assertEqual(config[key], value)
        validation = json.loads((output/'validation.json').read_text())
        self.assertEqual(validation['slice_warning'], '')
        self.assertFalse(validation['supports_enabled'])
        self.assertEqual(validation['floating_layer_islands'], [])
        review = json.loads((output/'toolpath_review.json').read_text())
        self.assertEqual(review['blocked_socket_core_probes'], [])
        self.assertEqual(review['socket_clearance_probes_checked'], 180)
        self.assertGreaterEqual(review['minimum_probe_clearance_to_extrusion_mm'], .1)
        self.assertLessEqual(review['maximum_bridge_start_distance_mm'], .25)
        self.assertLessEqual(review['maximum_bridge_end_distance_mm'], .25)

    def test_toolpath_probe_detects_a_blocked_bed_facing_mouth(self):
        from toolpath_review import check_curved_side_by_side_openings
        fake = {.4: [((120, 121.5), (136, 121.5), .42, 'Inner wall')]}
        report = check_curved_side_by_side_openings(fake)
        self.assertTrue(report['blocked_socket_core_probes'])
        self.assertTrue(any(p['side'] == -1 for p in report['blocked_socket_core_probes']))

    def test_project_rejects_strength_overrides_that_studio_would_drop(self):
        from build_plate import verify_project
        source = ROOT/'generated/v5/curved_side_by_side_press_fit_3D_A1_PLA.3mf'
        with tempfile.TemporaryDirectory() as temp:
            destination = Path(temp)/'missing_studio_overrides.3mf'
            with zipfile.ZipFile(source) as original, zipfile.ZipFile(destination, 'w') as broken:
                for info in original.infolist():
                    data = original.read(info.filename)
                    if info.filename == 'Metadata/project_settings.config':
                        config = json.loads(data)
                        config['different_settings_to_system'][0] = ''
                        data = json.dumps(config).encode()
                    broken.writestr(info, data)
            with self.assertRaisesRegex(AssertionError, 'Studio import metadata'):
                verify_project(destination, VARIANT)


if __name__ == '__main__':
    unittest.main()

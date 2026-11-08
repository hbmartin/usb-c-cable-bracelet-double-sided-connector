"""#3F exterior reduction, unchanged plug fit, preserved exports, and A1 acceptance."""
import hashlib
import json
from math import acos, degrees
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

from build123d import Axis, Vector
from main import build_concepts, build_part, default_output_dir, print_geometry
import right_angle as reference
import right_angle_compact as compact

ROOT = Path(__file__).resolve().parent
OUTPUT = ROOT/'generated/v8'


def volume(shape):
    return shape.volume if hasattr(shape, 'volume') else sum(volume(piece) for piece in shape)


class CompactRightAngleTests(unittest.TestCase):
    def test_all_fits_are_single_solids_with_required_walls_and_smaller_volume(self):
        for fit in compact.FITS:
            with self.subTest(fit=fit):
                report = compact.geometry_report(fit)
                self.assertTrue(report['valid'])
                self.assertEqual(report['solid_count'], 1)
                self.assertEqual(report['dimensions_mm'], [13.6, 27.2, 9.197879])
                self.assertEqual(report['independent_removed_void_count'], 6)
                self.assertGreaterEqual(report['enclosed_wall_mm'], .8-1e-6)
                self.assertAlmostEqual(report['closed_end_wall_mm'], 2.4, places=6)
                self.assertGreaterEqual(report['inter_lane_void_separation_mm'], 1)
                self.assertGreater(report['volume_reduction_percent'], 13)
                self.assertLess(report['volume_reduction_percent'], 16)
                self.assertGreater(report['taper_only_removed_material_mm3'], 100)

    def test_tapers_remove_only_outer_rear_flanks_and_keep_the_central_bridge(self):
        body = compact.blank()
        for side in (-1, 1):
            for depth in (1, 3, 5.8):
                self.assertTrue(body.is_inside(compact.local_point(side, depth, side*6, 0)))
            for depth in (10.8, 12):
                self.assertFalse(body.is_inside(compact.local_point(side, depth, side*6, 0)))
                self.assertTrue(body.is_inside(compact.local_point(side, depth, side*4.8, 0)))
        # Between the relief-slot ends the full center bridge remains solid.
        # Near the mouths those slots intentionally cross the Z=0 center plane;
        # the uninterrupted outer skins connect the socket sections there.
        for x in (-.5, 0, .5):
            self.assertTrue(compact.build_holder().is_inside((x, 0, 0)))
        for x in (-5, 0, 5):
            for z in (-3.4, 3.4):
                self.assertTrue(compact.build_holder().is_inside((x, 0, z)))

    def test_complete_socket_cutters_are_rigid_translations_of_inverted_3e(self):
        normals = []
        for fit in compact.FITS:
            for side, lane, old in zip((-1, 1), compact.cutters(fit), reference.cutters(fit, inverted=True), strict=True):
                for cutter, previous in zip(lane, old, strict=True):
                    restored = cutter.translate((side*.5, 0, 0))
                    self.assertLess(abs((restored-previous).volume), 1e-6)
                    self.assertLess(abs((previous-restored).volume), 1e-6)
                self.assertEqual(compact.pod_roll(side), reference.pod_roll(side, inverted=True))
                normal = max(lane[0].faces(), key=lambda f:f.normal_at().Z).normal_at()
                if fit == 'standard':
                    normals.append(normal)
                local = lane[0].translate(tuple(-Vector(compact.local_point(side, 0)))).rotate(Axis.X, -compact.pod_roll(side))
                self.assertAlmostEqual(local.bounding_box().size.Y, 8.25, places=6)
                self.assertAlmostEqual(local.bounding_box().size.Z, 2.45, places=6)
        self.assertAlmostEqual(degrees(acos(normals[0].dot(normals[1]))), 15, places=6)
        report = compact.geometry_report()
        self.assertEqual(report['section_roll_degrees'], [-7.5, 7.5])
        self.assertEqual(report['insertion_axis_directions'], [(1, 0, 0), (-1, 0, 0)])

    def test_insertion_sweeps_and_throat_only_interference_are_unchanged(self):
        for fit in compact.FITS:
            part = compact.build_holder(fit)
            for side in (-1, 1):
                for withdrawal in (0, .5, 2, 5, 8, 11, 14):
                    tip = compact.prism(side, 2-withdrawal, 10.4-withdrawal, 8.1, 2.3)
                    self.assertLess(abs(part.intersect(tip).volume), 1e-6)
                interference = part.intersect(compact.prism(side, -.5, 2, 9.9, 4.7))
                old = reference.build_holder(fit, inverted=True).intersect(
                    reference.prism(side, -.5, 2, 9.9, 4.7, inverted=True))
                self.assertGreater(interference.volume, 0)
                self.assertAlmostEqual(interference.volume, old.volume, places=5)
                self.assertLess(abs(volume(interference-compact.prism(side, -.01, .65, 20, 10))), 1e-6)
                self.assertFalse(part.is_inside(compact.local_point(side, 11.19)))
                self.assertTrue(part.is_inside(compact.local_point(side, 11.21)))
            self.assertGreaterEqual(compact.geometry_report(fit)['silver_elbow_standoff_mm'], .5-1e-6)
        self.assertEqual(compact.E.capture, 2)
        self.assertAlmostEqual(compact.E.pocket_depth-compact.E.capture-compact.E.metal_length, .8)

    def test_closed_meshes_all_fits_and_cli_fit_skip_options(self):
        from build_plate import plate_items, stl_mesh
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp)
            for fit in compact.FITS:
                path = out/f'{fit}.stl'
                mesh = compact.export_mesh(compact.build_holder(fit), path)
                self.assertLess(mesh['maximum_coordinate_adjustment_mm'], .000001)
                self.assertGreater(stl_mesh(path)[1], 0)
                self.assertEqual(plate_items(out, compact.COMPACT, fit)[0].spec.fit, fit)
                spec = build_concepts(compact.COMPACT, fit)[0]
                self.assertIn('#3F', spec.title)
                self.assertAlmostEqual(build_part(spec).volume, compact.build_holder(fit).volume)
            subprocess.run([sys.executable, str(ROOT/'main.py'), '--variant', compact.COMPACT,
                            '--fit', 'gentle', '--output-dir', str(out/'custom'), '--skip-step', '--skip-stl'],
                           cwd=ROOT, check=True, capture_output=True, text=True)
            manifest = json.loads((out/'custom/concepts.json').read_text())[0]
            self.assertEqual(manifest['variant_id'], '3F')
            self.assertEqual(manifest['fit'], 'gentle')
            self.assertEqual(manifest['mouth_width_height_mm'], [9.75, 4.55])
            self.assertFalse(list(out.rglob('*.step')))
            self.assertFalse(list((out/'custom').rglob('*.stl')))
            self.assertTrue((out/'custom/comparison.png').exists())

    def test_centered_negative_x_face_layout_and_native_slice(self):
        from build_plate import verify_project
        dimensions, transforms, centers = compact.layout()
        self.assertEqual(print_geometry(compact.COMPACT), (dimensions, transforms))
        self.assertEqual(default_output_dir(compact.COMPACT), Path('generated/v8'))
        bounds = compact.build_holder().rotate(Axis.Y, -90).translate(transforms[0][9:]).bounding_box()
        self.assertAlmostEqual(bounds.min.Z, 0, places=6)
        self.assertAlmostEqual(bounds.size.Z, 13.6, places=6)
        self.assertAlmostEqual((bounds.min.X+bounds.max.X)/2, 128, places=6)
        self.assertAlmostEqual((bounds.min.Y+bounds.max.Y)/2, 128, places=6)
        project = OUTPUT/'compact_tapered_press_fit_3F_A1_PLA.3mf'
        self.assertEqual(len(verify_project(project, compact.COMPACT)['objects']), 1)
        with zipfile.ZipFile(project) as archive:
            config = json.loads(archive.read('Metadata/project_settings.config'))
            for key, value in compact.PRINT_SETTINGS.items():
                self.assertEqual(config[key], value)
        validation = json.loads((OUTPUT/'validation.json').read_text())
        self.assertEqual(validation['layer_count'], 68)
        self.assertEqual(validation['socket_clearance_probes_checked'], 180)
        self.assertEqual(validation['blocked_socket_core_probes'], [])
        self.assertEqual(validation['floating_layer_islands'], [])
        self.assertEqual(validation['slice_warning'], '')
        self.assertFalse(validation['supports_enabled'])
        self.assertLessEqual(validation['maximum_bridge_start_distance_mm'], .25)
        self.assertLessEqual(validation['maximum_bridge_end_distance_mm'], .25)
        # A plug-core obstruction must be detected at #3F's translated mouth,
        # rather than at the original #3E coordinate frame.
        from toolpath_review import check_right_angle_openings, read_layers
        layers = read_layers(OUTPUT/'validated_toolpaths.gcode')
        a = transforms[0]
        point = compact.local_point(-1, .5)
        x, y = a[0]*point[0]+a[6]*point[2]+a[9], point[1]+a[10]
        for height in layers:
            if .4<=height<=.8:
                layers[height].append(((x-2, y), (x+2, y), 1., 'Outer wall'))
        self.assertTrue(check_right_angle_openings(layers, compact.COMPACT)['blocked_socket_core_probes'])

    def test_all_previous_generated_files_remain_identical(self):
        hashes = json.loads((OUTPUT/'preservation_validation.json').read_text())['previous_export_sha256']
        self.assertTrue(any(p.startswith('generated/v7/') for p in hashes))
        for path, expected in hashes.items():
            self.assertEqual(hashlib.sha256((ROOT/path).read_bytes()).hexdigest(), expected, path)


if __name__ == '__main__':
    unittest.main()

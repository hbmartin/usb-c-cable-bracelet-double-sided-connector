"""Inverted #3E geometry, preserved fits, CLI compatibility, and native slice acceptance."""
import hashlib
import json
from math import acos, degrees, radians
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

from build123d import Axis, GeomType, Plane, Vector, export_stl, section
from main import build_concepts, build_part, default_output_dir, print_geometry
from right_angle import (E, FITS, HOLDER, INVERTED, PRINT_SETTINGS, blank, build_holder,
                         cutters, geometry_report, layout, local_point, pod_roll, prism)

ROOT = Path(__file__).resolve().parent
OUTPUT = ROOT/'generated/v7'


def volume(shape):
    return shape.volume if hasattr(shape, 'volume') else sum(volume(piece) for piece in shape)


class InvertedRightAngleTests(unittest.TestCase):
    def test_all_fits_are_exact_reflections_and_retain_required_material(self):
        for fit in FITS:
            with self.subTest(fit=fit):
                original = build_holder(fit)
                inverted = build_holder(fit, inverted=True)
                restored = inverted.mirror(Plane.XY)
                self.assertLess(abs(volume(restored-original)), 1e-6)
                self.assertLess(abs(volume(original-restored)), 1e-6)
                self.assertAlmostEqual(inverted.volume, original.volume, places=6)
                report = geometry_report(fit, inverted=True)
                self.assertTrue(report['valid'])
                self.assertTrue(report['inverted_bend'])
                self.assertEqual(report['solid_count'], 1)
                self.assertEqual(report['dimensions_mm'], [14.6,27.2,9.197879])
                self.assertEqual(report['independent_removed_void_count'], 6)
                self.assertGreaterEqual(report['enclosed_wall_mm'], .8-1e-6)
                self.assertAlmostEqual(report['inter_lane_void_separation_mm'], 1.195840973, places=6)
                self.assertAlmostEqual(report['closed_end_wall_mm'], 3.4, places=6)
                self.assertLess(report['body_outside_mouth_planes_mm3'], 1e-6)
                self.assertGreaterEqual(report['silver_elbow_standoff_mm'], .5-1e-6)
                for key in ('enclosed_skin_wall_mm','enclosed_relief_wall_mm','closed_end_wall_mm'):
                    self.assertAlmostEqual(report[key],geometry_report(fit)[key],places=6)

    def test_measured_socket_axes_stay_parallel_and_wide_faces_reverse_roll(self):
        normals = []
        for side,lane in zip((-1,1),cutters(inverted=True),strict=True):
            caps = [f for f in lane[0].faces() if abs(f.normal_at().X)>.999999]
            self.assertEqual(len(caps),2)
            axis = caps[1].center()-caps[0].center()
            self.assertAlmostEqual(axis.Y,0,places=6)
            self.assertAlmostEqual(axis.Z,0,places=6)
            normal = max(lane[0].faces(),key=lambda f:f.normal_at().Z).normal_at()
            self.assertAlmostEqual(normal.X,0,places=6)
            self.assertEqual(normal.Y>0,side<0)
            normals.append(normal)
            self.assertEqual(local_point(side,0,inverted=True)[1],side*6)
            self.assertAlmostEqual(local_point(side,0,inverted=True)[2],-local_point(side,0)[2])
            self.assertEqual(pod_roll(side,inverted=True),-pod_roll(side))
        self.assertAlmostEqual(degrees(acos(normals[0].dot(normals[1]))),15,places=6)
        report = geometry_report(inverted=True)
        self.assertEqual(report['section_roll_degrees'],[-7.5,7.5])
        self.assertEqual(report['bend_axis'],'X')
        self.assertEqual(report['insertion_axis_directions'],[(1,0,0),(-1,0,0)])
        self.assertTrue(report['insertion_axes_parallel'])
        self.assertEqual(geometry_report()['section_roll_degrees'],[7.5,-7.5])

    def test_both_curved_faces_dip_only_in_the_central_tangent_transition(self):
        for x in (-3,0,3):
            cut = section(blank(inverted=True),section_by=Plane.YZ.offset(x))
            arcs = [e for e in cut.edges() if e.geom_type==GeomType.CIRCLE and abs(e.center().Y)<1.4]
            self.assertEqual(len(arcs),2)
            self.assertAlmostEqual(sum(e.length for e in arcs),2*E.center_radius*radians(15),places=5)
            lines = [e for e in cut.edges() if e.geom_type==GeomType.LINE and e.length>10]
            for arc in arcs:
                self.assertLessEqual(max(abs(arc.bounding_box().min.Y),abs(arc.bounding_box().max.Y)),1.3)
                self.assertLess(arc.position_at(.5).Z,arc.position_at(0).Z)
                for end in (0,1):
                    point = arc.position_at(end)
                    adjacent = min(lines,key=lambda e:min((e.position_at(0)-point).length,(e.position_at(1)-point).length))
                    self.assertAlmostEqual(abs(arc.tangent_at(end).dot(adjacent.tangent_at(.5))),1,places=6)

    def test_each_complete_socket_is_rigidly_rotated_with_the_same_fit(self):
        for fit,mouth in FITS.items():
            part = build_holder(fit,inverted=True)
            for side,lane,original_lane in zip((-1,1),cutters(fit,inverted=True),cutters(fit),strict=True):
                for cutter,reference in zip(lane,original_lane,strict=True):
                    aligned = cutter.translate(tuple(-Vector(local_point(side,0,inverted=True)))).rotate(Axis.X,-pod_roll(side,inverted=True))
                    reference = reference.translate(tuple(-Vector(local_point(side,0)))).rotate(Axis.X,-pod_roll(side))
                    self.assertLess(abs(volume(aligned-reference)),1e-6)
                    self.assertLess(abs(volume(reference-aligned)),1e-6)
                for depth,(width,height) in ((.3,mouth),(1.2,E.base_cavity),(8,E.metal_cavity)):
                    for sign in (-1,1):
                        for y,z in ((sign*(width/2-.01),0),(0,sign*(height/2-.01))):
                            self.assertFalse(part.is_inside(local_point(side,depth,y,z,inverted=True)))
                        for y,z in ((sign*(width/2+.01),0),(0,sign*(height/2+.01))):
                            self.assertTrue(part.is_inside(local_point(side,depth,y,z,inverted=True)))
                for withdrawal in (0,.5,2,5,8,11,14):
                    tip = prism(side,2-withdrawal,10.4-withdrawal,8.1,2.3,inverted=True)
                    self.assertLess(abs(volume(part.intersect(tip))),1e-6)
                base = prism(side,-.5,2,9.9,4.7,inverted=True)
                interference = part.intersect(base)
                self.assertGreater(volume(interference),0)
                self.assertLess(abs(volume(interference-prism(side,-.01,.65,20,10,inverted=True))),1e-6)
                self.assertFalse(part.is_inside(local_point(side,11.19,inverted=True)))
                self.assertTrue(part.is_inside(local_point(side,11.21,inverted=True)))
        self.assertAlmostEqual(E.capture,2)
        self.assertAlmostEqual(E.pocket_depth-E.capture-E.metal_length,.8)
        self.assertAlmostEqual(E.base_length-E.capture,.5)

    def test_layout_centers_the_mirrored_holder_on_the_negative_x_end(self):
        dimensions,transforms,centers = layout(INVERTED)
        self.assertEqual(centers,((128.,128.),))
        self.assertEqual(print_geometry(INVERTED),(dimensions,transforms))
        bound = build_holder(inverted=True).rotate(Axis.Y,-90).translate(transforms[0][9:]).bounding_box()
        self.assertAlmostEqual(bound.min.Z,0,places=6)
        self.assertAlmostEqual((bound.min.X+bound.max.X)/2,128,places=6)
        self.assertAlmostEqual((bound.min.Y+bound.max.Y)/2,128,places=6)
        for actual,expected in zip(bound.size,(9.197879,27.2,14.6),strict=True):
            self.assertAlmostEqual(actual,expected,places=5)
        for fit in FITS:
            spec = build_concepts(INVERTED,fit)[0]
            self.assertTrue(spec.inverted_bend)
            self.assertIn('Inverted',spec.title)
            self.assertIn('inverted',spec.slug)
            self.assertAlmostEqual(build_part(spec).volume,build_holder(fit,inverted=True).volume)
        self.assertEqual(default_output_dir(INVERTED),Path('generated/v7'))
        self.assertEqual(default_output_dir(HOLDER),Path('generated/v6'))

    def test_all_fits_have_closed_meshes_and_cli_skip_flags_still_work(self):
        from build_plate import plate_items,stl_mesh
        with tempfile.TemporaryDirectory() as temp:
            out = Path(temp)
            for fit in FITS:
                path = out/f'{fit}.stl'
                export_stl(build_holder(fit,inverted=True),path,tolerance=.02,angular_tolerance=.1)
                self.assertGreater(stl_mesh(path)[1],0)
                self.assertEqual(plate_items(out,INVERTED,fit)[0].spec.fit,fit)
            subprocess.run([sys.executable,str(ROOT/'main.py'),'--variant',INVERTED,'--fit','gentle',
                            '--output-dir',str(out/'custom'),'--skip-step','--skip-stl'],
                           cwd=ROOT,check=True,capture_output=True,text=True)
            manifest = json.loads((out/'custom/concepts.json').read_text())[0]
            self.assertTrue(manifest['inverted_bend'])
            self.assertEqual(manifest['fit'],'gentle')
            self.assertEqual(manifest['section_roll_degrees'],[-7.5,7.5])
            self.assertEqual(manifest['bend_direction'],'center dips')
            self.assertTrue((out/'custom/bend_comparison.png').exists())
            self.assertFalse(list((out/'custom').rglob('*.stl')))
            self.assertFalse(list((out/'custom').rglob('*.step')))

    def test_project_and_slice_have_settings_clear_socket_cores_and_anchored_bridges(self):
        from build_plate import verify_project
        path = OUTPUT/'right_angle_press_fit_3E_inverted_A1_PLA.3mf'
        report = verify_project(path,INVERTED)
        self.assertEqual(len(report['objects']),1)
        with zipfile.ZipFile(path) as archive:
            config = json.loads(archive.read('Metadata/project_settings.config'))
            for key,value in PRINT_SETTINGS.items():
                self.assertEqual(config[key],value)
        validation = json.loads((OUTPUT/'validation.json').read_text())
        self.assertEqual(validation['geometry']['section_roll_degrees'],[-7.5,7.5])
        self.assertEqual(validation['layer_count'],73)
        self.assertEqual(validation['socket_clearance_probes_checked'],180)
        self.assertEqual(validation['blocked_socket_core_probes'],[])
        self.assertEqual(validation['floating_layer_islands'],[])
        self.assertEqual(validation['slice_warning'],'')
        self.assertFalse(validation['supports_enabled'])
        self.assertGreater(validation['bridge_path_starts_checked'],0)
        self.assertLessEqual(validation['maximum_bridge_start_distance_mm'],.25)
        self.assertLessEqual(validation['maximum_bridge_end_distance_mm'],.25)
        from toolpath_review import check_right_angle_openings,read_layers
        layers = read_layers(OUTPUT/'validated_toolpaths.gcode')
        _,transforms,_ = layout(INVERTED)
        a = transforms[0]
        point = local_point(-1,.5,inverted=True)
        x,y = a[0]*point[0]+a[6]*point[2]+a[9],point[1]+a[10]
        for z in layers:
            if .4<=z<=.8:
                layers[z].append(((x-2,y),(x+2,y),1.,'Outer wall'))
        self.assertTrue(check_right_angle_openings(layers,INVERTED)['blocked_socket_core_probes'])

    def test_all_previous_exports_including_current_3e_and_samples_are_preserved(self):
        hashes = json.loads((OUTPUT/'preservation_validation.json').read_text())['previous_export_sha256']
        self.assertTrue(any(name.startswith('generated/v6/fit_samples/') for name in hashes))
        self.assertTrue(any(name.startswith('generated/v6/combined_plate/') for name in hashes))
        for name,expected in hashes.items():
            self.assertEqual(hashlib.sha256((ROOT/name).read_bytes()).hexdigest(),expected,name)


if __name__=='__main__':
    unittest.main()

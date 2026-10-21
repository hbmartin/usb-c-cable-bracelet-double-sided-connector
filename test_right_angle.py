"""Measured #3E fits, metal insertion sweeps, preservation, and native print acceptance."""
import hashlib
import json
from math import acos, degrees, radians
from pathlib import Path
import subprocess
import sys
import tempfile
import unittest
import zipfile

from build123d import Axis, GeomType, Plane, Vector, export_stl, import_step, section
from main import build_concepts, build_part, default_output_dir, generate, print_geometry, USB_C
from right_angle import (E, FITS, HOLDER, SAMPLES, PRINT_SETTINGS, blank, build_holder, cutters,
                         geometry_report, layout, local_point, prism, radius, pod_roll, COMBINED, combined_layout)

ROOT = Path(__file__).resolve().parent


def volume(shape):
    return shape.volume if hasattr(shape,'volume') else sum(volume(piece) for piece in shape)


class RightAngleGeometryTests(unittest.TestCase):
    def test_all_six_models_are_valid_with_required_dimensions_and_material(self):
        for sample in (False,True):
            for fit in FITS:
                with self.subTest(sample=sample,fit=fit):
                    report=geometry_report(fit,sample)
                    self.assertTrue(report['valid'])
                    self.assertEqual(report['solid_count'],1)
                    self.assertEqual(report['dimensions_mm'],[14.6,14.4 if sample else 27.2,7.6 if sample else 9.197879])
                    self.assertEqual(report['independent_removed_void_count'],3 if sample else 6)
                    self.assertGreaterEqual(report['enclosed_wall_mm'],.8-1e-6)
                    self.assertGreaterEqual(report['closed_end_wall_mm'],2.2)
                    if not sample:
                        self.assertAlmostEqual(report['inter_lane_void_separation_mm'],1.195840973,places=6)
                    self.assertGreaterEqual(report['enclosed_skin_wall_mm'],.8-1e-6)
                    self.assertAlmostEqual(report['closed_end_wall_mm'],3.4)

    def test_actual_socket_axes_are_parallel_and_wide_faces_roll_fifteen_degrees(self):
        normals=[]
        for side,lane in zip((-1,1),cutters(),strict=True):
            # Measure the actual metal-cavity B-rep, not just the manifest angle.
            caps=[f for f in lane[0].faces() if abs(f.normal_at().X)>.999999]
            self.assertEqual(len(caps),2,'Socket depth faces must be perpendicular to X')
            axis=caps[1].center()-caps[0].center()
            self.assertAlmostEqual(axis.Y,0,places=6)
            self.assertAlmostEqual(axis.Z,0,places=6)
            top=max(lane[0].faces(),key=lambda f:f.normal_at().Z).normal_at()
            self.assertAlmostEqual(top.X,0,places=6)
            self.assertEqual(top.Y>0,side>0)
            normals.append(top)
            self.assertEqual(local_point(side,0)[1],side*6)
        self.assertAlmostEqual(degrees(acos(normals[0].dot(normals[1]))),15,places=6)
        self.assertEqual(geometry_report()['section_roll_degrees'],[7.5,-7.5])
        self.assertEqual(geometry_report()['bend_axis'],'X')
        for fit in FITS:
            part=build_holder(fit)
            for side in (-1,1):
                self.assertFalse(part.is_inside(local_point(side,11.19)))
                self.assertTrue(part.is_inside(local_point(side,11.21)))

    def test_rounded_bend_is_in_the_center_bridge_and_straight_sections_are_tangent(self):
        self.assertAlmostEqual(radius(),6.075)
        for x in (-3,0,3):
            cut=section(blank(),section_by=Plane.YZ.offset(x))
            arcs=[e for e in cut.edges() if e.geom_type==GeomType.CIRCLE
                  and abs(e.center().Y)<1.4]
            self.assertEqual(len(arcs),2)
            self.assertAlmostEqual(sum(e.length for e in arcs),2*radius()*radians(15),places=5)
            for arc in arcs:
                self.assertLessEqual(max(abs(arc.bounding_box().min.Y),abs(arc.bounding_box().max.Y)),1.3)
                lines=[e for e in cut.edges() if e.geom_type==GeomType.LINE and e.length>10]
                for endpoint in (arc.position_at(0),arc.position_at(1)):
                    adjacent=min(lines,key=lambda e:min((e.position_at(0)-endpoint).length,(e.position_at(1)-endpoint).length))
                    self.assertAlmostEqual(abs(arc.tangent_at(0 if (arc.position_at(0)-endpoint).length<1e-6 else 1).dot(adjacent.tangent_at(.5))),1,places=6)

    def test_cavities_and_relief_slots_in_each_socket_local_frame(self):
        for sample in (False,True):
            for fit,mouth in FITS.items():
                part=build_holder(fit,sample)
                for side in ((-1,) if sample else (-1,1)):
                    for depth,(width,height) in ((.3,mouth),(1.2,E.base_cavity),(8,E.metal_cavity)):
                        for sign in (-1,1):
                            with self.subTest(sample=sample,fit=fit,side=side,depth=depth):
                                self.assertFalse(part.is_inside(local_point(side,depth,sign*(width/2-.01),0,sample)))
                                self.assertTrue(part.is_inside(local_point(side,depth,sign*(width/2+.01),0,sample)))
                                self.assertFalse(part.is_inside(local_point(side,depth,0,sign*(height/2-.01),sample)))
                                self.assertTrue(part.is_inside(local_point(side,depth,0,sign*(height/2+.01),sample)))
                    for sign in (-1,1):
                        self.assertFalse(part.is_inside(local_point(side,4,sign*6,0,sample)))
                        self.assertTrue(part.is_inside(local_point(side,4,sign*6.41,0,sample)))
                        self.assertTrue(part.is_inside(local_point(side,6.1,sign*6,0,sample)))
                        self.assertFalse(part.is_inside(local_point(side,4,sign*6,2.54,sample)))
                        self.assertTrue(part.is_inside(local_point(side,4,sign*6,2.56,sample)))

    def test_metal_insertion_sweeps_and_black_base_interference_only_in_throat(self):
        for sample in (False,True):
            for fit in FITS:
                part=build_holder(fit,sample)
                for side in ((-1,) if sample else (-1,1)):
                    for withdrawal in (0,.5,2,5,8,11,14):
                        tip=prism(side,2-withdrawal,10.4-withdrawal,8.1,2.3,sample=sample)
                        self.assertLess(abs(part.intersect(tip).volume),1e-6,(sample,fit,side,withdrawal))
                    seated_base=prism(side,-.5,2,9.9,4.7,sample=sample)
                    interference=part.intersect(seated_base)
                    self.assertGreater(interference.volume,0)
                    throat_region=prism(side,-.01,.65,20,10,sample=sample)
                    self.assertLess(abs(volume(interference-throat_region)),1e-6)
                    self.assertLess(abs(part.intersect(prism(side,.66,2,9.9,4.7,sample=sample)).volume),1e-6)
        self.assertAlmostEqual(E.pocket_depth-(E.capture+E.metal_length),.8)
        self.assertAlmostEqual(E.base_length-E.capture,.5)

    def test_all_profiles_differ_only_in_the_retaining_throat(self):
        for sample in (False,True):
            for fit in ('gentle','firm'):
                standard=build_holder('standard',sample)
                other=build_holder(fit,sample)
                regions=[prism(side,-1,.65,30,15,sample=sample) for side in ((-1,) if sample else (-1,1))]
                for difference in (standard-other,other-standard):
                    pieces=difference.solids() if hasattr(difference,'solids') else difference
                    covered=sum(volume(piece.intersect(region)) for piece in pieces for region in regions)
                    self.assertLess(abs(volume(difference)-covered),1e-6)
        self.assertLess(build_holder('gentle').volume,build_holder('standard').volume)
        self.assertLess(build_holder('standard').volume,build_holder('firm').volume)

    def test_elbow_clearance_is_proven_against_whole_body_half_spaces(self):
        for sample in (False,True):
            report=geometry_report('standard',sample)
            self.assertLess(report['body_outside_mouth_planes_mm3'],1e-6)
            self.assertGreaterEqual(report['silver_elbow_standoff_mm'],.5-1e-6)

    def test_samples_match_holder_socket_cutters_and_local_outer_wall(self):
        for fit in FITS:
            for holder,sample in zip(cutters(fit)[0],cutters(fit,True)[0],strict=True):
                mouth=Vector(local_point(-1,0))
                aligned=holder.translate(tuple(-mouth)).rotate(Axis.X,-pod_roll(-1))
                reference=sample.translate(tuple(-Vector(local_point(-1,0,sample=True))))
                self.assertLess(abs(volume(aligned-reference)),1e-6)
                self.assertLess(abs(volume(reference-aligned)),1e-6)
            a,b=geometry_report(fit),geometry_report(fit,True)
            for key in ('enclosed_relief_wall_mm','closed_end_wall_mm'):
                self.assertAlmostEqual(a[key],b[key],places=6)
            self.assertEqual(b['bend_degrees'],0)
            self.assertEqual(b['section_roll_degrees'],[0])

    def test_print_layout_is_on_end_face_centered_and_samples_have_twelve_mm_gaps(self):
        for variant in (HOLDER,SAMPLES):
            dimensions,transforms,centers=layout(variant)
            self.assertAlmostEqual((centers[0][0]+centers[-1][0])/2,128)
            for transform,center in zip(transforms,centers,strict=True):
                b=blank(variant==SAMPLES).rotate(Axis.Y,-90).translate(transform[9:]).bounding_box()
                self.assertAlmostEqual(b.min.Z,0,places=6)
                self.assertAlmostEqual((b.min.X+b.max.X)/2,center[0],places=6)
            for left,right in zip(centers,centers[1:]):
                self.assertAlmostEqual(right[0]-left[0]-dimensions[0],12)
            self.assertEqual(print_geometry(variant),(dimensions,transforms))
        self.assertEqual([s.fit for s in build_concepts(SAMPLES)],list(FITS))

    def test_all_fits_export_closed_two_manifold_meshes(self):
        from build_plate import stl_mesh
        with tempfile.TemporaryDirectory() as temp:
            for sample in (False,True):
                for fit in FITS:
                    path=Path(temp)/f'{sample}_{fit}.stl'
                    export_stl(build_holder(fit,sample),path,tolerance=.02,angular_tolerance=.1)
                    _,count=stl_mesh(path)
                    self.assertGreater(count,0)

    def test_cli_fit_custom_output_and_existing_skip_flags(self):
        with tempfile.TemporaryDirectory() as temp:
            out=Path(temp)
            result=subprocess.run([sys.executable,str(ROOT/'main.py'),'--variant',HOLDER,'--fit','gentle',
                                   '--output-dir',str(out),'--skip-stl','--skip-step'],
                                  cwd=ROOT,text=True,capture_output=True,check=True)
            self.assertIn('(gentle)',result.stdout)
            self.assertFalse(list(out.rglob('*.stl')))
            self.assertFalse(list(out.rglob('*.step')))
            self.assertTrue((out/'preview.png').exists())
            self.assertTrue((out/'plate_map.png').exists())
            manifest=json.loads((out/'concepts.json').read_text())
            self.assertEqual(manifest[0]['fit'],'gentle')
            self.assertEqual(manifest[0]['mouth_width_height_mm'],[9.75,4.55])
        for entry in ('main.py','build_plate.py'):
            result=subprocess.run([sys.executable,str(ROOT/entry),'--variant','compact','--fit','firm'],
                                  cwd=ROOT,text=True,capture_output=True)
            self.assertNotEqual(result.returncode,0)
            self.assertIn('--fit is only selectable',result.stderr)

    def test_existing_envelope_defaults_models_and_all_preserved_exports(self):
        self.assertEqual((USB_C.plug_length,USB_C.plug_width,USB_C.plug_thickness),(6.8,8.5,2.8))
        self.assertEqual([s.original_id for s in build_concepts()],[3,5,9])
        self.assertEqual(default_output_dir(HOLDER),Path('generated/v6'))
        self.assertEqual(default_output_dir(SAMPLES),Path('generated/v6/fit_samples'))
        for variant in ('compact','curved-press-fit','side-by-side-press-fit','curved-side-by-side-press-fit'):
            for spec in build_concepts(variant):
                current=build_part(spec)
                previous=import_step(ROOT/default_output_dir(variant)/'step'/f'{spec.slug}.step')
                self.assertLess(abs(volume(current-previous)),1e-5)
                self.assertLess(abs(volume(previous-current)),1e-5)
        path=ROOT/'generated/v6/preservation_validation.json'
        self.assertTrue(path.exists())
        for name,expected in json.loads(path.read_text())['previous_export_sha256'].items():
            self.assertEqual(hashlib.sha256((ROOT/name).read_bytes()).hexdigest(),expected,name)
        for name,expected in json.loads(path.read_text())['archived_original_axis_sha256'].items():
            self.assertEqual(hashlib.sha256((ROOT/name).read_bytes()).hexdigest(),expected,name)

    def test_both_native_projects_settings_meshes_and_unblocked_toolpaths(self):
        from build_plate import verify_project,stl_mesh
        for variant,filename,expected_count in ((HOLDER,'right_angle_press_fit_3E_A1_PLA.3mf',180),
                                                (SAMPLES,'right_angle_fit_samples_A1_PLA.3mf',270)):
            output=ROOT/default_output_dir(variant)
            path=output/filename
            self.assertTrue(path.exists(),'Build both #3E plates before acceptance tests')
            report=verify_project(path,variant)
            self.assertEqual(len(report['objects']),3 if variant==SAMPLES else 1)
            manifest=json.loads((output/'concepts.json').read_text())
            for item in manifest:
                stl_mesh(output/item['stl_path'])
                self.assertNotIn('socket_tilt_degrees',item)
                self.assertTrue(item['insertion_axes_parallel'])
                self.assertEqual(item['print_rotation_y_degrees'],-90)
            with zipfile.ZipFile(path) as z:
                config=json.loads(z.read('Metadata/project_settings.config'))
                for key,value in PRINT_SETTINGS.items():
                    self.assertEqual(config[key],value)
            validation=json.loads((output/'validation.json').read_text())
            self.assertFalse(validation['supports_enabled'])
            self.assertEqual(validation['slice_warning'],'')
            self.assertEqual(validation['floating_layer_islands'],[])
            self.assertEqual(validation['blocked_socket_core_probes'],[])
            self.assertEqual(validation['socket_clearance_probes_checked'],expected_count)
            self.assertLessEqual(validation['maximum_bridge_start_distance_mm'],.25)
            self.assertLessEqual(validation['maximum_bridge_end_distance_mm'],.25)

    def test_combined_plate_uses_corrected_sources_in_order_with_twelve_mm_gaps(self):
        from build_plate import plate_items,default_plate_output_dir
        output=default_plate_output_dir(COMBINED)
        items=plate_items(output,COMBINED)
        self.assertEqual([i.spec.fit for i in items],['standard','gentle','standard','firm'])
        self.assertEqual([i.spec.retention_style for i in items],['right_angle_holder']+['right_angle_sample']*3)
        manifest=json.loads((output/'plate_manifest.json').read_text())
        for item,record in zip(items,manifest['objects'],strict=True):
            self.assertEqual(hashlib.sha256(item.mesh.read_bytes()).hexdigest(),record['source_sha256'])
            self.assertNotIn('v6_original_axis',str(item.mesh))
        left=items[0].center[0]-items[0].dimensions[0]/2
        right=items[-1].center[0]+items[-1].dimensions[0]/2
        self.assertAlmostEqual((left+right)/2,128)
        for a,b in zip(items,items[1:]):
            self.assertAlmostEqual(b.center[0]-b.dimensions[0]/2-(a.center[0]+a.dimensions[0]/2),12)

    def test_combined_native_project_has_four_objects_and_all_five_sockets_clear(self):
        from build_plate import verify_project,default_plate_output_dir
        output=default_plate_output_dir(COMBINED)
        report=verify_project(output/'corrected_3E_and_fit_samples_A1_PLA.3mf',COMBINED)
        self.assertEqual(len(report['objects']),4)
        validation=json.loads((output/'validation.json').read_text())
        self.assertEqual(validation['geometry'][0]['bend_axis'],'X')
        self.assertEqual(validation['geometry'][0]['section_roll_degrees'],[7.5,-7.5])
        self.assertEqual(validation['socket_clearance_probes_checked'],450)
        self.assertEqual(validation['blocked_socket_core_probes'],[])
        self.assertEqual(validation['floating_layer_islands'],[])
        self.assertEqual(validation['slice_warning'],'')
        self.assertFalse(validation['supports_enabled'])
        self.assertLessEqual(validation['maximum_bridge_start_distance_mm'],.25)
        self.assertLessEqual(validation['maximum_bridge_end_distance_mm'],.25)

    def test_missing_studio_overrides_are_rejected_and_path_probes_detect_obstruction(self):
        from build_plate import verify_project
        from toolpath_review import check_right_angle_openings,read_layers
        original=ROOT/'generated/v6/right_angle_press_fit_3E_A1_PLA.3mf'
        with tempfile.TemporaryDirectory() as temp:
            path=Path(temp)/'broken.3mf'
            with zipfile.ZipFile(original) as source,zipfile.ZipFile(path,'w') as dest:
                for info in source.infolist():
                    data=source.read(info.filename)
                    if info.filename=='Metadata/project_settings.config':
                        config=json.loads(data)
                        config['different_settings_to_system'][0]=''
                        data=json.dumps(config).encode()
                    dest.writestr(info,data)
            with self.assertRaisesRegex(AssertionError,'Studio import metadata'):
                verify_project(path,HOLDER)
        layers=read_layers(original.parent/'validated_toolpaths.gcode')
        _,transforms,_=layout(HOLDER)
        a=transforms[0]
        p=local_point(-1,.5)
        x,y=a[0]*p[0]+a[6]*p[2]+a[9],p[1]+a[10]
        for z in layers:
            if .4<=z<=.8:
                layers[z].append(((x-2,y),(x+2,y),1.,'Outer wall'))
        self.assertTrue(check_right_angle_openings(layers,HOLDER)['blocked_socket_core_probes'])


if __name__=='__main__':
    unittest.main()

"""Build the compact A1/PLA plate using Bambu Studio's native slicer.

The committed v1 project supplies the complete, known A1 machine and PLA settings.
CAD shapes are placed explicitly; auto-arrange and auto-orient stay disabled.
"""
from __future__ import annotations

import argparse
import json
import re
import struct
from collections import Counter
from dataclasses import dataclass
import shutil
import subprocess
import tempfile
import xml.etree.ElementTree as ET
import zipfile
from pathlib import Path

from main import ConceptSpec, VARIANTS, build_concepts, default_output_dir, plate_centers, print_geometry
from right_angle import HOLDER as RIGHT_ANGLE_HOLDER, SAMPLES as RIGHT_ANGLE_SAMPLES, PRINT_SETTINGS as RIGHT_ANGLE_SETTINGS
from right_angle import COMBINED as RIGHT_ANGLE_COMBINED, combined_layout
from right_angle import INVERTED as RIGHT_ANGLE_INVERTED

RIGHT_ANGLE_VARIANTS = (RIGHT_ANGLE_HOLDER, RIGHT_ANGLE_SAMPLES, RIGHT_ANGLE_COMBINED, RIGHT_ANGLE_INVERTED)

ROOT = Path(__file__).resolve().parent
DEFAULT_BAMBU = Path('/Applications/BambuStudio.app/Contents/MacOS/BambuStudio')
BASELINE = ROOT / 'generated/all_connectors_A1_PLA.3mf'
FINAL_NAME = 'compact_connectors_A1_PLA.3mf'
COMPARISON = 'comparison-3b-3c'
PLATE_VARIANTS = (*VARIANTS, COMPARISON, RIGHT_ANGLE_COMBINED)
CURVED_SIDE_BY_SIDE_SETTINGS = dict(sparse_infill_density='20%', sparse_infill_pattern='gyroid',
                                    skeleton_infill_density='20%', skin_infill_density='20%',
                                    wall_loops='3', top_shell_layers='5', bottom_shell_layers='5',
                                    top_shell_thickness='1', bottom_shell_thickness='1')
NS = {'m': 'http://schemas.microsoft.com/3dmanufacturing/core/2015/02'}
PRODUCTION = 'http://schemas.microsoft.com/3dmanufacturing/production/2015/06'
ET.register_namespace('', NS['m'])
ET.register_namespace('p', PRODUCTION)


@dataclass(frozen=True)
class PlateItem:
    spec: ConceptSpec
    mesh: Path
    dimensions: tuple[float, float, float]
    center: tuple[float, float]
    transform: tuple[float, ...]


def default_plate_output_dir(variant: str) -> Path:
    if variant == RIGHT_ANGLE_COMBINED:
        return ROOT/'generated/v6/combined_plate'
    return ROOT / ('generated/comparison_3B_3C' if variant == COMPARISON else default_output_dir(variant))


def plate_items(output_dir: Path, variant: str, fit: str = 'standard') -> list[PlateItem]:
    if variant == RIGHT_ANGLE_COMBINED:
        result = []
        for row in combined_layout():
            spec = next(s for s in build_concepts(row['variant']) if s.fit == row['fit'])
            mesh = ROOT/default_output_dir(row['variant'])/'stl'/f'{spec.slug}.stl'
            result.append(PlateItem(spec, mesh, row['dimensions'], row['center'], row['transform']))
        return result
    if variant == COMPARISON:
        items = []
        # Total X span is 24 + 12 + 13 = 49 mm, centered on the A1 bed.
        for source_variant, center in (('curved-press-fit', (115.5, 128.0)),
                                       ('side-by-side-press-fit', (146.0, 128.0))):
            spec = build_concepts(source_variant)[0]
            dimensions, transforms = print_geometry(source_variant)
            transform = list(transforms[0])
            transform[9] += center[0]-128
            transform[10] += center[1]-128
            mesh = ROOT / default_output_dir(source_variant) / 'stl' / f'{spec.slug}.stl'
            items.append(PlateItem(spec, mesh, dimensions, center, tuple(transform)))
        return items
    dimensions, transforms = print_geometry(variant)
    return [PlateItem(spec, output_dir/'stl'/f'{spec.slug}.stl', dimensions, center, tuple(transform))
            for spec, center, transform in zip(build_concepts(variant, fit), plate_centers(variant), transforms, strict=True)]


def stl_mesh(path: Path) -> tuple[ET.Element, int]:
    data = path.read_bytes()
    count = struct.unpack_from('<I', data, 80)[0]
    assert len(data) == 84 + 50 * count
    mesh = ET.Element(f"{{{NS['m']}}}mesh")
    vertices = ET.SubElement(mesh, f"{{{NS['m']}}}vertices")
    triangles = ET.SubElement(mesh, f"{{{NS['m']}}}triangles")
    indices, edges = {}, Counter()
    for i in range(count):
        values = struct.unpack_from('<12fH', data, 84 + 50*i)[3:12]
        face = []
        for start in (0, 3, 6):
            point = tuple(round(v, 6) for v in values[start:start+3])
            if point not in indices:
                indices[point] = len(indices)
                ET.SubElement(vertices, f"{{{NS['m']}}}vertex", dict(zip(('x','y','z'), map(str, point))))
            face.append(indices[point])
        assert len(set(face)) == 3, 'Degenerate STL triangle'
        ET.SubElement(triangles, f"{{{NS['m']}}}triangle", dict(zip(('v1','v2','v3'), map(str, face))))
        for a, b in zip(face, face[1:]+face[:1]):
            edges[tuple(sorted((a,b)))] += 1
    assert all(n == 2 for n in edges.values()), 'STL is not a closed two-manifold mesh'
    return mesh, count


def configured_project(output_dir: Path, baseline: Path, destination: Path, config: dict,
                       variant: str = "compact", fit: str = 'standard') -> None:
    """Retain native A1 plate metadata, replacing all v1 meshes and removing cached toolpaths."""
    with zipfile.ZipFile(baseline) as source:
        model = ET.fromstring(source.read('3D/3dmodel.model'))
        resources, build = model.find('m:resources', NS), model.find('m:build', NS)
        layout = plate_items(output_dir, variant, fit)
        items = list(build)[:len(layout)]
        ids = {i.attrib['objectid'] for i in items}
        for obj in list(resources):
            if obj.attrib.get('id') not in ids:
                resources.remove(obj)
        for item in list(build)[len(layout):]:
            build.remove(item)
        for metadata in list(model.findall('m:metadata', NS)):
            if metadata.attrib.get('name', '').startswith('Thumbnail_'):
                model.remove(metadata)
        settings = ET.fromstring(source.read('Metadata/model_settings.config'))
        # Assembly-view positions are not print positions; drop the v1 arrangement.
        for assembly in settings.findall('assemble'):
            settings.remove(assembly)
        for obj in list(settings.findall('object')):
            if obj.attrib['id'] not in ids:
                settings.remove(obj)
        replacements = {}
        for item, placement in zip(items, layout, strict=True):
            spec, transform = placement.spec, placement.transform
            object_id = item.attrib['objectid']
            item.set('transform', ' '.join(map(str, transform)))
            item.set('printable', '1')
            obj = next(o for o in resources if o.attrib['id'] == object_id)
            component = obj.find('m:components/m:component', NS)
            component.set('transform', '1 0 0 0 1 0 0 0 1 0 0 0')
            child_path = component.attrib[f'{{{PRODUCTION}}}path'].lstrip('/')
            child = ET.fromstring(source.read(child_path))
            mesh_obj = child.find('m:resources/m:object', NS)
            mesh_obj.remove(mesh_obj.find('m:mesh', NS))
            mesh, face_count = stl_mesh(placement.mesh)
            mesh_obj.append(mesh)
            replacements[child_path] = ET.tostring(child, encoding='utf-8', xml_declaration=True)
            obj_config = next(o for o in settings.findall('object') if o.attrib['id'] == object_id)
            for metadata in obj_config.findall('metadata') + obj_config.findall('part/metadata'):
                key = metadata.attrib.get('key')
                if key == 'name':
                    metadata.set('value', spec.title)
                elif key == 'source_file':
                    metadata.set('value', f'{spec.slug}.stl')
                elif key == 'enable_support':
                    metadata.set('value', '0')
                if 'face_count' in metadata.attrib:
                    metadata.set('face_count', str(face_count))
            for stat in obj_config.findall('part/mesh_stat'):
                stat.set('face_count', str(face_count))
        for plate in settings.findall('plate'):
            for instance in list(plate.findall('model_instance')):
                oid = next(m.attrib['value'] for m in instance.findall('metadata')
                           if m.attrib.get('key') == 'object_id')
                if oid not in ids:
                    plate.remove(instance)
            for metadata in plate.findall('metadata'):
                if metadata.attrib.get('key') in ('gcode_file', 'thumbnail_file',
                                                  'thumbnail_no_light_file', 'top_file', 'pick_file'):
                    metadata.set('value', '')
        replacements['3D/3dmodel.model'] = ET.tostring(model, encoding='utf-8', xml_declaration=True)
        replacements['Metadata/model_settings.config'] = ET.tostring(settings, encoding='utf-8', xml_declaration=True)
        replacements['Metadata/project_settings.config'] = json.dumps(config, indent=2).encode()
        with zipfile.ZipFile(destination, 'w', zipfile.ZIP_DEFLATED) as dest:
            for name in source.namelist():
                if name.endswith(('.gcode', '.png', '.json')) and name not in replacements:
                    continue
                if name in ('Metadata/slice_info.config', 'Metadata/cut_information.xml'):
                    continue
                if name.startswith('3D/Objects/') and name not in replacements:
                    continue
                if name.endswith('.gcode.md5') or name == 'Metadata/_rels/model_settings.config.rels':
                    continue
                data = replacements.get(name, source.read(name))
                if name == '3D/_rels/3dmodel.model.rels':
                    rels = ET.fromstring(data)
                    for rel in list(rels):
                        if rel.attrib['Target'].lstrip('/') not in replacements:
                            rels.remove(rel)
                    # Studio's relationship parser expects the default namespace,
                    # rather than a generated ns0 prefix on Relationship elements.
                    ET.register_namespace('', 'http://schemas.openxmlformats.org/package/2006/relationships')
                    data = ET.tostring(rels, encoding='utf-8', xml_declaration=True)
                    ET.register_namespace('', NS['m'])
                elif name == '_rels/.rels':
                    rels = ET.fromstring(data)
                    for rel in list(rels):
                        if rel.attrib['Target'].lstrip('/') != '3D/3dmodel.model':
                            rels.remove(rel)
                    ET.register_namespace('', 'http://schemas.openxmlformats.org/package/2006/relationships')
                    data = ET.tostring(rels, encoding='utf-8', xml_declaration=True)
                    ET.register_namespace('', NS['m'])
                dest.writestr(name, data)


def verify_project(path: Path, variant: str = "compact", fit: str = 'standard') -> dict:
    """Independently recover transformed vertex bounds from the delivered project."""
    with zipfile.ZipFile(path) as archive:
        if archive.testzip() is not None:
            raise ValueError('Corrupt 3MF archive')
        config = json.loads(archive.read('Metadata/project_settings.config'))
        assert config['printer_model'] == 'Bambu Lab A1'
        assert config['printer_variant'] == '0.4'
        assert config['filament_settings_id'] == ['Generic PLA @BBL A1']
        assert config['print_settings_id'] == '0.20mm Standard @BBL A1'
        assert config['enable_support'] == '0'
        if variant == 'curved-side-by-side-press-fit' or variant in RIGHT_ANGLE_VARIANTS:
            assert config['curr_bed_type'] == 'Textured PEI Plate'
            assert config['print_sequence'] == 'by layer'
            overrides = RIGHT_ANGLE_SETTINGS if variant in RIGHT_ANGLE_VARIANTS else CURVED_SIDE_BY_SIDE_SETTINGS
            for key, value in overrides.items():
                assert config[key] == value, (key, config[key])
            # Studio only reapplies changed preset values when the process group
            # marks them dirty; the CLI otherwise honors values that the GUI drops.
            dirty = set(config['different_settings_to_system'][0].split(';'))
            required = set(overrides)-{'top_shell_layers', 'top_shell_thickness'}
            assert required <= dirty, f'Process overrides missing Studio import metadata: {required-dirty}'
        model = ET.fromstring(archive.read('3D/3dmodel.model'))
        settings = ET.fromstring(archive.read('Metadata/model_settings.config'))
        names = {o.attrib['id']: next(m.attrib['value'] for m in o.findall('metadata')
                                     if m.attrib.get('key') == 'name')
                 for o in settings.findall('object')}
        objects = {o.attrib['id']: o for o in model.findall('m:resources/m:object', NS)}
        items = model.findall('m:build/m:item', NS)
        layout = plate_items(path.parent, variant, fit)
        assert len(items) == len(layout)
        plates = settings.findall('plate')
        assert len(plates) == 1 and len(plates[0].findall('model_instance')) == len(layout)
        # Ship an editable project without stale cached toolpaths or thumbnails.
        assert not any(p.endswith('.gcode') for p in archive.namelist())
        for obj in settings.findall('object'):
            assert not any(m.attrib.get('key') == 'enable_support' and m.attrib.get('value') == '1'
                           for m in obj.findall('metadata'))

        def transform(point, raw):
            a = list(map(float, raw.split())) if raw else [1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0]
            x, y, z = point
            return (a[0]*x+a[3]*y+a[6]*z+a[9], a[1]*x+a[4]*y+a[7]*z+a[10],
                    a[2]*x+a[5]*y+a[8]*z+a[11])

        def vertices(obj, document):
            points = [tuple(float(v.attrib[k]) for k in ('x', 'y', 'z'))
                      for v in obj.findall('m:mesh/m:vertices/m:vertex', NS)]
            for component in obj.findall('m:components/m:component', NS):
                child_path = component.attrib.get(f'{{{PRODUCTION}}}path')
                child_doc = ET.fromstring(archive.read(child_path.lstrip('/'))) if child_path else document
                child = next(o for o in child_doc.findall('m:resources/m:object', NS)
                             if o.attrib['id'] == component.attrib['objectid'])
                points += [transform(p, component.attrib.get('transform')) for p in vertices(child, child_doc)]
            return points

        bounds = []
        for item in items:
            assert item.attrib.get('printable', '1') == '1'
            pts = [transform(p, item.attrib.get('transform'))
                   for p in vertices(objects[item.attrib['objectid']], model)]
            lo = [min(p[k] for p in pts) for k in range(3)]
            hi = [max(p[k] for p in pts) for k in range(3)]
            bounds.append(dict(name=names[item.attrib['objectid']], minimum_mm=lo, maximum_mm=hi))
        bounds.sort(key=lambda b: b['minimum_mm'][0])
        for b, placement in zip(bounds, layout, strict=True):
            assert b['name'] == placement.spec.title, b
            assert abs(b['minimum_mm'][2]) < 1e-3
            for axis, expected in enumerate(placement.dimensions):
                assert abs(b['maximum_mm'][axis] - b['minimum_mm'][axis] - expected) < 1e-3
            for axis in (0, 1):
                assert abs((b['minimum_mm'][axis] + b['maximum_mm'][axis])/2 - placement.center[axis]) < 1e-3
        for left, right in zip(bounds, bounds[1:]):
            assert abs(right['minimum_mm'][0] - left['maximum_mm'][0] - 12) < 1e-3
        return dict(printer=config['printer_settings_id'], filament=config['filament_settings_id'][0],
                    process=config['print_settings_id'], supports_enabled=False, objects=bounds)


def write_comparison_map(output_dir: Path, verification: dict) -> None:
    """Label actual first-layer extrusion paths in the same order as the print plate."""
    import hashlib
    import matplotlib
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt
    from matplotlib.collections import LineCollection
    from toolpath_review import read_layers

    layout = plate_items(output_dir, COMPARISON)
    layers = read_layers(output_dir/'validated_toolpaths.gcode')
    segments = layers[min(layers)]
    fig, ax = plt.subplots(figsize=(11, 6), layout='constrained', facecolor='#f8faf8')
    ax.add_collection(LineCollection([[a, b] for a, b, _, _ in segments], colors='#327449', linewidths=1))
    ax.text(115.5, 137.5, '#3B', ha='center', fontsize=22, color='#173329')
    ax.text(115.5, 135, 'Curved · on its side', ha='center', fontsize=12, color='#365348')
    ax.text(146, 148, '#3C', ha='center', fontsize=22, color='#173329')
    ax.text(146, 145.5, 'Side-by-side · flat', ha='center', fontsize=12, color='#365348')
    ax.annotate('', xy=(127.5, 119), xytext=(139.5, 119),
                arrowprops=dict(arrowstyle='|-|', color='#52675c'))
    ax.text(133.5, 120, '12 mm gap', ha='center', fontsize=11, color='#173329')
    ax.set(xlim=(99, 159), ylim=(108, 153), aspect='equal', xlabel='Plate X (mm)', ylabel='Plate Y (mm)')
    ax.set_title('A1 · #3B + #3C\nTop view · back of plate at top', fontsize=18, color='#173329')
    ax.grid(alpha=.15)
    ax.text(129, 109, 'Front edge / closest to you · Generic PLA · 0.4 mm · 0.20 mm Standard',
            ha='center', fontsize=10, color='#365348')
    fig.savefig(output_dir/'plate_map.png', dpi=160)
    fig.savefig(output_dir/'plate_map.svg')
    plt.close(fig)
    manifest = dict(project='connectors_3B_3C_A1_PLA.3mf', gap_mm=12,
                    objects=[dict(name=item.spec.title, quantity=1, source_stl=str(item.mesh.relative_to(ROOT)),
                                  source_sha256=hashlib.sha256(item.mesh.read_bytes()).hexdigest(),
                                  center_xy_mm=item.center, print_dimensions_mm=item.dimensions,
                                  transform=item.transform) for item in layout])
    (output_dir/'plate_manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    (output_dir/'print_notes.md').write_text(
        '# Combined #3B + #3C A1 plate\n\n'
        'One of each, left to right: **#3B curved press-fit**, then **#3C side-by-side press-fit**. '
        '#3B prints on its flat long side; #3C prints flat. Bodies have a 12 mm gap.\n\n'
        'A1 / Generic PLA / 0.4 mm / 0.20 mm Standard / Textured PEI / by layer / supports disabled.\n\n'
        f"Native slice: {verification['estimated_seconds']/60:.1f} minutes, "
        f"{verification['filament_grams']:.2f} g PLA, {verification['layer_count']} layers. "
        'No slice warnings, support toolpaths, or floating layer islands.\n\n'
        'Open connectors_3B_3C_A1_PLA.3mf in Bambu Studio and click Slice plate. '
        'The editable project contains both meshes; the separately saved validated_toolpaths.gcode '
        'is the native slice used for verification.\n')


def write_right_angle_combined_map(output_dir: Path, verification: dict) -> None:
    """Number and label all four objects using their actual first-layer toolpaths."""
    import hashlib
    import matplotlib
    matplotlib.use('Agg')
    import matplotlib.pyplot as plt
    from matplotlib.collections import LineCollection
    from toolpath_review import read_layers

    items = plate_items(output_dir, RIGHT_ANGLE_COMBINED)
    layers = read_layers(output_dir/'validated_toolpaths.gcode')
    fig, ax = plt.subplots(figsize=(12, 7), layout='constrained', facecolor='#f8faf8')
    segments = layers[min(layers)]
    ax.add_collection(LineCollection([[a,b] for a,b,_,_ in segments], colors='#327449', linewidths=1))
    labels = ('1 · #3E holder', '2 · Gentle', '3 · Standard', '4 · Firm')
    for item, label in zip(items, labels, strict=True):
        x, y = item.center
        ax.text(x, y+item.dimensions[1]/2+3, label, ha='center', fontsize=13, color='#173329')
        ax.text(x, y-item.dimensions[1]/2-3, 'Standard fit' if item is items[0] else item.spec.fit.title()+' sample',
                ha='center', fontsize=10, color='#365348')
    ax.set(xlim=(87,169), ylim=(103,151), aspect='equal', xlabel='Plate X (mm)', ylabel='Plate Y (mm)')
    ax.grid(alpha=.15)
    ax.set_title('A1 · corrected #3E + gentle / standard / firm fit samples\nLeft to right · 12 mm gaps · back of plate at top', fontsize=17, color='#173329')
    ax.text(128, 105, 'PLA · 0.4 mm · 0.20 mm · 20% gyroid · 3 walls · no supports', ha='center', fontsize=11)
    fig.savefig(output_dir/'plate_map.png', dpi=160)
    fig.savefig(output_dir/'plate_map.svg')
    plt.close(fig)
    manifest = dict(project='corrected_3E_and_fit_samples_A1_PLA.3mf', gap_mm=12,
                    objects=[dict(name=item.spec.title, fit=item.spec.fit, quantity=1,
                                  source_stl=str(item.mesh.relative_to(ROOT)),
                                  source_sha256=hashlib.sha256(item.mesh.read_bytes()).hexdigest(),
                                  center_xy_mm=item.center, print_dimensions_mm=item.dimensions,
                                  transform=item.transform) for item in items])
    (output_dir/'plate_manifest.json').write_text(json.dumps(manifest, indent=2)+'\n')
    (output_dir/'print_notes.md').write_text(
        '# Corrected #3E and three fit samples\n\n'
        'Left to right: **1 corrected #3E holder (standard fit), 2 gentle sample, 3 standard sample, 4 firm sample**. '
        'One of each; 12 mm gaps. The holder has the 15° bend between the lanes, with parallel insertion axes.\n\n'
        'All four print by layer on the flat negative-X end, rotated −90° about Y. '
        'A1 / Generic PLA / 0.4 mm / 0.20 mm Standard / Textured PEI. '
        '20% gyroid, three walls, five top/bottom layers, 1 mm shells, supports disabled.\n\n'
        f"Native slice: {verification['estimated_seconds']/60:.1f} minutes, "
        f"{verification['filament_grams']:.2f} g PLA, {verification['layer_count']} layers. "
        'No warnings, support paths, floating islands or blocked socket-core probes.\n\n'
        'Open the editable 3MF in Bambu Studio and click Slice plate; it contains no cached G-code. '
        'Test the gentle sample first. No physical print was started.\n')


def build_plate(output_dir: Path, bambu: Path, baseline: Path = BASELINE,
                variant: str = "compact", fit: str = 'standard') -> Path:
    output_dir = output_dir.resolve()
    output_dir.mkdir(parents=True, exist_ok=True)
    with zipfile.ZipFile(baseline) as archive:
        config = json.loads(archive.read('Metadata/project_settings.config'))
    assert config['printer_model'] == 'Bambu Lab A1'
    assert config['filament_settings_id'] == ['Generic PLA @BBL A1']
    config['enable_support'] = '0'
    if variant == RIGHT_ANGLE_COMBINED:
        source = ROOT/default_output_dir(RIGHT_ANGLE_HOLDER)
        holder = json.loads((source/'concepts.json').read_text())[0]
        assert holder['fit'] == 'standard' and holder['bend_axis'] == 'X'
        assert holder['section_roll_degrees'] == [7.5,-7.5] and holder['insertion_axes_parallel']
        sample_source = ROOT/default_output_dir(RIGHT_ANGLE_SAMPLES)
        samples = json.loads((sample_source/'concepts.json').read_text())
        assert [s['fit'] for s in samples] == ['gentle','standard','firm']
        assert all(s['sample'] and s['bend_degrees'] == 0 for s in samples)
        geometry = [json.loads((source/'geometry_validation.json').read_text()),
                    *json.loads((sample_source/'geometry_validation.json').read_text())]
        (output_dir/'geometry_validation.json').write_text(json.dumps(geometry, indent=2)+'\n')
    elif variant in RIGHT_ANGLE_VARIANTS:
        manifest = json.loads((output_dir/'concepts.json').read_text())
        assert [m['fit'] for m in manifest] == [s.fit for s in build_concepts(variant, fit)], 'Generate matching --fit STLs first'
    if variant == 'curved-side-by-side-press-fit' or variant in RIGHT_ANGLE_VARIANTS:
        overrides = RIGHT_ANGLE_SETTINGS if variant in RIGHT_ANGLE_VARIANTS else CURVED_SIDE_BY_SIDE_SETTINGS
        config.update(overrides)
        dirty_groups = list(config['different_settings_to_system'])
        process_keys = set(filter(None, dirty_groups[0].split(';')))
        dirty_groups[0] = ';'.join(sorted(process_keys | overrides.keys()))
        config['different_settings_to_system'] = dirty_groups
    with tempfile.TemporaryDirectory(prefix='compact-connectors-') as temp:
        work = Path(temp)
        layout = plate_items(output_dir, variant, fit)
        specs = [p.spec for p in layout]
        stls = [p.mesh for p in layout]
        if not all(p.exists() for p in stls):
            raise FileNotFoundError('Generate the STLs first: uv run python main.py')
        input_path = work / 'configured.3mf'
        configured_project(output_dir, baseline, input_path, config, variant, fit)
        # Validate with the native slicer without invoking its macOS GLFW thumbnail
        # window. The editable project is the exact geometry/settings that were sliced.
        command = [str(bambu.resolve()), '--datadir', str(work / 'studio-data'), '--debug', '2', '--arrange', '0', '--orient', '0',
                   '--slice', '1', '--outputdir', str(work), str(input_path)]
        with (output_dir / 'slicing.log').open('w') as log:
            result = subprocess.run(command, cwd=work, text=True, stdout=log, stderr=subprocess.STDOUT, timeout=120)
        result.check_returncode()
        report_path = work / 'result.json'
        report = json.loads(report_path.read_text())
        assert report['return_code'] == 0, report
        plates = report['sliced_plates']
        assert len(plates) == 1 and len(plates[0]['objects']) == len(specs), report
        assert not plates[0]['warning_message'], plates[0]['warning_message']
        assert not any(v for k, v in plates[0]['feature_type_times'].items() if k.startswith('Support'))
        verification = verify_project(input_path, variant, fit)
        verification.update(slicer_return_code=report['return_code'],
                            slice_warning=plates[0]['warning_message'],
                            estimated_seconds=plates[0]['total_predication'],
                            filament_grams=sum(f['total_used_g'] for f in plates[0]['filaments']),
                            project_contains_cached_gcode=False,
                            layer_count=int(re.search(r'; total layer number: (\d+)',
                                            (work / 'plate_1.gcode').read_text()).group(1)),
                            feature_type_times=plates[0]['feature_type_times'])
        if variant in ('curved-press-fit', 'side-by-side-press-fit', 'curved-side-by-side-press-fit', COMPARISON, *RIGHT_ANGLE_VARIANTS):
            from toolpath_review import write_review
            review = write_review(work / 'plate_1.gcode', output_dir, variant, fit)
            verification.update(floating_layer_islands=review['floating_layer_islands'],
                                bridge_path_starts_checked=review['bridge_path_starts_checked'],
                                maximum_bridge_start_distance_mm=review['maximum_bridge_start_distance_mm'],
                                maximum_bridge_end_distance_mm=review['maximum_bridge_end_distance_mm'])
            if variant == 'curved-side-by-side-press-fit' or variant in RIGHT_ANGLE_VARIANTS:
                verification.update({key: review[key] for key in ('socket_clearance_probes_checked',
                                    'minimum_probe_clearance_to_extrusion_mm', 'blocked_socket_core_probes')})
        final = output_dir / {'compact': FINAL_NAME,
                              'curved-press-fit': 'curved_press_fit_3B_A1_PLA.3mf',
                              'side-by-side-press-fit': 'side_by_side_press_fit_3C_A1_PLA.3mf',
                              'curved-side-by-side-press-fit': 'curved_side_by_side_press_fit_3D_A1_PLA.3mf',
                              RIGHT_ANGLE_HOLDER: 'right_angle_press_fit_3E_A1_PLA.3mf',
                              RIGHT_ANGLE_INVERTED: 'right_angle_press_fit_3E_inverted_A1_PLA.3mf',
                              RIGHT_ANGLE_SAMPLES: 'right_angle_fit_samples_A1_PLA.3mf',
                              RIGHT_ANGLE_COMBINED: 'corrected_3E_and_fit_samples_A1_PLA.3mf',
                              COMPARISON: 'connectors_3B_3C_A1_PLA.3mf'}[variant]
        shutil.copy2(input_path, final)
        shutil.copy2(work / 'plate_1.gcode', output_dir / 'validated_toolpaths.gcode')
        if variant == 'curved-side-by-side-press-fit':
            verification.update(print_settings_overrides=CURVED_SIDE_BY_SIDE_SETTINGS,
                                stl_closed_two_manifold=True,
                                geometry=json.loads((output_dir/'geometry_validation.json').read_text()))
        if variant in RIGHT_ANGLE_VARIANTS:
            verification.update(print_settings_overrides=RIGHT_ANGLE_SETTINGS,
                                stl_closed_two_manifold=True,
                                geometry=json.loads((output_dir/'geometry_validation.json').read_text()),
                                fit_profiles=[item.spec.fit for item in layout])
        (output_dir / 'validation.json').write_text(json.dumps(verification, indent=2) + '\n')
        if variant == COMPARISON:
            write_comparison_map(output_dir, verification)
        if variant == RIGHT_ANGLE_COMBINED:
            write_right_angle_combined_map(output_dir, verification)
        print(f'Project: {final}')
        print(f"Verified {', '.join(s.title for s in specs)}; no supports or slice warnings. "
              f"Estimate: {verification['estimated_seconds']/60:.0f} min, "
              f"{verification['filament_grams']:.1f} g PLA.")
        return final


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--variant', choices=PLATE_VARIANTS, default='compact')
    parser.add_argument('--fit', choices=('gentle', 'standard', 'firm'), default='standard',
                        help='Trial retaining-mouth fit for the #3E holder; samples include all three.')
    parser.add_argument('--output-dir', type=Path,
                        help='Output folder (comparison: generated/comparison_3B_3C; other variants retain their defaults).')
    parser.add_argument('--bambu-studio', type=Path, default=DEFAULT_BAMBU)
    args = parser.parse_args()
    if args.fit != 'standard' and args.variant not in (RIGHT_ANGLE_HOLDER, RIGHT_ANGLE_INVERTED):
        parser.error('--fit is only selectable for right-angle-side-by-side-press-fit')
    build_plate(args.output_dir or default_plate_output_dir(args.variant), args.bambu_studio,
                variant=args.variant, fit=args.fit)

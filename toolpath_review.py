"""Recover native extrusion paths, check layer connectivity, and render critical bridges."""
import json
from bisect import bisect_left
from math import atan2, ceil, cos, hypot, pi, sin
from pathlib import Path
import re

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.collections import LineCollection
from shapely.geometry import LineString, Point
from shapely.ops import unary_union


def read_layers(path: Path):
    layers = {}
    position = dict(X=0.0, Y=0.0, Z=0.0, E=0.0)
    absolute_xy, relative_e = True, True
    height, feature, width = None, 'Custom', 0.42
    for raw in path.read_text().splitlines():
        if raw.startswith('; Z_HEIGHT:'):
            height = float(raw.split(':', 1)[1])
            layers.setdefault(height, [])
        elif raw.startswith('; FEATURE:'):
            feature = raw.split(':', 1)[1].strip()
        elif raw.startswith('; LINE_WIDTH:'):
            width = float(raw.split(':', 1)[1])
        code = raw.split(';', 1)[0].strip()
        if not code:
            continue
        command = code.split()[0]
        args = {key: float(value) for key, value in re.findall(r'([XYZEFIJ])(-?\d*\.?\d+)', code.replace(' ', ''))}
        if command in ('G90', 'G91'):
            absolute_xy = command == 'G90'
        elif command in ('M82', 'M83'):
            relative_e = command == 'M83'
        elif command == 'G92':
            position.update({key: value for key, value in args.items() if key in position})
        elif command in ('G0', 'G1', 'G2', 'G3'):
            start = position.copy()
            for key in ('X', 'Y', 'Z'):
                if key in args:
                    position[key] = args[key] if absolute_xy else position[key]+args[key]
            extrusion = args.get('E', 0) if relative_e else args.get('E', position['E'])-position['E']
            if 'E' in args:
                position['E'] = position['E']+args['E'] if relative_e else args['E']
            if height is None or feature in ('Custom', 'Undefined') or extrusion <= 0:
                continue
            a, b = (start['X'], start['Y']), (position['X'], position['Y'])
            if command in ('G2', 'G3'):
                center = (a[0]+args.get('I', 0), a[1]+args.get('J', 0))
                radius = hypot(a[0]-center[0], a[1]-center[1])
                begin = atan2(a[1]-center[1], a[0]-center[0])
                end = atan2(b[1]-center[1], b[0]-center[0])
                sweep = (end-begin) % (2*pi) if command == 'G3' else -((begin-end) % (2*pi))
                if abs(sweep) < 1e-8:
                    sweep = 2*pi if command == 'G3' else -2*pi
                steps = max(1, ceil(abs(sweep)*radius/0.08))
                points = [a] + [(center[0]+radius*cos(begin+sweep*i/steps),
                                 center[1]+radius*sin(begin+sweep*i/steps)) for i in range(1, steps)] + [b]
            else:
                points = [a, b]
            for a, b in zip(points, points[1:]):
                if hypot(a[0]-b[0], a[1]-b[1]) > 1e-7:
                    layers[height].append((a, b, width, feature))
    return layers


def check_curved_side_by_side_openings(layers, footprints=None):
    """Probe the mouths and a broad interior core of each socket against actual extrusion.

    A 0.45 mm margin avoids mistaking layer stair steps and line-width rounding
    for a blockage. Full nominal plug clearances are separately checked in CAD.
    """
    from main import curved_side_by_side_local_point, print_geometry
    _, transforms = print_geometry('curved-side-by-side-press-fit')
    a = transforms[0]
    heights = sorted(layers)
    if footprints is None:
        footprints = {z: unary_union([LineString([start, end]).buffer(width/2, quad_segs=3)
                                      for start, end, width, _ in segments]) for z, segments in layers.items()}
    checked, minimum, blocked = 0, float('inf'), []
    for side in (-1, 1):
        for depth in (.25, .5, 1, 2, 2.8, 3.5, 5, 7, 9.8, 10.2):
            width, height = (11.25, 5.65) if depth < .65 else ((12.2, 6.6) if depth < 3.2 else (8.65, 2.95))
            for y in (-(width/2-.45), 0, width/2-.45):
                for z in (-(height/2-.45), 0, height/2-.45):
                    x, yy, zz = curved_side_by_side_local_point(side, depth, y, z)
                    point = (a[0]*x+a[6]*zz+a[9], yy+a[10], a[2]*x+a[8]*zz+a[11])
                    index = bisect_left(heights, point[2]-1e-7)
                    if index == len(heights) or point[2] < 0:
                        continue
                    layer = heights[index]
                    clearance = Point(point[:2]).distance(footprints[layer])
                    checked += 1
                    minimum = min(minimum, clearance)
                    if clearance < .1:
                        blocked.append(dict(side=side, depth_mm=depth, local_yz_mm=[y, z], layer_z_mm=layer))
    return dict(socket_clearance_probes_checked=checked,
                minimum_probe_clearance_to_extrusion_mm=minimum,
                blocked_socket_core_probes=blocked,
                socket_probe_method='Three by three socket-core grid, ten depths per lane; 0.45 mm edge margin. '
                                    'Extrusion footprint at the layer containing each 3D probe must clear it by 0.10 mm.')


def write_review(path: Path, output_dir: Path, variant: str = 'curved-press-fit'):
    layers = read_layers(path)
    previous = None
    floating, bridge_starts, footprints = [], [], {}
    for height, segments in sorted(layers.items()):
        strokes = [LineString([a, b]).buffer(width/2, quad_segs=3) for a, b, width, _ in segments]
        footprint = unary_union(strokes)
        if variant == 'curved-side-by-side-press-fit':
            footprints[height] = footprint
        components = list(footprint.geoms) if footprint.geom_type == 'MultiPolygon' else [footprint]
        if previous is not None:
            for component in components:
                if component.area > 0.02 and component.distance(previous) > 0.05:
                    floating.append(dict(z_mm=height, area_mm2=component.area))
            # Inspect each new bridge path's first endpoint against previous-layer
            # material or extrusion already deposited on this layer.
            for i, (a, b, width, feature) in enumerate(segments):
                if feature != 'Bridge':
                    continue
                if i and segments[i-1][3] == feature and hypot(a[0]-segments[i-1][1][0], a[1]-segments[i-1][1][1]) < 0.02:
                    continue
                start = Point(a)
                distance = min([start.distance(previous)] + [start.distance(stroke) for stroke in strokes[:i]])
                end_index = i
                while end_index+1 < len(segments) and segments[end_index+1][3] == 'Bridge' and hypot(
                        segments[end_index][1][0]-segments[end_index+1][0][0],
                        segments[end_index][1][1]-segments[end_index+1][0][1]) < 0.02:
                    end_index += 1
                end = Point(segments[end_index][1])
                end_distance = min([end.distance(previous)] + [end.distance(stroke) for stroke in strokes[:i]])
                bridge_starts.append(dict(z_mm=height, distance_to_deposited_material_mm=distance,
                                          end_distance_to_deposited_material_mm=end_distance))
        previous = footprint
    report = dict(layer_count=len(layers), floating_layer_islands=floating,
                  bridge_path_starts_checked=len(bridge_starts),
                  maximum_bridge_start_distance_mm=max((b['distance_to_deposited_material_mm'] for b in bridge_starts), default=0),
                  maximum_bridge_end_distance_mm=max((b['end_distance_to_deposited_material_mm'] for b in bridge_starts), default=0),
                  bridge_layers_mm=[z for z, segs in layers.items() if any(s[3] == 'Bridge' for s in segs)],
                  method="Extruded line-width footprints; 0.05 mm inter-layer connectivity tolerance. "
                         "Both bridge endpoints checked against previous-layer and same-layer paths deposited before that bridge. "
                         "This is a toolpath check, not a physical bridging or retention test.")
    if variant == 'curved-side-by-side-press-fit':
        report.update(check_curved_side_by_side_openings(layers, footprints))
    (output_dir / 'toolpath_review.json').write_text(json.dumps(report, indent=2)+'\n')
    assert not floating, f'Unsupported layer islands: {floating}'
    assert report['maximum_bridge_start_distance_mm'] <= 0.25, report
    assert report['maximum_bridge_end_distance_mm'] <= 0.25, report
    if variant == 'curved-side-by-side-press-fit':
        assert report['socket_clearance_probes_checked'] == 180, report
        assert not report['blocked_socket_core_probes'], report['blocked_socket_core_probes']
        labels = {.6: 'Lane A bed-facing mouth', .8: 'Lane A throat transition',
                  2.4: 'Lane B blind pocket start', 2.6: 'Lane B lower tip wall',
                  3.4: 'Lower socket transition', 6.2: 'Lane A relief-slot closures',
                  11.0: 'Lane A blind pocket closure', 12.2: 'Upper relief-slot transition',
                  13.8: 'Lane B mouth', 14.4: 'Lane B upper entry lip'}
        title, xlim, ylim, row_height = '#3D', (121, 135), (111.5, 144.5), 5.2
    elif variant == 'comparison-3b-3c':
        labels = {2.0: 'Lower bridges', 3.4: '#3B opening transition', 5.8: '#3C metal-tip roofs',
                  7.2: '#3C entry lips', 7.6: '#3C upper socket transition', 7.8: '#3C housing and relief roofs',
                  13.0: '#3B metal-tip roofs', 14.4: '#3B entry lips',
                  14.8: '#3B housing roofs', 16.2: '#3B relief roofs'}
        title, xlim, ylim, row_height = '#3B + #3C', (102, 154), (111.5, 144.5), 3.6
    elif variant == 'side-by-side-press-fit':
        labels = {2.0: 'Lower shell bridge', 5.8: 'Metal-tip pocket roofs',
                  7.2: 'Entry lips', 7.6: 'Upper socket transition', 7.8: 'Housing and relief-slot roofs'}
        title, xlim, ylim, row_height = '#3C', (120.5, 135.5), (111.5, 144.5), 5.5
    else:
        labels = {2.0: 'Lower relief-slot roofs', 3.4: 'Lower opening transition',
                  13.0: 'Metal-tip pocket roofs', 14.4: 'Upper entry lips',
                  14.8: 'Housing-pocket roofs', 16.2: 'Upper relief-slot roofs'}
        title, xlim, ylim, row_height = '#3B', (115, 141), (121.5, 134.5), 3.6
    extras = ({.6, .8, 13.8, 14.4} if variant == 'curved-side-by-side-press-fit' else
              ({7.2} if variant in ('side-by-side-press-fit', 'comparison-3b-3c') else set()))
    reviewed = sorted(set(report['bridge_layers_mm']) | extras)
    selected = [(min(layers), 'First layer')] + [(z, labels.get(z, 'Bridge layer'))
                for z in reviewed] + [(max(layers), 'Final layer')]
    rows = ceil(len(selected)/2)
    fig, axes = plt.subplots(rows, 2, figsize=(12, rows*row_height), layout='constrained', facecolor='#f8faf8')
    colors = {'Bridge': '#cf5932', 'Outer wall': '#173329', 'Inner wall': '#36805b', 'Overhang wall': '#ab6b1f'}
    for ax, (requested, label) in zip(axes.flat, selected):
        height = min(layers, key=lambda z: abs(z-requested))
        segments = layers[height]
        ax.add_collection(LineCollection([[a, b] for a, b, _, _ in segments],
                          colors=[colors.get(feature, '#a8b9ae') for _, _, _, feature in segments], linewidths=0.7))
        ax.set(xlim=xlim, ylim=ylim, aspect='equal', title=f'{height:.2f} mm · {label}')
        ax.tick_params(labelsize=8)
        if variant in ('side-by-side-press-fit', 'curved-side-by-side-press-fit'):
            ax.set_xticks([122, 128, 134])
            ax.set_yticks([114, 121, 128, 135, 142])
        ax.set_xlabel('Plate X (mm)', fontsize=9)
        ax.set_ylabel('Plate Y (mm)', fontsize=9)
    for ax in axes.flat[len(selected):]:
        ax.set_visible(False)
    fig.suptitle(f'{title} · native A1 extrusion paths\nOrange = bridges; green = walls; gray = fill', fontsize=17, color='#173329')
    fig.savefig(output_dir / 'layer_paths.png', dpi=150)
    fig.savefig(output_dir / 'layer_paths.svg')
    plt.close(fig)
    return report

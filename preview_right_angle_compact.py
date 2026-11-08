"""Measured #3F CAD views and an exterior comparison with inverted #3E."""
import hashlib
import json
from math import cos, radians, sin

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Polygon
from build123d import Axis, Plane, section

import right_angle as reference
from right_angle_compact import COMPACT, E, blank, build_holder, geometry_report, layout, local_point, pod_roll
from preview_right_angle import draw_fold, mesh_view
from preview_curved_side_by_side import draw_section


def save(fig, output_dir, name):
    fig.savefig(output_dir/f'{name}.png', dpi=150)
    fig.savefig(output_dir/f'{name}.svg')
    plt.close(fig)


def comparison(ax):
    for body, color, label in ((reference.blank(inverted=True), '#b97b49', '#3E Inverted · 14.6 mm'),
                               (blank(), '#267357', '#3F · 13.6 mm')):
        outline = section(body, section_by=Plane.XY)
        for edge in outline.edges():
            points = [edge.position_at(i/60) for i in range(61)]
            ax.plot([p.X for p in points], [p.Y for p in points], color=color, lw=2)
        ax.plot([], [], color=color, lw=2, label=label)
    ax.legend(loc='upper center', fontsize=10)
    ax.annotate('Taper beyond relief slots', xy=(-5.5, 11.5), xytext=(-15, 3),
                fontsize=10, arrowprops=dict(arrowstyle='->', color='#267357'))
    ax.annotate('Mirrored outer taper', xy=(5.5, -11.5), xytext=(10, -6),
                fontsize=10, arrowprops=dict(arrowstyle='->', color='#267357'))
    ax.set(xlim=(-25, 25), ylim=(-17, 19), aspect='equal')
    ax.set_axis_off()
    ax.set_title('Exterior sections in the same CAD coordinates\nFull width at each mouth; narrower behind each socket', fontsize=13)


def cutaway(ax, part):
    draw_section(ax, section(part, section_by=Plane.XY))
    for side in (-1, 1):
        a, b = local_point(side, -.2), local_point(side, 8)
        ax.annotate('', xy=b[:2], xytext=a[:2], arrowprops=dict(arrowstyle='->', color='#b46230', lw=2))
        a, b = local_point(side, -2, side*5), local_point(side, -2, side*17)
        ax.annotate('', xy=b[:2], xytext=a[:2], arrowprops=dict(arrowstyle='->', color='#367b98', lw=2))
    ax.set(xlim=(-13, 13), ylim=(-26, 26), aspect='equal')
    ax.set_axis_off()
    ax.set_title('Top cutaway · straight, parallel insertion axes\nOrange = insertion · blue = outward cable directions', fontsize=13)


def write_preview(concepts, output_dir):
    fit = concepts[0].spec.fit
    part = build_holder(fit)
    report = geometry_report(fit)
    fig = plt.figure(figsize=(16, 13), layout='constrained', facecolor='#f8faf8')
    grid = fig.add_gridspec(2, 2)
    ax = fig.add_subplot(grid[0, 0])
    mesh_view(ax, part)
    ax.set_title('Actual CAD · shorter body and rounded outer tapers', fontsize=14)
    cutaway(fig.add_subplot(grid[0, 1]), part)
    draw_fold(fig.add_subplot(grid[1, 0]), part, True)
    comparison(fig.add_subplot(grid[1, 1]))
    fig.suptitle(f'#3F Compact tapered right-angle press-fit · {fit}\n'
                 f'13.6 × 27.2 × 9.198 mm · {report["volume_reduction_percent"]:.1f}% less CAD volume than #3E Inverted',
                 fontsize=20, color='#173329')
    save(fig, output_dir, 'preview')
    fig, ax = plt.subplots(figsize=(13, 8), layout='constrained', facecolor='#f8faf8')
    comparison(ax)
    fig.suptitle('#3E Inverted → #3F · shorter, tapered exterior; unchanged local socket fit', fontsize=17)
    save(fig, output_dir, 'comparison')
    fig, ax = plt.subplots(figsize=(13, 8), layout='constrained', facecolor='#f8faf8')
    draw_fold(ax, part, True)
    fig.suptitle('#3F · inverted 15° bend between the lanes', fontsize=19)
    save(fig, output_dir, 'bend_section')
    fig, axes = plt.subplots(2, 1, figsize=(12, 9), layout='constrained', facecolor='#f8faf8')
    for ax, side in zip(axes, (-1, 1), strict=True):
        roll = radians(pod_roll(side))
        plane = Plane(origin=local_point(side, 0), x_dir=(1, 0, 0), z_dir=(0, cos(roll), sin(roll)))
        draw_section(ax, section(part, section_by=plane), (0, 2))
        for start, end, height, color in ((2, 10.4, 2.3, '#aab4bd'), (-.5, 2, 4.7, '#343b40'), (-3, -.5, 6, '#d5d8dc')):
            pts = [local_point(side, d, 0, z) for d, z in
                   ((start, -height/2), (end, -height/2), (end, height/2), (start, height/2))]
            ax.add_patch(Polygon([(p[0], p[2]) for p in pts], facecolor=color, edgecolor='#506473', alpha=.65))
        ax.set(xlim=(-11, 11), ylim=(-6, 7), aspect='equal')
        ax.set_axis_off()
        ax.set_title(f'Lane {"A" if side<0 else "B"} · 11.2 mm pocket · 2.4 mm closed end wall', fontsize=14)
    fig.suptitle('#3F · seated metal tips and black bases; silver elbows schematic\n2 mm base capture · 0.8 mm tip clearance · 0.5 mm elbow standoff', fontsize=18)
    save(fig, output_dir, 'side_sections')


def write_plate_map(concepts, output_dir):
    concept = concepts[0]
    dimensions, transforms, centers = layout()
    transform, center = transforms[0], centers[0]
    part = build_holder(concept.spec.fit).rotate(Axis.Y, E.print_angle).translate(transform[9:])
    fig, ax = plt.subplots(figsize=(12, 7), layout='constrained', facecolor='#f8faf8')
    draw_section(ax, section(part, section_by=Plane.XY.offset(.2)))
    ax.text(128, 146, f'#3F · {concept.spec.fit}', ha='center', fontsize=17, color='#173329')
    ax.text(.5, .035, 'Negative-X end down\n−90° Y · 13.6 mm print height',
            transform=ax.transAxes, ha='center', fontsize=10)
    ax.set(xlim=(113, 143), ylim=(102, 153), aspect='equal', xlabel='Plate X (mm)', ylabel='Plate Y (mm)')
    ax.grid(alpha=.15)
    ax.set_title('A1 · one centered #3F · back of plate at top\nPLA · 0.4 mm · 0.20 mm · 20% gyroid · 3 walls · no supports', fontsize=16)
    save(fig, output_dir, 'plate_map')
    item = dict(name=concept.spec.title, fit=concept.spec.fit, center_xy_mm=center,
                print_dimensions_mm=dimensions, transform=transform,
                source_stl=str(concept.stl_path.relative_to(output_dir)),
                source_sha256=hashlib.sha256(concept.stl_path.read_bytes()).hexdigest() if concept.stl_path.exists() else None)
    (output_dir/'plate_manifest.json').write_text(json.dumps(dict(variant=COMPACT, objects=[item]), indent=2)+'\n')

"""Actual CAD views and end-face print orientation for #3D."""
from pathlib import Path

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
import numpy as np
from build123d import Axis, Plane, section

from main import (CURVED_SIDE_BY_SIDE_PRINT_ANGLE, curved_side_by_side_local_point,
                  curved_side_by_side_minimums, make_curved_side_by_side_body)
from preview_curved import render_mesh


def draw_section(ax, cut, coordinates=(0, 1), color='#b0d9c3'):
    vertices, faces = cut.tessellate(0.01)
    points = np.array([[tuple(p)[i] for i in coordinates] for p in vertices])
    ax.add_collection(PolyCollection(points[np.array(faces)], facecolors=color, edgecolors='none', antialiaseds=False))
    for edge in cut.edges():
        samples = [tuple(edge.position_at(i/50)) for i in range(51)]
        ax.plot([p[coordinates[0]] for p in samples], [p[coordinates[1]] for p in samples],
                color='#327449', linewidth=0.85)


def write_preview(part, output_dir: Path):
    vertices, faces = part.tessellate(0.025)
    vertices = np.array([tuple(v) for v in vertices])
    fig = plt.figure(figsize=(15, 11), layout='constrained', facecolor='#f8faf8')
    grid = fig.add_gridspec(2, 2, width_ratios=[1.25, 1], height_ratios=[1, 1.1])
    fig.suptitle('#3D · 15° curved side-by-side press-fit\n15.2 × 30 × 9.774 mm · two straight, counter-angled sockets',
                 fontsize=21, color='#173329')
    ax = fig.add_subplot(grid[0, 0])
    ax.imshow(render_mesh(vertices, np.array(faces)))
    ax.set_axis_off()
    ax.set_title('One connected holder · curved wrist and outer faces', fontsize=14, color='#173329')
    minimums = curved_side_by_side_minimums()
    ax.text(.5, -.03, f"{minimums['inter_lane_void_separation_mm']:.3f} mm inter-lane web · "
            f"{minimums['enclosed_wall_mm']:.2f} mm minimum enclosed wall",
            transform=ax.transAxes, ha='center', fontsize=11, color='#365348')

    ax = fig.add_subplot(grid[1, 0])
    draw_section(ax, section(make_curved_side_by_side_body(), section_by=Plane.XZ), (0, 2))
    for side, letter, color in ((-1, 'A', '#b46230'), (1, 'B', '#5069a0')):
        outside = curved_side_by_side_local_point(side, -2.5)
        end = curved_side_by_side_local_point(side, 10.8)
        ax.plot([outside[0], end[0]], [outside[2], end[2]], '--', color=color, linewidth=1.6)
        mouth = curved_side_by_side_local_point(side, 0)
        seated = curved_side_by_side_local_point(side, 5)
        ax.annotate('', xy=(seated[0], seated[2]), xytext=(mouth[0], mouth[2]),
                    arrowprops=dict(arrowstyle='->', color=color, linewidth=2))
        ax.text(side*7.3, 6.8, f'Lane {letter}\n7.5° tilt', ha='center', fontsize=12, color=color)
    ax.annotate('Convex outer face', xy=(0, 4.7), xytext=(0, 8.6), ha='center', color='#173329',
                arrowprops=dict(arrowstyle='->', color='#327449'))
    ax.annotate('Concave wrist face', xy=(0, -4.7), xytext=(0, -9), ha='center', color='#173329',
                arrowprops=dict(arrowstyle='->', color='#327449'))
    ax.set(xlim=(-11, 11), ylim=(-10.5, 10.5), aspect='equal')
    ax.set_axis_off()
    ax.set_title('Side profile · 15° between projected socket axes', fontsize=14, color='#173329')
    ax.text(.5, -.01, 'Axes overlap only in this view; lanes are 13 mm apart.\nThe complete sockets stay straight.',
            transform=ax.transAxes, ha='center', fontsize=11, color='#365348')

    ax = fig.add_subplot(grid[:, 1])
    draw_section(ax, section(part, section_by=Plane.XY))
    for side, letter, color in ((-1, 'A', '#b46230'), (1, 'B', '#5069a0')):
        start = curved_side_by_side_local_point(side, -4)
        end = curved_side_by_side_local_point(side, 9)
        stop = curved_side_by_side_local_point(side, 10.8)
        ax.plot([start[0], stop[0]], [start[1], stop[1]], '--', color=color, linewidth=1)
        ax.annotate('', xy=end[:2], xytext=start[:2], arrowprops=dict(arrowstyle='->', lw=2, color=color))
        ax.text(start[0], start[1]+1.8, f'Plug {letter}', ha='center', color=color, fontsize=12)
    ax.annotate('', xy=(-7.6, -17.7), xytext=(7.6, -17.7), arrowprops=dict(arrowstyle='|-|', color='#52675c'))
    ax.text(0, -19.1, '15.2 mm', ha='center', fontsize=11, color='#173329')
    ax.annotate('', xy=(12.2, -15), xytext=(12.2, 15), arrowprops=dict(arrowstyle='|-|', color='#52675c'))
    ax.text(13.1, 0, '30 mm', rotation=90, va='center', fontsize=11, color='#173329')
    ax.set(xlim=(-14.5, 15), ylim=(-21, 18), aspect='equal')
    ax.set_axis_off()
    ax.set_title('Top cutaway at Z = 0\nOpposite entries · independent blind pockets', fontsize=14, color='#173329')
    fig.savefig(output_dir/'preview.png', dpi=150)
    fig.savefig(output_dir/'preview.svg')
    plt.close(fig)
    write_side_sections(part, output_dir)


def write_side_sections(part, output_dir: Path):
    fig, axes = plt.subplots(2, 1, figsize=(12, 10), layout='constrained', facecolor='#f8faf8')
    fig.suptitle('#3D · actual side sections through each socket axis\nTwo separate lanes · 7.5° each · 15° total',
                 fontsize=19, color='#173329')
    for ax, side, letter, color in zip(axes, (-1, 1), ('A', 'B'), ('#b46230', '#5069a0'), strict=True):
        cut = section(part, section_by=Plane.XZ.offset(-side*6.5))
        draw_section(ax, cut, (0, 2))
        outside = curved_side_by_side_local_point(side, -2.5)
        end = curved_side_by_side_local_point(side, 10.8)
        ax.plot([outside[0], end[0]], [outside[2], end[2]], '--', color=color, lw=1.3)
        mouth = curved_side_by_side_local_point(side, 0)
        seated = curved_side_by_side_local_point(side, 7)
        ax.annotate('', xy=(seated[0], seated[2]), xytext=(mouth[0], mouth[2]),
                    arrowprops=dict(arrowstyle='->', color=color, lw=2))
        ax.text(0, 6.2, f'Lane {letter} · Y = {side*6.5:g} mm · straight socket, 7.5° tilt',
                ha='center', color=color, fontsize=13)
        ax.set(xlim=(-11, 11), ylim=(-7, 8), aspect='equal')
        ax.set_axis_off()
    fig.text(.5, .01, 'Arrows show opposite insertion directions · concave underside faces the wrist',
             ha='center', fontsize=12, color='#365348')
    fig.savefig(output_dir/'side_sections.png', dpi=150)
    fig.savefig(output_dir/'side_sections.svg')
    plt.close(fig)


def write_plate_map(part, output_dir: Path):
    oriented = part.rotate(Axis.Y, CURVED_SIDE_BY_SIDE_PRINT_ANGLE)
    bounds = oriented.bounding_box()
    oriented = oriented.translate((128-(bounds.min.X+bounds.max.X)/2, 128, -bounds.min.Z))
    fig, ax = plt.subplots(figsize=(8, 9), layout='constrained', facecolor='#f8faf8')
    # The CAD section matches the native 0.20 mm first-layer plane.
    draw_section(ax, section(oriented, section_by=Plane.XY.offset(.2)))
    ax.text(128, 149, '#3D', ha='center', fontsize=27, color='#173329')
    ax.text(128, 146.8, 'Flat negative-X end down · curved wrist face stays intact', ha='center', fontsize=10, color='#365348')
    ax.set(xlim=(116, 140), ylim=(107, 153), aspect='equal', xlabel='Plate X (mm)', ylabel='Plate Y (mm)')
    ax.grid(alpha=.15)
    ax.set_title('A1 · #3D centered at (128, 128) mm\nTop view · back of plate at top', fontsize=16, color='#173329')
    ax.text(128, 110, 'Overall print envelope: 10.99 × 30 × 15.08 mm', ha='center', fontsize=10, color='#365348')
    ax.text(128, 108, 'PLA · 0.4 mm · 0.20 mm · 20% gyroid · no supports', ha='center', fontsize=10, color='#365348')
    fig.savefig(output_dir/'plate_map.png', dpi=150)
    fig.savefig(output_dir/'plate_map.svg')
    plt.close(fig)

"""Render #3C's actual CAD mesh and a top section through both socket lanes."""
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
import numpy as np
from build123d import Plane, section

from main import side_by_side_local_point, side_by_side_minimums
from preview_curved import render_mesh


def write_preview(part, output_dir: Path):
    vertices, faces = part.tessellate(0.025)
    vertices = np.array([tuple(v) for v in vertices])
    fig, axes = plt.subplots(1, 2, figsize=(14, 9), layout='constrained', facecolor='#f8faf8')
    fig.suptitle('#3C · Side-by-side press-fit\n13 × 30 × 8.4 mm · two parallel sockets, opposite insertion directions',
                 fontsize=20, color='#173329')
    ax = axes[0]
    ax.imshow(render_mesh(vertices, np.array(faces)))
    ax.set_axis_off()
    ax.set_title('One flat, connected holder', fontsize=15, color='#173329')
    separation, wall = side_by_side_minimums()
    ax.text(0.5, -0.08, f'{separation:.2f} mm minimum inter-lane web\n{wall:.2f} mm minimum enclosed wall',
            transform=ax.transAxes, ha='center', fontsize=12, color='#365348')

    ax = axes[1]
    cut = section(part, section_by=Plane.XY)
    points, triangles = cut.tessellate(0.01)
    points = np.array([(p.X, p.Y) for p in points])
    ax.add_collection(PolyCollection(points[np.array(triangles)], facecolors='#b0d9c3',
                                     edgecolors='none', antialiaseds=False))
    for edge in cut.edges():
        samples = [edge.position_at(t/50) for t in range(51)]
        ax.plot([p.X for p in samples], [p.Y for p in samples], color='#327449', linewidth=0.9)
    for side, letter in ((-1, 'A'), (1, 'B')):
        start = side_by_side_local_point(side, -4)
        end = side_by_side_local_point(side, 9)
        stop = side_by_side_local_point(side, 10.8)
        ax.plot([start[0], stop[0]], [start[1], stop[1]], '--', color='#b46230', linewidth=1)
        ax.annotate('', xy=end[:2], xytext=start[:2],
                    arrowprops=dict(arrowstyle='->', lw=2, color='#b46230'))
        ax.text(start[0], start[1]+1.7, f'Plug {letter}', ha='center', fontsize=12, color='#7d4020')
    ax.annotate('', xy=(-6.5, -17), xytext=(6.5, -17),
                arrowprops=dict(arrowstyle='|-|', color='#52675c'))
    ax.text(0, -18.6, '13 mm', ha='center', fontsize=11, color='#173329')
    ax.annotate('', xy=(12, -15), xytext=(12, 15), arrowprops=dict(arrowstyle='|-|', color='#52675c'))
    ax.text(13, 0, '30 mm', rotation=90, va='center', fontsize=11, color='#173329')
    ax.set(xlim=(-14, 14), ylim=(-20, 18), aspect='equal')
    ax.set_axis_off()
    ax.set_title('Top cutaway · wide plug faces stay flat', fontsize=15, color='#173329')
    fig.text(0.5, 0.01, 'Push each plug straight into its own lane; cables exit opposite ends. Neither pocket passes through.',
             ha='center', fontsize=12, color='#365348')
    fig.savefig(output_dir/'preview.png', dpi=150)
    fig.savefig(output_dir/'preview.svg')
    plt.close(fig)

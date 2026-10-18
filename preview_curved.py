"""Render the actual #3B mesh and a CAD section through its socket axes."""
from pathlib import Path

import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
from matplotlib.collections import PolyCollection
import numpy as np
from build123d import Plane, section

from main import BEND_DEGREES, curved_divider_thickness, curved_local_point


def render_mesh(vertices, faces, width=1100, height=600):
    """Orthographic depth-buffer rendering avoids painter-order artifacts in socket cavities."""
    camera = np.array([0.5, -0.8, 0.38])
    camera /= np.linalg.norm(camera)
    right = np.cross([0, 0, 1], camera)
    right /= np.linalg.norm(right)
    up = np.cross(camera, right)
    projected = np.column_stack((vertices @ right, -(vertices @ up), vertices @ camera))
    extent = np.ptp(projected[:, :2], axis=0)
    scale = min((width-50)/extent[0], (height-40)/extent[1])
    projected[:, :2] -= (projected[:, :2].min(axis=0) + projected[:, :2].max(axis=0))/2
    projected[:, :2] = projected[:, :2]*scale + [width/2, height/2]
    pixels = np.full((height, width, 3), [248, 250, 248], dtype=np.uint8)
    depth = np.full((height, width), -np.inf)
    light = np.array([0.3, -0.5, 1.0])
    light /= np.linalg.norm(light)
    for face in faces:
        triangle = vertices[face]
        normal = np.cross(triangle[1]-triangle[0], triangle[2]-triangle[0])
        length = np.linalg.norm(normal)
        if length < 1e-12 or normal @ camera <= 0:
            continue
        normal /= length
        a, b, c = projected[face]
        lo = np.maximum(np.floor(np.min([a[:2], b[:2], c[:2]], axis=0)).astype(int), [0, 0])
        hi = np.minimum(np.ceil(np.max([a[:2], b[:2], c[:2]], axis=0)).astype(int), [width-1, height-1])
        if np.any(hi < lo):
            continue
        x, y = np.meshgrid(np.arange(lo[0], hi[0]+1)+0.5, np.arange(lo[1], hi[1]+1)+0.5)
        denominator = (b[1]-c[1])*(a[0]-c[0]) + (c[0]-b[0])*(a[1]-c[1])
        if abs(denominator) < 1e-12:
            continue
        u = ((b[1]-c[1])*(x-c[0]) + (c[0]-b[0])*(y-c[1]))/denominator
        v = ((c[1]-a[1])*(x-c[0]) + (a[0]-c[0])*(y-c[1]))/denominator
        w = 1-u-v
        z = u*a[2] + v*b[2] + w*c[2]
        tile = depth[lo[1]:hi[1]+1, lo[0]:hi[0]+1]
        visible = (u >= -1e-7) & (v >= -1e-7) & (w >= -1e-7) & (z > tile)
        tile[visible] = z[visible]
        color = np.array([121, 179, 152])*(0.55+0.45*max(0, normal @ light))
        pixels[lo[1]:hi[1]+1, lo[0]:hi[0]+1][visible] = color.astype(np.uint8)
    return pixels


def write_preview(part, output_dir: Path):
    vertices, triangles = part.tessellate(0.025)
    vertices = np.array([tuple(v) for v in vertices])
    triangles = np.array(triangles)
    fig = plt.figure(figsize=(12, 8), facecolor="#f8faf8", layout="constrained")
    grid = fig.add_gridspec(2, 1, height_ratios=[1.35, 1])
    ax = fig.add_subplot(grid[0])
    ax.imshow(render_mesh(vertices, triangles))
    ax.set_axis_off()
    ax.set_title("#3B · 15° curved press-fit", fontsize=23, color="#173329", pad=0)
    ax.text(0.5, -0.04, f"24 mm overall length · 17 mm width · {part.bounding_box().size.Z:.2f} mm overall height",
              transform=ax.transAxes, ha="center", fontsize=12, color="#365348")

    ax = fig.add_subplot(grid[1])
    cut = section(part, section_by=Plane.XZ)
    points, faces = cut.tessellate(0.01)
    points = np.array([(p.X, p.Z) for p in points])
    ax.add_collection(PolyCollection(points[np.array(faces)], facecolors="#b0d9c3", edgecolors="none", antialiaseds=False))
    for edge in cut.edges():
        samples = [edge.position_at(t/50) for t in range(51)]
        ax.plot([p.X for p in samples], [p.Z for p in samples], color="#327449", linewidth=0.8)
    for side in (-1, 1):
        mouth = curved_local_point(side, 0)
        tip = curved_local_point(side, 10.8)
        outside = curved_local_point(side, -2.2)
        ax.plot([outside[0], tip[0]], [outside[2], tip[2]], "--", color="#b46230", lw=1.5)
        ax.annotate("", xy=(tip[0], tip[2]), xytext=(mouth[0], mouth[2]),
                    arrowprops=dict(arrowstyle="->", lw=1.8, color="#b46230"))
        ax.text(side*8.5, 4.9, "Straight socket\n7.5° tilt", ha="center", fontsize=11, color="#7d4020")
    ax.annotate(f"Solid divider\n{curved_divider_thickness():.2f} mm minimum", xy=(0, -1.5), xytext=(0, 4.9),
                ha="center", fontsize=10, color="#173329",
                arrowprops=dict(arrowstyle="->", color="#327449"))
    ax.annotate("", xy=(-12, -6.5), xytext=(12, -6.5),
                arrowprops=dict(arrowstyle="|-|", color="#52675c"))
    ax.text(0, -6.3, "24 mm", ha="center", fontsize=11, color="#173329")
    ax.text(0, 8.1, f"Side section · {BEND_DEGREES:g}° total bend", ha="center", fontsize=14, color="#173329")
    ax.text(0, -10, "Concave underside faces the wrist · arrows show insertion direction",
            ha="center", fontsize=11, color="#365348")
    ax.set(xlim=(-16, 16), ylim=(-11.2, 9.4), aspect="equal")
    ax.set_axis_off()
    fig.savefig(output_dir / "preview.png", dpi=170)
    fig.savefig(output_dir / "preview.svg")
    plt.close(fig)

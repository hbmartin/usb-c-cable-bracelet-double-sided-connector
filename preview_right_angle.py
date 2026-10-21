"""Actual #3E views: center fold between lanes, with parallel insertion axes."""
import hashlib
import json

import matplotlib
matplotlib.use('Agg')
import matplotlib.pyplot as plt
from matplotlib.patches import Polygon
import numpy as np
from build123d import Axis, Plane, section

from preview_curved import render_mesh
from preview_curved_side_by_side import draw_section
from right_angle import E, FITS, SAMPLES, INVERTED, build_holder, layout, local_point, pod_roll

COLORS = {'gentle': '#367b98', 'standard': '#a56729', 'firm': '#8c527d'}


def mesh_view(ax, part):
    vertices, triangles = part.tessellate(.025)
    ax.imshow(render_mesh(np.array([tuple(v) for v in vertices]), np.array(triangles)))
    ax.set_axis_off()


def envelope(ax, side, start, end, width, height, sample=False, inverted=False, **style):
    points = [local_point(side,d,0,z,sample,inverted) for d,z in
              ((start,-height/2),(end,-height/2),(end,height/2),(start,height/2))]
    ax.add_patch(Polygon([[p[0],p[2]] for p in points], **style))


def draw_side(ax, part, side, sample, fit, inverted=False):
    # Section through the actual rolled socket's depth/height plane.
    roll = np.radians(pod_roll(side,sample,inverted))
    plane = Plane.XZ if sample else Plane(origin=local_point(side,0,inverted=inverted), x_dir=(1,0,0),
                                         z_dir=(0,np.cos(roll),np.sin(roll)))
    draw_section(ax,section(part,section_by=plane),(0,2))
    envelope(ax,side,2,10.4,8.1,2.3,sample,inverted,facecolor='#aab4bd',edgecolor='#4f6071',alpha=.75)
    envelope(ax,side,-.5,2,9.9,4.7,sample,inverted,facecolor='#343b40',edgecolor='#101a20',alpha=.6)
    envelope(ax,side,-3,-.5,12,6,sample,inverted,facecolor='#d5d8dc',edgecolor='#83909c',linestyle='--')
    start,stop=local_point(side,-4,sample=sample,inverted=inverted),local_point(side,11.2,sample=sample,inverted=inverted)
    ax.plot([start[0],stop[0]],[start[2],stop[2]],'--',color=COLORS[fit],lw=1)
    a,b=local_point(side,-.1,sample=sample,inverted=inverted),local_point(side,6,sample=sample,inverted=inverted)
    ax.annotate('',xy=(b[0],b[2]),xytext=(a[0],a[2]),arrowprops=dict(arrowstyle='->',color=COLORS[fit],lw=2))
    mouth=local_point(side,-.25,0,2.3,sample,inverted)
    ax.annotate('0.5 mm to silver elbow',xy=(mouth[0],mouth[2]),xytext=(0,5.7),ha='center',fontsize=10,
                arrowprops=dict(arrowstyle='->',color='#52675c'))
    ax.set(xlim=(-12,12),ylim=(-7,7),aspect='equal')
    ax.set_axis_off()


def draw_fold(ax,part,inverted=False):
    """Look along X so the central bridge and the two rolled metal sections are visible."""
    draw_section(ax,section(part,section_by=Plane.YZ),(1,2))
    for side in (-1,1):
        points=[local_point(side,E.length/2,y,z,inverted=inverted) for y,z in ((-4.05,-1.15),(4.05,-1.15),(4.05,1.15),(-4.05,1.15))]
        ax.add_patch(Polygon([[p[1],p[2]] for p in points],facecolor='#adb7c0',edgecolor='#506473',alpha=.8))
        # Reference lines are parallel to each plug's actual wide face.
        a,b=local_point(side,0,-4,4.8,inverted=inverted),local_point(side,0,4,4.8,inverted=inverted)
        ax.plot([a[1],b[1]],[a[2],b[2]],'--',color='#a56729',lw=1.5)
        ax.text(side*7.5,7.5,f'Plug {"A" if side==-1 else "B"}\n{pod_roll(side,inverted=inverted):+g}° roll',ha='center',fontsize=13)
    ax.annotate('15° middle bend · center '+('dips' if inverted else 'rises'),xy=(0,E.radial_thickness/2),xytext=(0,11),ha='center',fontsize=15,
                color='#173329',arrowprops=dict(arrowstyle='->',color='#327449',lw=1.5))
    ax.annotate('Inverted: convex lower face' if inverted else 'Original: concave lower face',xy=(0,-E.radial_thickness/2),xytext=(0,-9),ha='center',fontsize=12,
                color='#173329',arrowprops=dict(arrowstyle='->',color='#327449'))
    ax.set(xlim=(-18,18),ylim=(-11,13),aspect='equal')
    ax.set_axis_off()
    ax.set_title('View along insertion · fold line points into the page\nBoth insertion axes remain straight and parallel',fontsize=14,color='#173329')


def write_preview(concepts,output_dir,variant):
    sample=variant==SAMPLES
    inverted=variant==INVERTED
    if sample:
        fig,axes=plt.subplots(2,3,figsize=(15,9),layout='constrained',facecolor='#f8faf8')
        for col,concept in enumerate(concepts):
            fit=concept.spec.fit
            part=build_holder(fit,True)
            mesh_view(axes[0,col],part.rotate(Axis.Z,180))
            axes[0,col].set_title(f'{fit.title()} · {FITS[fit][0]:.2f} × {FITS[fit][1]:.2f} mm mouth',color=COLORS[fit],fontsize=14)
            draw_side(axes[1,col],part,-1,True,fit)
            axes[1,col].set_title('Straight single-socket block · full blind depth',fontsize=12)
        fig.suptitle('#3E · fit samples: gentle → standard → firm\n14.6 × 14.4 × 7.6 mm · same socket, throat and relief slots; only mouth size changes',fontsize=20,color='#173329')
        fig.text(.5,.01,'Measured metal/base envelopes · dashed silver elbow schematic only · test gentle first',ha='center',fontsize=11)
    else:
        fit=concepts[0].spec.fit
        part=build_holder(fit,inverted=inverted)
        fig=plt.figure(figsize=(15,12),layout='constrained',facecolor='#f8faf8')
        grid=fig.add_gridspec(2,2,height_ratios=[1.1,1])
        ax=fig.add_subplot(grid[0,0])
        mesh_view(ax,part)
        ax.set_title('Actual CAD · two straight pods and a rounded center bend',fontsize=14,color='#173329')
        ax=fig.add_subplot(grid[0,1])
        draw_section(ax,section(part,section_by=Plane.XY))
        for side in (-1,1):
            a,b=local_point(side,-.1,inverted=inverted),local_point(side,7,inverted=inverted)
            ax.annotate('',xy=b[:2],xytext=a[:2],arrowprops=dict(arrowstyle='->',color='#b46230',lw=2))
            points=[local_point(side,d,y,inverted=inverted) for d,y in
                    ((-3,-4.95 if side==1 else -12),(-.5,-4.95 if side==1 else -12),
                     (-.5,12 if side==1 else 4.95),(-3,12 if side==1 else 4.95))]
            ax.add_patch(Polygon([p[:2] for p in points],facecolor='#d5d8dc',edgecolor='#83909c',linestyle='--'))
            a,b=local_point(side,-2,side*12,inverted=inverted),local_point(side,-2,side*19,inverted=inverted)
            ax.annotate('',xy=b[:2],xytext=a[:2],arrowprops=dict(arrowstyle='->',color='#367b98',lw=3))
        ax.set(xlim=(-14,14),ylim=(-27,27),aspect='equal')
        ax.set_axis_off()
        ax.set_title('Top cutaway · opposite entries, parallel axes\nBlue arrows = outward cables · silver elbows schematic',fontsize=13,color='#173329')
        draw_fold(fig.add_subplot(grid[1,:]),part,inverted)
        fig.suptitle(f'#3E {"Inverted · " if inverted else "· "}15° bend BETWEEN the plug lanes · {fit}\n14.6 × 27.2 × 9.20 mm · 7.5° roll per pod about the insertion direction',fontsize=21,color='#173329')
    fig.savefig(output_dir/'preview.png',dpi=150)
    fig.savefig(output_dir/'preview.svg')
    plt.close(fig)
    if not sample:
        fig,ax=plt.subplots(figsize=(13,8),layout='constrained',facecolor='#f8faf8')
        draw_fold(ax,part,inverted)
        fig.savefig(output_dir/'bend_section.png',dpi=150)
        fig.savefig(output_dir/'bend_section.svg')
        plt.close(fig)
        fig,axes=plt.subplots(2,1,figsize=(12,9),layout='constrained',facecolor='#f8faf8')
        for ax,side in zip(axes,(-1,1),strict=True):
            draw_side(ax,part,side,False,fit,inverted)
            ax.set_title(f'Lane {"A" if side==-1 else "B"} · straight insertion axis parallel to X',fontsize=14)
        fig.suptitle('#3E '+('Inverted ' if inverted else '')+'· actual sections along each socket\nInsertion axes parallel · 15° angle is BETWEEN the wide faces',fontsize=19,color='#173329')
        fig.text(.5,.01,'Measured metal/base envelopes seated · 0.8 mm tip clearance · silver housing schematic only',ha='center',fontsize=11)
        fig.savefig(output_dir/'side_sections.png',dpi=150)
        fig.savefig(output_dir/'side_sections.svg')
        plt.close(fig)
        if inverted:
            fig,axes=plt.subplots(1,2,figsize=(18,8),layout='constrained',facecolor='#f8faf8')
            for ax,reverse in zip(axes,(False,True),strict=True):
                draw_fold(ax,build_holder(fit,inverted=reverse),reverse)
                ax.set_title('#3E '+('Inverted · center dips' if reverse else 'Original · center rises'),fontsize=18,color='#173329')
            fig.suptitle('Original versus inverted · same CAD coordinates, +Z up\nViewed along X · parallel insertion axes point into the page · sockets and cable directions preserved',fontsize=19,color='#173329')
            fig.savefig(output_dir/'bend_comparison.png',dpi=150)
            fig.savefig(output_dir/'bend_comparison.svg')
            plt.close(fig)


def write_plate_map(concepts,output_dir,variant):
    sample=variant==SAMPLES
    inverted=variant==INVERTED
    dimensions,transforms,centers=layout(variant)
    fig,ax=plt.subplots(figsize=(12,7),layout='constrained',facecolor='#f8faf8')
    items=[]
    for concept,transform,center in zip(concepts,transforms,centers,strict=True):
        part=build_holder(concept.spec.fit,sample,inverted).rotate(Axis.Y,E.print_angle).translate(transform[9:])
        draw_section(ax,section(part,section_by=Plane.XY.offset(.2)))
        ax.text(center[0],center[1]+dimensions[1]/2+3,concept.spec.fit.title() if sample else '#3E '+('Inverted · ' if inverted else '· ')+concept.spec.fit,
                ha='center',fontsize=16,color=COLORS[concept.spec.fit])
        ax.text(center[0],center[1]-dimensions[1]/2-3,
                f'{FITS[concept.spec.fit][0]:.2f} × {FITS[concept.spec.fit][1]:.2f} mm mouth',ha='center',fontsize=10)
        items.append(dict(name=concept.spec.title,fit=concept.spec.fit,center_xy_mm=center,
                          print_dimensions_mm=dimensions,transform=transform,
                          source_stl=str(concept.stl_path.relative_to(output_dir)),
                          source_sha256=hashlib.sha256(concept.stl_path.read_bytes()).hexdigest() if concept.stl_path.exists() else None))
    lo,hi=centers[0][0]-dimensions[0]/2,centers[-1][0]+dimensions[0]/2
    ax.set(xlim=(lo-9,hi+9),ylim=(102,153),aspect='equal',xlabel='Plate X (mm)',ylabel='Plate Y (mm)')
    ax.grid(alpha=.15)
    ax.set_title('A1 · '+('gentle → standard → firm · 12 mm gaps' if sample else 'one centered '+('inverted' if inverted else 'corrected')+' #3E')+
                 '\nNegative-X end down · −90° Y · back of plate at top',fontsize=17,color='#173329')
    ax.text((lo+hi)/2,104,'PLA · 0.4 mm · 0.20 mm · 20% gyroid · 3 walls · no supports',ha='center',fontsize=10)
    fig.savefig(output_dir/'plate_map.png',dpi=150)
    fig.savefig(output_dir/'plate_map.svg')
    plt.close(fig)
    (output_dir/'plate_manifest.json').write_text(json.dumps(dict(variant=variant,gap_mm=12 if sample else None,objects=items),indent=2)+'\n')

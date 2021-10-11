from skspatial.objects import Plane
from skspatial.objects import Point
from skspatial.objects import Vector
from skspatial.plotting import plot_3d

import matplotlib.pyplot as plt
import numpy as np
""""
WARNING!!!
check this link,seems to solve the problem
https://stackoverflow.com/questions/23472048/projecting-3d-points-to-2d-plane
"""


def perpendicular(a):
    b = np.empty_like(a)
    b[0] = -a[1]
    b[1] = a[0]
    return b


def normalize(a):
    a = np.array(a)
    return a/np.linalg.norm(a)


p1 = np.array([1, 1, 0])
p2 = np.array([2, 2, 1])

vec = Vector(p2-p1)
print("vec:", vec)

plane_perp = perpendicular(np.array(vec))
plane_perp[2] = 0
print("plane_perp:", plane_perp)
plane_perp = Vector(plane_perp)
plane = Plane(point=p1, normal=plane_perp)

point = Point(p2)

point_projected = plane.project_point(point)
vector_projection = Vector.from_points(point, point_projected)

print('vector_projection:', vector_projection)

plot_3d(
    vec.plotter(),
    plane_perp.plotter(),
    plane.plotter(lims_x=(-5, 10), lims_y=(-5, 15), alpha=0.3),
    point.plotter(s=75, c='k'),
    point_projected.plotter(c='r', s=75, zorder=3),
    vector_projection.plotter(point=point, c='k', linestyle='--'),
)
plt.show()

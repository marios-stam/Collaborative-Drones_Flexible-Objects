"""

Voronoi Road Map Planner

author: Atsushi Sakai (@Atsushi_twi)

"""

import math
import matplotlib.pyplot as plt

from path_planner import VoronoiRoadMapPlanner

show_animation = 0

pi=math.pi
def PointsInCircum(r,n=100):
        return [(math.cos(2*pi/n*x)*r,math.sin(2*pi/n*x)*r) for x in range(0,n+1)]

def main():
    print(__file__ + " start!!")

    # start and goal position
    sx = -3 # [m]
    sy = -2  # [m]
    gx = 3  # [m]
    gy = 2  # [m]
    robot_size = 0.1  # [m]

    ox = []
    oy = []
    
    limit_len=10
    n_points_limits=20
    for i in range(n_points_limits):
        ox.append(i/n_points_limits*limit_len-limit_len/2)
        oy.append(limit_len/2)
    for i in range(n_points_limits):
        ox.append(limit_len/2)
        oy.append(i/n_points_limits*limit_len-limit_len/2)
    
    for i in range(n_points_limits):
        ox.append(-limit_len/2)
        oy.append(i/n_points_limits*limit_len-limit_len/2)
    
    for i in range(n_points_limits):
        ox.append(i/n_points_limits*limit_len-limit_len/2)
        oy.append(-limit_len/2)

    points=PointsInCircum(r=1,n=20)

    for i in points:
        ox.append(i[0]+1.5)
        oy.append(i[1]+1.5)

    points=PointsInCircum(r=1,n=20)
    for i in points:
        ox.append(i[0]-1.5)
        oy.append(i[1]-1.5)

    if show_animation:  # pragma: no cover
        plt.plot(ox, oy, ".k")
        plt.plot(sx, sy, "^r")
        plt.plot(gx, gy, "^c")
        plt.grid(True)
        plt.axis("equal")

    rx, ry = VoronoiRoadMapPlanner(show_animation).planning(sx, sy, gx, gy, ox, oy,
                                              robot_size)

    assert rx, 'Cannot found path'

    if show_animation:  # pragma: no cover
        plt.plot(rx, ry, "-r")
        plt.pause(0.1)
        plt.show()

    
if __name__ == '__main__':
    main()

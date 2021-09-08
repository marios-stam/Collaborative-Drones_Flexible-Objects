from scipy.spatial import Voronoi, voronoi_plot_2d
import matplotlib.pyplot as plt

obs_setup=[
    (  0, 2,0,66),
    ( -2, 2,0,66),
    (  2, 2,0,66),
    (  2, 0,0,66),
    (  2,-2,0,66),
    (  3,-4,0,66),
    (  4,-3,0,66),
    (  4.1,-3,0,66),
    (  4.3,-3,0,66),
    (  4,-3.1,0,66),
    (  4,-3.2,0,66)
]

lims_positions=[
    (  5, 5,0 ),
    ( -5, 5,0 ),
    (  5,-5,0 ),
    ( -5,-5,0 ),
]



joined = obs_setup+lims_positions
points=[]

for p in joined:
    points.append(p[:2])

vor = Voronoi(points)
fig = voronoi_plot_2d(vor)
plt.show()

import math
import numpy as np
import matplotlib.pyplot as plt
from .dijkstra_search import DijkstraSearch
# from dijkstra_search import DijkstraSearch

from scipy.spatial import cKDTree, Voronoi
#constants
CYLINDER = 3
SPHERE = 2

pi=math.pi
def PointsInCircum(r,n=100):
        return [(math.cos(2*pi/n*x)*r,math.sin(2*pi/n*x)*r) for x in range(0,n+1)]

class VoronoiRoadMapPlanner:
    def __init__(self,show_animation=False):
        self.show_animation = show_animation
        # parameter
        self.N_KNN = 15  # number of edge from one sampled point
        self.MAX_EDGE_LEN = 100.0  # [m] Maximum edge length

        # start and goal position
        self.sx = -3 # [m]
        self.sy = -2  # [m]
        self.gx = 4  # [m]
        self.gy = 3  # [m]
        self.robot_radius = 0.8  # [m]

        #setup world
        obs_setup=[
        (  0, 2,0, CYLINDER ),
        ( -2, 2,0, CYLINDER ),
        (  2, 2,0, CYLINDER ),
        (  2, 0,0, CYLINDER ),
        (  2,-2,0, CYLINDER ),

        # (  3,-4,0, SPHERE ),
        # (  4,-3,0, SPHERE )
        ]

        lims_positions=[
            (  5, 5,0 ),
            ( -5, 5,0 ),
            (  5,-5,0 ),
            ( -5,-5,0 )
        ]
        self.setupLimits()

        self.addObstacles(obs_setup) #uncomment this only while debugging

        if self.show_animation:
            plt.plot(self.ox, self.oy, ".k")
            plt.plot(self.sx, self.sy, "^r")
            plt.plot(self.gx, self.gy, "^c")
            plt.grid(True)
            plt.axis("equal")

    def setupLimits(self):
        self.ox,self.oy = [] ,[]

        limit_len=10
        n_points_limits=20
        for i in range(n_points_limits):
            self.ox.append(i/n_points_limits*limit_len-limit_len/2)
            self.oy.append(limit_len/2)
        for i in range(n_points_limits):
            self.ox.append(limit_len/2)
            self.oy.append(i/n_points_limits*limit_len-limit_len/2)

        for i in range(n_points_limits):
            self.ox.append(-limit_len/2)
            self.oy.append(i/n_points_limits*limit_len-limit_len/2)

        for i in range(n_points_limits):
            self.ox.append(i/n_points_limits*limit_len-limit_len/2)
            self.oy.append(-limit_len/2)
    
    def addObstacles(self,obs): 
        for ob in obs:
            obsType=ob[3]
            xy=ob[:2]
            r=0.5
            # print("obsType:",obsType)
            if obsType == CYLINDER:
                self.addCylinderObs(r,xy)
            elif obsType == SPHERE:
                self.addSphereObs(r,xy)

    def addSphereObs(self,r,pos):
        points=PointsInCircum(r=r,n=20)
        for i in points:
            # print("Adding cylinder at pos (%f,%f) "% ( pos[0],pos[1] ) )
            self.ox.append(i[0]+pos[0])
            self.oy.append(i[1]+pos[1])
    
    def addCylinderObs(self,r,pos):
        points=PointsInCircum(r=r,n=20)
        for i in points:
            # print("Adding sphere at pos (%f,%f) "% ( pos[0],pos[1] ) )
            self.ox.append(i[0]+pos[0])
            self.oy.append(i[1]+pos[1])

    def planning(self):
        sx, sy = self.sx,self.sy
        gx, gy = self.gx,self.gy
        ox, oy = self.ox,self.oy
        robot_radius = self.robot_radius

        obstacle_tree = cKDTree(np.vstack((ox, oy)).T)

        sample_x, sample_y = self.voronoi_sampling(sx, sy, gx, gy, ox, oy)
        if  self.show_animation :  
            plt.plot(sample_x, sample_y, ".b")

        road_map_info = self.generate_road_map_info(
            sample_x, sample_y, robot_radius, obstacle_tree)
        # self.plot_road_map(road_map_info, sample_x, sample_y)
        rx, ry = DijkstraSearch( self.show_animation ).search(sx, sy, gx, gy,
                                                       sample_x, sample_y,
                                                       road_map_info)
        
        assert rx, 'Cannot found path'

        if self.show_animation:  
            plt.plot(rx, ry, "-r")
            plt.pause(0.1)
            plt.show()
        
        return rx, ry

    def is_collision(self, sx, sy, gx, gy, rr, obstacle_kd_tree):
        x = sx
        y = sy
        dx = gx - sx
        dy = gy - sy
        yaw = math.atan2(gy - sy, gx - sx)
        d = math.hypot(dx, dy)

        if d >= self.MAX_EDGE_LEN:
            return True

        D = rr
        n_step = round(d / D)

        for i in range(n_step):
            dist, _ = obstacle_kd_tree.query([x, y])
            if dist <= rr:
                return True  # collision
            x += D * math.cos(yaw)
            y += D * math.sin(yaw)

        # goal point check
        dist, _ = obstacle_kd_tree.query([gx, gy])
        if dist <= rr:
            return True  # collision

        return False  # OK

    def generate_road_map_info(self, node_x, node_y, rr, obstacle_tree):
        """
        Road map generation

        node_x: [m] x positions of sampled points
        node_y: [m] y positions of sampled points
        rr: Robot Radius[m]
        obstacle_tree: KDTree object of obstacles
        """

        road_map = []
        n_sample = len(node_x)
        node_tree = cKDTree(np.vstack((node_x, node_y)).T)

        for (i, ix, iy) in zip(range(n_sample), node_x, node_y):

            dists, indexes = node_tree.query([ix, iy], k=n_sample)

            edge_id = []

            for ii in range(1, len(indexes)):
                nx = node_x[indexes[ii]]
                ny = node_y[indexes[ii]]

                # if(nx==self.gx and ny==self.gy ):
                #     edge_id.append(indexes[ii])
                    
                if not self.is_collision(ix, iy, nx, ny, rr, obstacle_tree):
                    edge_id.append(indexes[ii])

                if len(edge_id) >= self.N_KNN:
                    break

            road_map.append(edge_id)

            #self.plot_road_map(road_map, node_x, node_y)

        return road_map

    @staticmethod
    def plot_road_map(road_map, sample_x, sample_y):  # pragma: no cover

        for i, _ in enumerate(road_map):
            for ii in range(len(road_map[i])):
                ind = road_map[i][ii]

                plt.plot([sample_x[i], sample_x[ind]],
                         [sample_y[i], sample_y[ind]], "-k")

    @staticmethod
    def voronoi_sampling(sx, sy, gx, gy, ox, oy):
        oxy = np.vstack((ox, oy)).T

        # generate voronoi point
        vor = Voronoi(oxy)
        sample_x = [ix for [ix, _] in vor.vertices]
        sample_y = [iy for [_, iy] in vor.vertices]

        sample_x.append(sx)
        sample_y.append(sy)
        sample_x.append(gx)
        sample_y.append(gy)

        return sample_x, sample_y

if __name__=="__main__":
    planner = VoronoiRoadMapPlanner(show_animation=True)
    planner.planning()
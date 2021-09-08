
import math
import numpy as np
import matplotlib.pyplot as plt
from dijkstra_search import DijkstraSearch
from scipy.spatial import cKDTree, Voronoi


class VoronoiRoadMapPlanner:

    def __init__(self,show_animation):
        self.show_animation = show_animation
        # parameter
        self.N_KNN = 15  # number of edge from one sampled point
        self.MAX_EDGE_LEN = 100.0  # [m] Maximum edge length

    def planning(self, sx, sy, gx, gy, ox, oy, robot_radius):
        self.gx,self.gy=gx,gy

        obstacle_tree = cKDTree(np.vstack((ox, oy)).T)

        sample_x, sample_y = self.voronoi_sampling(sx, sy, gx, gy, ox, oy)
        if  self.show_animation :  # pragma: no cover
            plt.plot(sample_x, sample_y, ".b")

        road_map_info = self.generate_road_map_info(
            sample_x, sample_y, robot_radius, obstacle_tree)
        
        print(road_map_info[0])
        print(road_map_info[1])
        print(road_map_info[20])
        
        rx, ry = DijkstraSearch( self.show_animation ).search(sx, sy, gx, gy,
                                                       sample_x, sample_y,
                                                       road_map_info)
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
        print("n_sample",n_sample)
        node_tree = cKDTree(np.vstack((node_x, node_y)).T)

        for (i, ix, iy) in zip(range(n_sample), node_x, node_y):

            dists, indexes = node_tree.query([ix, iy], k=n_sample)

            edge_id = []

            for ii in range(1, len(indexes)):
                nx = node_x[indexes[ii]]
                ny = node_y[indexes[ii]]

                if(nx==self.gx and ny==self.gy ):
                    print(indexes[ii])
                    #input("mlkia")
                    edge_id.append(indexes[ii])
                    

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

import rospy
import math
from visualization_msgs.msg import Marker,MarkerArray
from geometry_msgs.msg import Point
from scipy.spatial import distance
from tf import transformations
from scipy.spatial.transform import Rotation

from Geometry_functions import  intersections3D

class DroneMeasurements:
    def __init__(self,init_pos,obs_dist_publisher : rospy.Publisher) -> None:
        self.DIST_THRESHOLD=0.2#minimum distance in order to update distance travelled
        self.dist_travelled=0

        self.curr_position=init_pos
        self.last_position=init_pos

        self.obs_dist_publisher=obs_dist_publisher

    def update_dist_measurement(self):
        d=distance.euclidean( self.last_position,self.curr_position )

        if d>self.DIST_THRESHOLD:
            self.dist_travelled = self.dist_travelled +d
            self.last_position=self.curr_position
    
    def update_obstacles(self,markArr:MarkerArray):
        markers=markArr.markers
        obs_x,obs_y,obs_z = [] ,[] ,[]
        scale_x , scale_y , scale_z = [] ,[] ,[]
        for m  in markers:
            obs_x.append(m.pose.position.x)
            obs_y.append(m.pose.position.y)
            obs_z.append(m.pose.position.z)
            
            scale_x.append( m.scale.x )
            scale_y.append( m.scale.y )
            scale_z.append( m.scale.z )

        obs_types=[Marker.CYLINDER] * len(obs_x)
        self.obs_setup=zip(obs_x,obs_y,obs_z,obs_types,scale_x , scale_y , scale_z)

        self.get_obs_distances()

    def get_obs_distances(self):
        lines_points=self.get_lines_of_8_directions()
        distances_per_direction=[]

        for l_st,l_end in lines_points:
            dist_min=math.inf
            int_point=None

            for obs in self.obs_setup:
                center , type ,scale_x , scale_z = obs[:3] , obs[3] , obs[4] , obs[6]

                if type== Marker.CYLINDER:
                    radius = scale_x
                    height = scale_z 
                    p1 , p2 = intersections3D.line_cylinder(l_st,l_end,center,radius,height) 
                elif type== Marker.SPHERE:
                    radius = scale_x
                    p1 , p2 = intersections3D.line_sphere(l_st,l_end,center,radius)
                
                distances=[]
                if p1!=None:
                    d=distance.euclidean( self.curr_position ,p1 )
                    distances.append( [d,p1] )
                if p2!=None:
                    d=distance.euclidean( self.curr_position ,p2 )
                    distances.append( [d,p2] )
                
                for d,p in distances:
                    if d<dist_min:
                        dist_min=d
                        int_point=p

                if int_point!=None: #if there is a intersection with an obstacle
                    distances_per_direction.append( [int_point,dist_min] )

        self.int_points_and_distances_per_direction=distances_per_direction

    def visualise_distances(self):

        int_points=[i[0] for i in self.int_points_and_distances_per_direction] 
        markers_array = Obstacle_Distances_Lines(int_points)
        self.obs_dist_publisher.publish( markers_array )

    def get_lines_of_8_directions(self):
        yaw=self.orientation[2]
        origin=self.curr_position
        number_of_distances=8
        angle_step=2*math.pi/number_of_distances
        
        lines_points=[]
        for i in range(number_of_distances):
            angle = i * angle_step
            
            x_dir = math.cos(angle)
            y_dir = math.sin(angle)

            dir_vector=[x_dir,y_dir,0]
            distance=10
            dir_vector=[i*distance for i in dir_vector]#scale the vector
            
            #apply it to 3D space
            #r=Rotation.from_quat(self.orientation_quat)
            #r.apply(dir_vector)
            
            l_end=[ origin[0]+dir_vector[0] , origin[1]+dir_vector[1] , origin[2] ]
            
            lines_points.append( [ origin , l_end ] )
        
        return lines_points

    def update__drone_pose(self,drone_mark:Marker):
        self.curr_position = (drone_mark.pose.position.x, drone_mark.pose.position.y ,drone_mark.pose.position.z)
        self.orientation_quat = drone_mark.pose.orientation
        
        rpy = transformations.euler_from_quaternion(self.orientation_quat)
        self.orientation=rpy

        self.update_dist_measurement()
        self.get_obs_distances()

class Obstacle_Distance_Line(Marker):
    def __init__(self,p1,p2):
        super().__init__()
        self.header.frame_id = "/world"
        self.type = Marker.LINE_STRIP
        self.action = Marker.ADD

        # marker scale
        scale=0.03
        self.scale.x = scale
        self.scale.y = scale
        self.scale.z = scale

        # marker color
        self.color.a = 1.0
        self.color.r = 1.0
        self.color.g = 1.0
        self.color.b = 0.0

        # marker orientaiton
        self.pose.orientation.x = 0.0
        self.pose.orientation.y = 0.0
        self.pose.orientation.z = 0.0
        self.pose.orientation.w = 1.0

        # marker position
        self.pose.position.x = 0.0
        self.pose.position.y = 0.0
        self.pose.position.z = 0.0

        # marker line points
        self.points = []
        # first point
        first_line_point = Point()
        first_line_point.x = p1[0]
        first_line_point.y = p1[1]
        first_line_point.z = p1[2]
        self.points.append(first_line_point)
        # second point
        second_line_point = Point()
        second_line_point.x = p2[0]
        second_line_point.y = p2[1]
        second_line_point.z = p2[2]
        self.points.append(second_line_point)

class Obstacle_Distances_Lines(MarkerArray):
    def __init__(self,origin_point,intersection_points):
        super().__init__()
        self.markers=[]

        for p in intersection_points:
            line_dist_marker = Obstacle_Distance_Line(origin_point,p)
            self.markers.append( line_dist_marker ) 
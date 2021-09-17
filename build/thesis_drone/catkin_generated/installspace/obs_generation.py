#!/usr/bin/env python3
# license removed for brevity
import rospy
from thesis_drone.msg import drone_pose 
from tf import transformations

from visualization_msgs.msg import Marker,MarkerArray
from geometry_msgs.msg import PoseStamped

from math import pi,sqrt
from scipy.spatial import distance

GRID_OFFSET=2

obs_setup=[
    (  0, 2,0,Marker.CYLINDER ),
    ( -2, 2,0,Marker.CYLINDER ),
    (  2, 2,0,Marker.CYLINDER ),
    (  2, 0,0,Marker.CYLINDER ),
    (  2,-2,0,Marker.CYLINDER ),
    (  -2,-2,0,Marker.CYLINDER ),

    (  3,-4,0,Marker.SPHERE ),
    (  4,-3,0,Marker.SPHERE ),
]

lims_positions=[
    (  5, 5,0 ),
    ( -5, 5,0 ),
    (  5,-5,0 ),
    ( -5,-5,0 ),
]


class obsMarkersArray(MarkerArray):
    def __init__(self,obs_setup):
        super().__init__()
        self.markers=[]
        
        for i,obs in enumerate(obs_setup):
            name="obs_"+str(i)
            pos=obs[:3]
            type=obs[3]

            select_type={
                Marker.CYLINDER:CylinderObs,
                Marker.SPHERE:SphereObs
            }
            # m=ObstacleMarker(name,pos)
            m=select_type[type](name,pos)
            self.markers.append(m)

class LimsMarkersArray(MarkerArray):
    def __init__(self,obs_positions):
        super().__init__()
        self.markers=[]
        
        for i,pos in enumerate(obs_positions):
            name="lim_"+str(i)
            m=LimMarker(name,pos)

            self.markers.append(m)

class ObstacleMarker(Marker):
    def __init__(self,name,pos=[0,0,0],scale=(1,1,5),rpy=[0,0,0]):
        super().__init__()
        self.header.frame_id = "world"
        self.header.stamp    = rospy.get_rostime()
        self.ns = name
        self.id = 0
        self.action = 0

        self.updatePose(pos,rpy)

        self.scale.x = scale[0]
        self.scale.y = scale[1]
        self.scale.z = scale[2]

        self.color.r = 1.0
        self.color.g = 0.0
        self.color.b = 0.0
        self.color.a = 1.0
        
        self.lifetime = rospy.Duration(0)

    def updatePose(self,pos,rpy):
        self.pose.position.x=pos[0]
        self.pose.position.y=pos[1]
        self.pose.position.z=pos[2]

        quatern=transformations.quaternion_from_euler(rpy[0], -rpy[1], rpy[2])
        # quatern=transformations.quaternion_from_euler(pi/2 ,0, rpy[2])
        self.pose.orientation.x = quatern[0]
        self.pose.orientation.y = quatern[1]
        self.pose.orientation.z = quatern[2]
        self.pose.orientation.w = quatern[3]

class LimMarker(ObstacleMarker):
     def __init__(self, name, pos, scale=(1/5,1/5,5),rpy=[0,0,0]):
        super().__init__(name, pos=pos, scale=scale, rpy=rpy)
        self.type = Marker.CYLINDER
        self.height=5
        pos=(pos[0],pos[1],GRID_OFFSET-self.height/2)
        self.color.r = 1.0
        self.color.g = 0.0
        self.color.b = 1.0
        self.color.a = 1.0
        self.updatePose(pos,rpy)
class CylinderObs(ObstacleMarker):
    def __init__(self, name, pos, scale=(1,1,5),rpy=[0,0,0]):
        super().__init__(name, pos=pos, scale=scale, rpy=rpy)
        self.type = Marker.CYLINDER
        self.height=5
        pos=(pos[0],pos[1],GRID_OFFSET-self.height/2)
        self.updatePose(pos,rpy)

    def collides_with_point(self,point:list,safe_distance=0) -> bool:
        cyl_r=self.scale.x+safe_distance
        cyl_height=self.height+safe_distance
        cyl_centerXY=(self.pose.position.x,self.pose.position.y)
        cyl_centerZ=self.pose.position.z
        
        pXY=point[:2]
        pZ=point[2]

        d = distance.euclidean(pXY,cyl_centerXY )
        height_check = pZ<= cyl_centerZ-cyl_height/2 and pZ>= cyl_centerZ+cyl_height/2

        return ( d<cyl_r and height_check )

class SphereObs(ObstacleMarker):
    def __init__(self, name, pos, scale=(1,1,1),rpy=[0,0,0]):
        super().__init__(name, pos=pos, scale=scale, rpy=rpy)
        self.type = Marker.SPHERE
        self.radius=scale[2]
        pos=(pos[0],pos[1],GRID_OFFSET-self.radius)
        self.updatePose(pos,rpy)
    
    def collides_with_point(self,point:list,safe_distance=0) -> bool:
        center=(self.pose.position.x,self.pose.position.y,self.pose.position.z)
        d = distance.euclidean(point,center )

        return d < ( self.radius + safe_distance )

def addBox():
    scene = PlanningSceneInterface()
    robot = RobotCommander()

    rospy.sleep(2)

    p = PoseStamped()
    p.header.frame_id = robot.get_planning_frame()
    p.pose.position.x = 0.
    p.pose.position.y = 0.
    p.pose.position.z = 0.
    scene.add_box("table", p, (0.5, 1.5, 0.6))

def main():
    obsMarkPub =  rospy.Publisher('obsMarkers_array',  MarkerArray, queue_size=10)
    limsMarkPub = rospy.Publisher('limsMarkers_array', MarkerArray, queue_size=10)
    
    rospy.init_node('obs_generator')
    rate = rospy.Rate(5)  # hz
    
    obstacles=obsMarkersArray(obs_setup)
    limits=LimsMarkersArray(lims_positions)

    
    while not rospy.is_shutdown():
        obsMarkPub.publish(obstacles)
        limsMarkPub.publish(limits)    
        rate.sleep()

if __name__ == '__main__':
    main()

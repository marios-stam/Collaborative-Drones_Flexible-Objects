#!/usr/bin/env python
# license removed for brevity
import rospy
from thesis_drone.msg import drone_pose 
from tf import transformations

from visualization_msgs.msg import Marker,MarkerArray
from geometry_msgs.msg import PoseStamped

from math import pi



obs_positions=[
    ( 0,1,0 ),
    ( 1,0,0 ),
    ( 1,1,0 ),
    ( 0,-1,0 ),
    ( -1,0,0 ),
    ( -1,-1,0 )
    
]

class obsMarkersArray(MarkerArray):
    def __init__(self,obs_positions):
        super().__init__()
        self.markers=[]
        
        for i,pos in enumerate(obs_positions):
            name="obs_"+str(i)
            m=ObstacleMarker(name,pos)

            self.markers.append(m)


class ObstacleMarker(Marker):
    def __init__(self,name,pos=[0,0,0],scale=(1/5,1/5,5),rpy=[0,0,0]):
        super().__init__()
        self.header.frame_id = "world"
        self.header.stamp    = rospy.get_rostime()
        self.ns = name
        self.id = 0
        self.type = Marker.CYLINDER
        self.action = 0

        height=5
        pos[2]
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
    obsMarkPub = rospy.Publisher('obsMarkers_array', MarkerArray, queue_size=10)

    rospy.init_node('obs_generator')
    rate = rospy.Rate(20)  # 20hz
    
    obstacles=obsMarkersArray(obs_positions)
    
    while not rospy.is_shutdown():
        obsMarkPub.publish(obstacles)
        rate.sleep()

if __name__ == '__main__':
    main()

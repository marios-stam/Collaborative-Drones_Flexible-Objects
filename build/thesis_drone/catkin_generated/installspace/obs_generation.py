#!/usr/bin/env python3
# license removed for brevity
import rospy
from thesis_drone.msg import drone_pose 
from Drone_Pose_Estimation import pose_extractor
from tf import TransformBroadcaster,transformations

from visualization_msgs.msg import Marker,MarkerArray
from geometry_msgs.msg import PoseStamped

import moveit_commander
from math import pi

class ObstacleMarker(Marker):
    def __init__(self,pos=[0,0,0],rpy=[0,0,0]):
        super().__init__()
        self.header.frame_id = "world"
        self.header.stamp    = rospy.get_rostime()
        self.ns = "obsatcle"
        self.id = 0
        self.type = Marker.CYLINDER
        self.action = 0

        height=5
        pos=(0.5,-0.5,2-height/2)
        self.updatePose(pos,rpy)

        
        self.scale.x = 1/6
        self.scale.y = 1/6
        self.scale.z = height

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
def main():
    obsMarkPub   = rospy.Publisher('obsMarker', Marker, queue_size=10)

    rospy.init_node('obs_generator')
    rate = rospy.Rate(20)  # 20hz

    translation = (0.0, 0.0, 0.0)
    rotation = (0.0, 0.0, 0.0, 1.0)
    
    obsMarker=ObstacleMarker()
    

    while not rospy.is_shutdown():
        obsMarkPub.publish(obsMarker)
        rate.sleep()

if __name__ == '__main__':
    main()

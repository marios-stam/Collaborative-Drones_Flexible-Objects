#!/usr/bin/env python
# license removed for brevity
import rospy
from thesis_drone.msg import drone_pose
from djitellopy import Tello
from tf import TransformBroadcaster,transformations
from rospy import Time 
import numpy as np

tello = Tello()

tello.connect()



def main():
    rospy.init_node('tello')
    
    b = TransformBroadcaster()
    
    translation = (0.0, 0.0, 0.0)
    rotation = (0.0, 0.0, 0.0, 1.0)
    rate = rospy.Rate(15)  # 5hz
    
    x, y = 0.0, 0.0
    
    while not rospy.is_shutdown():
        # z = tello.get_height()
        # rpy = tello.get_roll(),tello.get_pitch(),tello.get_yaw()

        # rpy = np.deg2rad(rpy) # transform to rads
        # rotation_quat = transformations.quaternion_from_euler(rpy)

        # translation = (x, y, z)
        # rotation = rotation_quat
        b.sendTransform(translation, rotation, Time.now(), 'tello', '/world')
        rate.sleep()
    


if __name__ == '__main__':
    main()
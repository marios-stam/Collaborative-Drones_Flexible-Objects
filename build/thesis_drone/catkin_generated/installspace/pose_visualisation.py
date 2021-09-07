#!/usr/bin/env python3
import rospy
from thesis_drone.msg import drone_pose

def callback(data):
    rospy.loginfo("mlkia x: %d" % (data.x) )

def listener():
    topic_name='pose'
    node_name='pose_visualizer'
    rospy.init_node(node_name, anonymous=True)
    rospy.Subscriber(topic_name, drone_pose, callback)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
  
if __name__ == '__main__':
    listener()
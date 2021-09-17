#!/usr/bin/env python
# license removed for brevity
import math
import rospy
from rospy import topics
from thesis_drone.msg import drone_pose 
from visualization_msgs.msg import Marker,MarkerArray
from scipy.spatial import distance
from tf import transformations
from scipy.spatial.transform import Rotation


from classes import DroneMeasurements
initial_position=[0.2,-0.1,0]

obs_distMarkPub =  rospy.Publisher('obs_distances_array',  MarkerArray, queue_size=10)
measurements=DroneMeasurements(initial_position,obs_distMarkPub)

def listener():
    node_name='measurements'
    rospy.init_node(node_name, anonymous=False)

    topic_name='robotMarker'
    rospy.Subscriber(topic_name, Marker, measurements.update__drone_pose)

    topic_name='obsMarkers_array'
    rospy.Subscriber(topic_name, MarkerArray, measurements.update_obstacles)

    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

  
if __name__ == '__main__':
    listener()
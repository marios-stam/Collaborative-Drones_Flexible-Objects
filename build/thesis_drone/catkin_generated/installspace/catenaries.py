#!/usr/bin/env python3
# license removed for brevity
import math
import rospy
from rospy import topics
from thesis_drone.msg import drone_pose
from visualization_msgs.msg import Marker, MarkerArray
from scipy.spatial import distance
from tf import transformations
from scipy.spatial.transform import Rotation

from classes import Catenaries

catenary_mark_array_pub = rospy.Publisher(
    'catenary',  MarkerArray, queue_size=10)


start_end_points_and_lenghts = [
    [[1, 1, 0], [2, 2, 1], 3]
]
cat_handler = Catenaries.Catenaries_Handler(start_end_points_and_lenghts)
cat_handler.visusalise()


def listener():
    node_name = 'catenaries'
    rospy.init_node(node_name, anonymous=False)

    # topic_name = 'catenary_end'
    # rospy.Subscriber(topic_name, Marker, )

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    listener()
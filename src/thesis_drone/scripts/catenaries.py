#!/usr/bin/env python
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
    'catenaries_array',  MarkerArray, queue_size=10)


start_end_points_and_lenghts = [
    [[1, 1, 0], [2, 2, 1], 3]
]

cat_handler = Catenaries.Catenaries_Handler(catenary_mark_array_pub)


def listener():
    node_name = 'catenaries'
    rospy.init_node(node_name, anonymous=False)
    cat_handler.update(start_end_points_and_lenghts)
    cat_handler.visusalise()
    print("Opa mlka")
    # topic_name = 'catenary_end'
    # rospy.Subscriber(topic_name, Marker, )

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


def main():
    node_name = 'catenaries'
    rospy.init_node(node_name, anonymous=False)
    rate = rospy.Rate(50)  # hz

    while not rospy.is_shutdown():
        cat_handler.update(start_end_points_and_lenghts)
        cat_handler.visusalise()
        rate.sleep()


if __name__ == '__main__':
    # listener()
    main()

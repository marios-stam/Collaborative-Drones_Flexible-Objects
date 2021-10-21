#!/usr/bin/env python
# license removed for brevity
import math
import rospy
from rospy import topics
from catenary.msg import drone_pose
from visualization_msgs.msg import Marker, MarkerArray, InteractiveMarkerFeedback
from scipy.spatial import distance
from tf import transformations
from scipy.spatial.transform import Rotation

from classes import Catenaries

catenary_mark_array_pub = rospy.Publisher(
    'catenaries_array',  MarkerArray, queue_size=10)

start_point = [0, 0, 0]
end_point = [2, 0, 0]
length = 3

start_end_points_and_lenghts = [
    [start_point, end_point, length]
]


def main():
    node_name = 'catenaries'
    rospy.init_node(node_name, anonymous=False)

    cat_handler = Catenaries.Catenaries_Handler(
        catenary_mark_array_pub, start_end_points_and_lenghts)

    rate = rospy.Rate(4)  # hz
    t_begin = rospy.Time.now()

    while not rospy.is_shutdown():
        t = rospy.Time.now()-t_begin
        t = t.to_sec()

        f = 0.05
        radius = 2
        height = .5
        x_end = 1-radius * math.cos(2*math.pi*f*t)
        # y_end = radius * math.sin(2*math.pi*f*t)
        y_end = 0
        z_end = 0 * math.sin(2*math.pi*f*t)

        end_point = [x_end, y_end, z_end]
        start_end_points_and_lenghts[0][1] = end_point
        cat_handler.update(0, start_end_points_and_lenghts)
        cat_handler.visusalise()
        rate.sleep()


def listener():
    node_name = 'catenaries'
    rospy.init_node(node_name, anonymous=False)

    cat_handler = Catenaries.Catenaries_Handler(
        catenary_mark_array_pub, start_end_points_and_lenghts)

    topic_name = '/inter_marker/feedback'
    rospy.Subscriber(topic_name, InteractiveMarkerFeedback,
                     cat_handler.handleNewInterMarker)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()


if __name__ == '__main__':
    listener()
    # main()

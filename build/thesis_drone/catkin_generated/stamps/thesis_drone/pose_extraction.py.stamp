#!/usr/bin/env python
# license removed for brevity
import rospy
from thesis_drone.msg import drone_pose 
from Drone_Pose_Estimation import pose_extractor

def talker():
    topic_name='pose'
    node_name='pose_extraction'
    pub = rospy.Publisher(topic_name, drone_pose, queue_size=10)
    rospy.init_node(node_name, anonymous=True)
    rate = rospy.Rate(20) # 10hz
    
    msg=drone_pose()
    msg.x=66.6

    pose_estimator=pose_extractor(USB_cam=0)
    while not rospy.is_shutdown():
        tvec,rpy=pose_estimator.getPose()
        rospy.loginfo(tvec)
        pub.publish(msg)
        rate.sleep()

if __name__ == '__main__':
    try:
        talker()

    except rospy.ROSInterruptException:
        pass
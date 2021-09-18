#!/usr/bin/env python
from logging import FATAL
import rospy
from thesis_drone.msg import drone_pose
from visualization_msgs.msg import Marker,MarkerArray
from nav_msgs.msg import Path
from geometry_msgs.msg import PoseStamped

from path_planning import VoronoiRoadMapPlanner
import tf

planner = VoronoiRoadMapPlanner(show_animation=True)
path_publisher = rospy.Publisher('/path', Path, queue_size=10)

def callbackLims(markArr:MarkerArray):
    markers=markArr.markers
    lims_x,lims_y = [] ,[]

    for m  in markers:
        lims_x.append(m.pose.position.x)
        lims_y.append(m.pose.position.y)
    
    lims_x=sorted(lims_x)
    lims_y=sorted(lims_y)
    lims_z=[0]*len(lims_x)
    
    lims_coords=zip(lims_x,lims_y,lims_z)

def callbackObs(markArr):
    markers=markArr.markers
    obs_x,obs_y,obs_z = [] ,[] ,[]

    for m  in markers:
        obs_x.append(m.pose.position.x)
        obs_y.append(m.pose.position.y)
        obs_z.append(m.pose.position.z)

    obs_types=[Marker.CYLINDER] * len(obs_x)
    obs_setup=zip(obs_x,obs_y,obs_z,obs_types)
    

    if not callbackObs.executed_once:
        planner.addObstacles(obs_setup)

        rx, ry = planner.planning()
        rz=[0] * len(rx)
        
        path=zip(rx,ry,rz)
        publish_plan(path)

        callbackObs.executed_once=True
    
callbackObs.executed_once=False    

def publish_plan(path):
    """
    publish the global plan
    """
    msg = Path()
    msg.header.frame_id = "/world"
    msg.header.stamp = rospy.Time.now()
    for xyz in path:
        pose = PoseStamped()
        pose.pose.position.x = xyz[0]
        pose.pose.position.y = xyz[1]
        pose.pose.position.z = xyz[2]
        quaternion = tf.transformations.quaternion_from_euler(0, 0, 0)
        pose.pose.orientation.x = quaternion[0]
        pose.pose.orientation.y = quaternion[1]
        pose.pose.orientation.z = quaternion[2]
        pose.pose.orientation.w = quaternion[3]
        msg.poses.append(pose)

    rospy.loginfo("Publishing Plan... %d points"%(len(msg.poses)))
    path_publisher.publish(msg) 

def listener():
    node_name='path_planner'
    rospy.init_node(node_name, anonymous=False)
    
    topic_name='obsMarkers_array'
    rospy.Subscriber(topic_name, MarkerArray, callbackObs)

    topic_name='limsMarkers_array'
    rospy.Subscriber(topic_name, MarkerArray, callbackLims)
    
    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

  
if __name__ == '__main__':
    listener()
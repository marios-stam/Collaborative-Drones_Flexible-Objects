#!/usr/bin/env python3
from numpy.lib.npyio import zipfile_factory
import rospy
from thesis_drone.msg import drone_pose
from visualization_msgs.msg import Marker,MarkerArray
from path_planning import VoronoiRoadMapPlanner


planner = VoronoiRoadMapPlanner()


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
    print(obs_setup)

    planner.planning()

def listener():
    node_name='pose_visualizer'
    rospy.init_node(node_name, anonymous=True)
    
    topic_name='obsMarkers_array'
    rospy.Subscriber(topic_name, MarkerArray, callbackLims)

    topic_name='limsMarkers_array'
    rospy.Subscriber(topic_name, MarkerArray, callbackObs)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()
  
if __name__ == '__main__':
    listener()
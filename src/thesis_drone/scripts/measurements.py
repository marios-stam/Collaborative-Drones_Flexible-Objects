#!/usr/bin/env python
# license removed for brevity
import rospy
from rospy import topics
from thesis_drone.msg import drone_pose 
from visualization_msgs.msg import Marker,MarkerArray
from scipy.spatial import distance



class DroneMeasurements:
    def __init__(self,init_pos) -> None:
        self.dist_travelled=0
        self.last_pos=init_pos

    def update_dist_measurement(self,drone_mark:Marker):
        DIST_THRESHOLD=0.2#minimum distance in order to update distance travelled
        
        pos=(drone_mark.pose.position.x, drone_mark.pose.position.y ,drone_mark.pose.position.z)
        d=distance.euclidean( self.last_pos,pos )
        
        if d>DIST_THRESHOLD:
            self.dist_travelled = self.dist_travelled +d
            self.last_pos=pos

def listener():
    node_name='measurements'
    rospy.init_node(node_name, anonymous=False)

    topic_name='robotMarker'
    rospy.Subscriber(topic_name, MarkerArray, update_dist_measurement)

    # spin() simply keeps python from exiting until this node is stopped
    rospy.spin()

  
if __name__ == '__main__':
    listener()
from array import array
import rospy
import math
import time
from visualization_msgs.msg import Marker, MarkerArray, InteractiveMarkerFeedback
from geometry_msgs.msg import Point
from scipy.spatial import distance
from tf import transformations
from scipy.spatial.transform import Rotation
from catenary import catenaries


class Catenaries_Handler(Marker):
    def __init__(self,  publisher: rospy.Publisher, start_end_points_and_lenghts=None) -> None:
        self.publisher = publisher
        if start_end_points_and_lenghts != None:
            self.catenaries_array = Catenary_Marker_Array(
                start_end_points_and_lenghts)

    def update(self, index, start_end_points_and_lenghts):
        p1, p2, L = start_end_points_and_lenghts[index]
        self.catenaries_array.update_curve(index, p1, p2, L)

    def getDataofCatenary(self, index):
        start_point = self.catenaries_array.markers[index].start_point
        end_point = self.catenaries_array.markers[index].end_point
        length = self.catenaries_array.markers[index].L

        return start_point, end_point, length

    def handleNewInterMarker(self, inter_mark: InteractiveMarkerFeedback):
        start = time.time()
        pose_updated = inter_mark.event_type == inter_mark.POSE_UPDATE
        if pose_updated:
            pos = inter_mark.pose.position

            start_point, _, L = self.getDataofCatenary(0)

            p1 = start_point
            p2 = [pos.x, pos.y, pos.z]
            self.catenaries_array.update_curve(
                index=0, p1=p1, p2=p2, L=L)

            self.visusalise()
        dt = time.time()-start
        print("dt:", dt*1000, "msec")

    def visusalise(self):
        self.publisher.publish(self.catenaries_array)
        # print(self.catenaries_array.markers)


class Catenary_Marker(Marker):
    def __init__(self, p1: array, p2: array, L: float, name: str):
        """
        p1: start 3D point3D of catenary
        p2:   end 3D point3D of catenary
        L: Length of catenary
        """
        super().__init__()
        self.header.frame_id = "world"
        self.type = Marker.LINE_STRIP
        self.action = Marker.ADD

        self.header.stamp = rospy.get_rostime()
        self.ns = name
        self.id = 0

        self.lifetime = rospy.Duration(secs=1, nsecs=0)
        # marker scale
        scale = 0.05
        self.scale.x = scale
        self.scale.y = scale
        self.scale.z = scale

        # marker color
        self.color.a = 1.0
        self.color.r = 1.0
        self.color.g = 1.0
        self.color.b = 0.0

        # marker orientaiton
        self.pose.orientation.x = 0.0
        self.pose.orientation.y = 0.0
        self.pose.orientation.z = 0.0
        self.pose.orientation.w = 1.0

        # marker position
        self.pose.position.x = 0.0
        self.pose.position.y = 0.0
        self.pose.position.z = 0.0

        # marker line points
        points = catenaries.getCatenaryCurve3D(p1, p2, L)
        points = map(lambda p: Point(p[0], p[1], p[2]), points)
        self.points = list(points)

        # custom parameters
        self.start_point = p1
        self.end_point = p2
        self.L = L


class Catenary_Marker_Array(MarkerArray):
    def __init__(self, start_end_points_and_lenghts):
        """
            start_end_points:3D array where each index holds the start and end point for each catenary and length
        """
        super().__init__()
        self.markers = []

        for i, triple in enumerate(start_end_points_and_lenghts):
            p1, p2, L = triple
            name = "caten_" + str(i)
            caten_marker = Catenary_Marker(p1, p2, L, name)
            self.markers.append(caten_marker)

    def add_curve(self, p1, p2, L):
        caten_marker = Catenary_Marker(p1, p2, L)
        self.markers.append(caten_marker)

    def update_curve(self, index, p1, p2, L):
        points = catenaries.getCatenaryCurve3D(p1, p2, L)
        points = map(lambda p: Point(p[0], p[1], p[2]), points)
        self.markers[index].points = list(points)

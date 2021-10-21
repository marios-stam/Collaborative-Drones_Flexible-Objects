#!/usr/bin/env python3

import rospy
import copy

from interactive_markers.interactive_marker_server import *
from interactive_markers.menu_handler import *
from visualization_msgs.msg import *
from geometry_msgs.msg import Point
from tf.broadcaster import TransformBroadcaster

from random import random
from math import sin

server = None
menu_handler = MenuHandler()
br = None
counter = 0


def frameCallback(msg):
    global counter, br
    time = rospy.Time.now()
    br.sendTransform((0, 0, sin(counter/140.0)*2.0),
                     (0, 0, 0, 1.0), time, "world", "moving_frame")
    counter += 1


def processFeedback(feedback):
    s = "Feedback from marker '" + feedback.marker_name
    s += "' / control '" + feedback.control_name + "'"

    mp = ""
    if feedback.mouse_point_valid:
        mp = " at " + str(feedback.mouse_point.x)
        mp += ", " + str(feedback.mouse_point.y)
        mp += ", " + str(feedback.mouse_point.z)
        mp += " in frame " + feedback.header.frame_id

    if feedback.event_type == InteractiveMarkerFeedback.BUTTON_CLICK:
        pass
        # rospy.loginfo(s + ": button click" + mp + ".")
    elif feedback.event_type == InteractiveMarkerFeedback.MENU_SELECT:
        pass
        # rospy.loginfo(s + ": menu item " +
        # str(feedback.menu_entry_id) + " clicked" + mp + ".")
    elif feedback.event_type == InteractiveMarkerFeedback.POSE_UPDATE:
        rospy.loginfo("pose changed:")
        pos = feedback.pose.position
        print(pos.x, pos.y, pos.z)
    elif feedback.event_type == InteractiveMarkerFeedback.MOUSE_DOWN:
        pass
        # rospy.loginfo(s + ": mouse down" + mp + ".")
    elif feedback.event_type == InteractiveMarkerFeedback.MOUSE_UP:
        pass
        # rospy.loginfo(s + ": mouse up" + mp + ".")
    server.applyChanges()


def alignMarker(feedback):
    pose = feedback.pose

    # pose.position.x = round(pose.position.x-0.5)+0.5
    # pose.position.y = round(pose.position.y-0.5)+0.5

    rospy.loginfo(str(pose.position.x) + "," +
                  str(pose.position.y) + "," + str(pose.position.z))

    server.setPose(feedback.marker_name, pose)
    server.applyChanges()


def rand(min_, max_):
    return min_ + random()*(max_-min_)


def makeBox(msg):
    marker = Marker()

    marker.type = Marker.CUBE
    marker.scale.x = msg.scale * 0.45
    marker.scale.y = msg.scale * 0.45
    marker.scale.z = msg.scale * 0.45
    marker.color.r = 0.5
    marker.color.g = 0.5
    marker.color.b = 0.5
    marker.color.a = 1.0

    return marker


def makeSphere(msg):
    marker = Marker()
    scale_factor = 0.43
    marker.type = Marker.SPHERE
    marker.scale.x = msg.scale * scale_factor
    marker.scale.y = msg.scale * scale_factor
    marker.scale.z = msg.scale * scale_factor
    marker.color.r = 0.5
    marker.color.g = 0.5
    marker.color.b = 0.5
    marker.color.a = 1.0

    return marker


def makeBoxControl(msg):
    control = InteractiveMarkerControl()
    control.always_visible = True
    control.markers.append(makeBox(msg))
    msg.controls.append(control)
    return control


def saveMarker(int_marker):
    server.insert(int_marker, processFeedback)


#####################################################################
# Marker Creation


def makeChessPieceMarker(position):
    int_marker = InteractiveMarker()
    int_marker.header.frame_id = "world"
    int_marker.pose.position = position
    int_marker.scale = 1

    int_marker.name = "chess_piece"
    int_marker.description = "Chess Piece\n(2D Move + Alignment)"

    # control = InteractiveMarkerControl()
    # control.orientation.w = 1
    # control.orientation.x = 0
    # control.orientation.y = 1
    # control.orientation.z = 0
    # control.interaction_mode = InteractiveMarkerControl.MOVE_PLANE
    # int_marker.controls.append(copy.deepcopy(control))

    # we want to use our special callback function
    # server.insert(int_marker, processFeedback)

    # set different callback for POSE_UPDATE feedback
    server.setCallback(int_marker.name, alignMarker,
                       InteractiveMarkerFeedback.POSE_UPDATE)

    # int_marker = InteractiveMarker()
    # int_marker.header.frame_id = "moving_frame"
    # int_marker.pose.position = position
    # int_marker.scale = 1
    # int_marker.name = "moving"
    # int_marker.description = "Marker Attached to a\nMoving Frame"

    control = InteractiveMarkerControl()
    control.orientation.w = 1
    control.orientation.x = 1
    control.orientation.y = 0
    control.orientation.z = 0
    control.name = "move_x"
    control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
    control.orientation_mode = InteractiveMarkerControl.FIXED
    int_marker.controls.append(control)

    control = InteractiveMarkerControl()
    control.orientation.w = 1
    control.orientation.x = 0
    control.orientation.y = 1
    control.orientation.z = 0
    control.name = "move_z"
    control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
    control.orientation_mode = InteractiveMarkerControl.FIXED
    int_marker.controls.append(control)

    control = InteractiveMarkerControl()
    control.orientation.w = 1
    control.orientation.x = 0
    control.orientation.y = 0
    control.orientation.z = 1
    control.name = "move_y"
    control.interaction_mode = InteractiveMarkerControl.MOVE_AXIS
    control.orientation_mode = InteractiveMarkerControl.FIXED
    int_marker.controls.append(control)

    # make a box which also moves in the plane
    control = InteractiveMarkerControl()
    control.orientation.w = 0
    control.orientation.x = 0
    control.orientation.y = 1
    control.orientation.z = 0
    control.interaction_mode = InteractiveMarkerControl.MOVE_PLANE
    int_marker.controls.append(copy.deepcopy(control))
    control.markers.append(makeSphere(int_marker))
    control.always_visible = True
    int_marker.controls.append(control)

    server.insert(int_marker, processFeedback)


if __name__ == "__main__":
    rospy.init_node("basic_controls")
    br = TransformBroadcaster()

    # create a timer to update the published transforms
    # rospy.Timer(rospy.Duration(0.01), frameCallback)

    server = InteractiveMarkerServer("inter_marker")

    # menu_handler.insert("First Entry", callback=processFeedback)
    # menu_handler.insert("Second Entry", callback=processFeedback)
    # sub_menu_handle = menu_handler.insert("Submenu")
    # menu_handler.insert("First Entry", parent=sub_menu_handle,
    #                     callback=processFeedback)
    # menu_handler.insert(
    #     "Second Entry", parent=sub_menu_handle, callback=processFeedback)

    # position = Point(-3, 3, 0)
    # make6DofMarker(False, InteractiveMarkerControl.NONE, position, True)
    # position = Point(0, 3, 0)
    # make6DofMarker(True, InteractiveMarkerControl.NONE, position, True)
    # position = Point(3, 3, 0)
    # makeRandomDofMarker(position)
    # position = Point(-3, 0, 0)
    # make6DofMarker(False, InteractiveMarkerControl.ROTATE_3D, position, False)
    # position = Point(0, 0, 0)
    # make6DofMarker(
    #     False, InteractiveMarkerControl.MOVE_ROTATE_3D, position, True)
    # position = Point(3, 0, 0)
    # make6DofMarker(False, InteractiveMarkerControl.MOVE_3D, position, False)
    # position = Point(-3, -3, 0)
    # makeViewFacingMarker(position)
    # position = Point(0, -3, 0)
    # makeQuadrocopterMarker(position)
    position = Point(3, -3, 0)
    makeChessPieceMarker(position)
    # position = Point(-3, -6, 0)
    # makePanTiltMarker(position)
    # position = Point(0, -6, 0)
    # makeMovingMarker(position)
    # position = Point(3, -6, 0)
    # makeMenuMarker(position)

    server.applyChanges()

    rospy.spin()

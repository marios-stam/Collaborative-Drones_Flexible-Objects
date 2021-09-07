;; Auto-generated. Do not edit!


(when (boundp 'xpp_msgs::RobotStateCartesianTrajectory)
  (if (not (find-package "XPP_MSGS"))
    (make-package "XPP_MSGS"))
  (shadow 'RobotStateCartesianTrajectory (find-package "XPP_MSGS")))
(unless (find-package "XPP_MSGS::ROBOTSTATECARTESIANTRAJECTORY")
  (make-package "XPP_MSGS::ROBOTSTATECARTESIANTRAJECTORY"))

(in-package "ROS")
;;//! \htmlinclude RobotStateCartesianTrajectory.msg.html
(if (not (find-package "STD_MSGS"))
  (ros::roseus-add-msgs "std_msgs"))


(defclass xpp_msgs::RobotStateCartesianTrajectory
  :super ros::object
  :slots (_header _points ))

(defmethod xpp_msgs::RobotStateCartesianTrajectory
  (:init
   (&key
    ((:header __header) (instance std_msgs::Header :init))
    ((:points __points) ())
    )
   (send-super :init)
   (setq _header __header)
   (setq _points __points)
   self)
  (:header
   (&rest __header)
   (if (keywordp (car __header))
       (send* _header __header)
     (progn
       (if __header (setq _header (car __header)))
       _header)))
  (:points
   (&rest __points)
   (if (keywordp (car __points))
       (send* _points __points)
     (progn
       (if __points (setq _points (car __points)))
       _points)))
  (:serialization-length
   ()
   (+
    ;; std_msgs/Header _header
    (send _header :serialization-length)
    ;; xpp_msgs/RobotStateCartesian[] _points
    (apply #'+ (send-all _points :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; std_msgs/Header _header
       (send _header :serialize s)
     ;; xpp_msgs/RobotStateCartesian[] _points
     (write-long (length _points) s)
     (dolist (elem _points)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; std_msgs/Header _header
     (send _header :deserialize buf ptr-) (incf ptr- (send _header :serialization-length))
   ;; xpp_msgs/RobotStateCartesian[] _points
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _points (let (r) (dotimes (i n) (push (instance xpp_msgs::RobotStateCartesian :init) r)) r))
     (dolist (elem- _points)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get xpp_msgs::RobotStateCartesianTrajectory :md5sum-) "cf81e80e883d7cf1f8652d3cf7985437")
(setf (get xpp_msgs::RobotStateCartesianTrajectory :datatype-) "xpp_msgs/RobotStateCartesianTrajectory")
(setf (get xpp_msgs::RobotStateCartesianTrajectory :definition-)
      "# The state of a robot expressed in the cartesian frame

# The header is used to specify the coordinate frame and the reference time for the trajectory durations
std_msgs/Header header

# A representation of a Cartesian trajectory
RobotStateCartesian[] points

================================================================================
MSG: std_msgs/Header
# Standard metadata for higher-level stamped data types.
# This is generally used to communicate timestamped data 
# in a particular coordinate frame.
# 
# sequence ID: consecutively increasing ID 
uint32 seq
#Two-integer timestamp that is expressed as:
# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')
# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')
# time-handling sugar is provided by the client library
time stamp
#Frame this data is associated with
string frame_id

================================================================================
MSG: xpp_msgs/RobotStateCartesian
# The state of a robot expressed in the Cartesian frame

duration                time_from_start   # global time along trajectory

# Position, velocity and acceleration of the base expressed in world frame
# The orientation quaternion maps base to world frame.
State6d                 base              # base pos/vel/acc in world

StateLin3d[]            ee_motion         # endeffector pos/vel/acc in world
geometry_msgs/Vector3[] ee_forces         # endeffector forces expressed in world
bool[]                  ee_contact        # True if the foot is touching the environment




================================================================================
MSG: xpp_msgs/State6d
# The state of the 6D base of a system

geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world
geometry_msgs/Twist    twist        # The 6D linear and angular velocity 
geometry_msgs/Accel    accel        # The 6D linear and angular acceleration
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

================================================================================
MSG: geometry_msgs/Twist
# This expresses velocity in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: geometry_msgs/Vector3
# This represents a vector in free space. 
# It is only meant to represent a direction. Therefore, it does not
# make sense to apply a translation to it (e.g., when applying a 
# generic rigid transformation to a Vector3, tf2 will only apply the
# rotation). If you want your data to be translatable too, use the
# geometry_msgs/Point message instead.

float64 x
float64 y
float64 z
================================================================================
MSG: geometry_msgs/Accel
# This expresses acceleration in free space broken into its linear and angular parts.
Vector3  linear
Vector3  angular

================================================================================
MSG: xpp_msgs/StateLin3d
# This contains the 3D representation of a linear state, including:
# position, velocity, acceleration

geometry_msgs/Point pos
geometry_msgs/Vector3 vel
geometry_msgs/Vector3 acc
")



(provide :xpp_msgs/RobotStateCartesianTrajectory "cf81e80e883d7cf1f8652d3cf7985437")



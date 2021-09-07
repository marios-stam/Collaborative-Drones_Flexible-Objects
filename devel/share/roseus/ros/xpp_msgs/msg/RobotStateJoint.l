;; Auto-generated. Do not edit!


(when (boundp 'xpp_msgs::RobotStateJoint)
  (if (not (find-package "XPP_MSGS"))
    (make-package "XPP_MSGS"))
  (shadow 'RobotStateJoint (find-package "XPP_MSGS")))
(unless (find-package "XPP_MSGS::ROBOTSTATEJOINT")
  (make-package "XPP_MSGS::ROBOTSTATEJOINT"))

(in-package "ROS")
;;//! \htmlinclude RobotStateJoint.msg.html
(if (not (find-package "SENSOR_MSGS"))
  (ros::roseus-add-msgs "sensor_msgs"))


(defclass xpp_msgs::RobotStateJoint
  :super ros::object
  :slots (_time_from_start _base _joint_state _ee_contact ))

(defmethod xpp_msgs::RobotStateJoint
  (:init
   (&key
    ((:time_from_start __time_from_start) (instance ros::time :init))
    ((:base __base) (instance xpp_msgs::State6d :init))
    ((:joint_state __joint_state) (instance sensor_msgs::JointState :init))
    ((:ee_contact __ee_contact) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _time_from_start __time_from_start)
   (setq _base __base)
   (setq _joint_state __joint_state)
   (setq _ee_contact __ee_contact)
   self)
  (:time_from_start
   (&optional __time_from_start)
   (if __time_from_start (setq _time_from_start __time_from_start)) _time_from_start)
  (:base
   (&rest __base)
   (if (keywordp (car __base))
       (send* _base __base)
     (progn
       (if __base (setq _base (car __base)))
       _base)))
  (:joint_state
   (&rest __joint_state)
   (if (keywordp (car __joint_state))
       (send* _joint_state __joint_state)
     (progn
       (if __joint_state (setq _joint_state (car __joint_state)))
       _joint_state)))
  (:ee_contact
   (&optional __ee_contact)
   (if __ee_contact (setq _ee_contact __ee_contact)) _ee_contact)
  (:serialization-length
   ()
   (+
    ;; duration _time_from_start
    8
    ;; xpp_msgs/State6d _base
    (send _base :serialization-length)
    ;; sensor_msgs/JointState _joint_state
    (send _joint_state :serialization-length)
    ;; bool[] _ee_contact
    (* 1    (length _ee_contact)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; duration _time_from_start
       (write-long (send _time_from_start :sec) s) (write-long (send _time_from_start :nsec) s)
     ;; xpp_msgs/State6d _base
       (send _base :serialize s)
     ;; sensor_msgs/JointState _joint_state
       (send _joint_state :serialize s)
     ;; bool[] _ee_contact
     (write-long (length _ee_contact) s)
     (dotimes (i (length _ee_contact))
       (if (elt _ee_contact i) (write-byte -1 s) (write-byte 0 s))
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; duration _time_from_start
     (send _time_from_start :sec (sys::peek buf ptr- :integer)) (incf ptr- 4)  (send _time_from_start :nsec (sys::peek buf ptr- :integer)) (incf ptr- 4)
   ;; xpp_msgs/State6d _base
     (send _base :deserialize buf ptr-) (incf ptr- (send _base :serialization-length))
   ;; sensor_msgs/JointState _joint_state
     (send _joint_state :deserialize buf ptr-) (incf ptr- (send _joint_state :serialization-length))
   ;; bool[] _ee_contact
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ee_contact (make-list n))
     (dotimes (i n)
     (setf (elt _ee_contact i) (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
     ))
   ;;
   self)
  )

(setf (get xpp_msgs::RobotStateJoint :md5sum-) "e95013ef0a2eb2815e5e1a85c92e0ac0")
(setf (get xpp_msgs::RobotStateJoint :datatype-) "xpp_msgs/RobotStateJoint")
(setf (get xpp_msgs::RobotStateJoint :definition-)
      "# The state of a robot expressed in the Cartesian frame

duration                time_from_start   # global time along trajectory

# Position, velocity and acceleration of the base expressed in world frame
# The orientation quaternion maps base to world frame.
State6d                 base              # base pos/vel/acc in world

sensor_msgs/JointState  joint_state
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
MSG: sensor_msgs/JointState
# This is a message that holds data to describe the state of a set of torque controlled joints. 
#
# The state of each joint (revolute or prismatic) is defined by:
#  * the position of the joint (rad or m),
#  * the velocity of the joint (rad/s or m/s) and 
#  * the effort that is applied in the joint (Nm or N).
#
# Each joint is uniquely identified by its name
# The header specifies the time at which the joint states were recorded. All the joint states
# in one message have to be recorded at the same time.
#
# This message consists of a multiple arrays, one for each part of the joint state. 
# The goal is to make each of the fields optional. When e.g. your joints have no
# effort associated with them, you can leave the effort array empty. 
#
# All arrays in this message should have the same size, or be empty.
# This is the only way to uniquely associate the joint name with the correct
# states.


Header header

string[] name
float64[] position
float64[] velocity
float64[] effort

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

")



(provide :xpp_msgs/RobotStateJoint "e95013ef0a2eb2815e5e1a85c92e0ac0")



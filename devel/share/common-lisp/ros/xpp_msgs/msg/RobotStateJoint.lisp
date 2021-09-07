; Auto-generated. Do not edit!


(cl:in-package xpp_msgs-msg)


;//! \htmlinclude RobotStateJoint.msg.html

(cl:defclass <RobotStateJoint> (roslisp-msg-protocol:ros-message)
  ((time_from_start
    :reader time_from_start
    :initarg :time_from_start
    :type cl:real
    :initform 0)
   (base
    :reader base
    :initarg :base
    :type xpp_msgs-msg:State6d
    :initform (cl:make-instance 'xpp_msgs-msg:State6d))
   (joint_state
    :reader joint_state
    :initarg :joint_state
    :type sensor_msgs-msg:JointState
    :initform (cl:make-instance 'sensor_msgs-msg:JointState))
   (ee_contact
    :reader ee_contact
    :initarg :ee_contact
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass RobotStateJoint (<RobotStateJoint>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotStateJoint>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotStateJoint)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xpp_msgs-msg:<RobotStateJoint> is deprecated: use xpp_msgs-msg:RobotStateJoint instead.")))

(cl:ensure-generic-function 'time_from_start-val :lambda-list '(m))
(cl:defmethod time_from_start-val ((m <RobotStateJoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:time_from_start-val is deprecated.  Use xpp_msgs-msg:time_from_start instead.")
  (time_from_start m))

(cl:ensure-generic-function 'base-val :lambda-list '(m))
(cl:defmethod base-val ((m <RobotStateJoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:base-val is deprecated.  Use xpp_msgs-msg:base instead.")
  (base m))

(cl:ensure-generic-function 'joint_state-val :lambda-list '(m))
(cl:defmethod joint_state-val ((m <RobotStateJoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:joint_state-val is deprecated.  Use xpp_msgs-msg:joint_state instead.")
  (joint_state m))

(cl:ensure-generic-function 'ee_contact-val :lambda-list '(m))
(cl:defmethod ee_contact-val ((m <RobotStateJoint>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:ee_contact-val is deprecated.  Use xpp_msgs-msg:ee_contact instead.")
  (ee_contact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotStateJoint>) ostream)
  "Serializes a message object of type '<RobotStateJoint>"
  (cl:let ((__sec (cl:floor (cl:slot-value msg 'time_from_start)))
        (__nsec (cl:round (cl:* 1e9 (cl:- (cl:slot-value msg 'time_from_start) (cl:floor (cl:slot-value msg 'time_from_start)))))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __sec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 0) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __nsec) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __nsec) ostream))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'base) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'joint_state) ostream)
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ee_contact))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'ee_contact))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotStateJoint>) istream)
  "Deserializes a message object of type '<RobotStateJoint>"
    (cl:let ((__sec 0) (__nsec 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __sec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 0) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __nsec) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __nsec) (cl:read-byte istream))
      (cl:setf (cl:slot-value msg 'time_from_start) (cl:+ (cl:coerce __sec 'cl:double-float) (cl:/ __nsec 1e9))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'base) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'joint_state) istream)
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ee_contact) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ee_contact)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:not (cl:zerop (cl:read-byte istream)))))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotStateJoint>)))
  "Returns string type for a message object of type '<RobotStateJoint>"
  "xpp_msgs/RobotStateJoint")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotStateJoint)))
  "Returns string type for a message object of type 'RobotStateJoint"
  "xpp_msgs/RobotStateJoint")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotStateJoint>)))
  "Returns md5sum for a message object of type '<RobotStateJoint>"
  "e95013ef0a2eb2815e5e1a85c92e0ac0")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotStateJoint)))
  "Returns md5sum for a message object of type 'RobotStateJoint"
  "e95013ef0a2eb2815e5e1a85c92e0ac0")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotStateJoint>)))
  "Returns full string definition for message of type '<RobotStateJoint>"
  (cl:format cl:nil "# The state of a robot expressed in the Cartesian frame~%~%duration                time_from_start   # global time along trajectory~%~%# Position, velocity and acceleration of the base expressed in world frame~%# The orientation quaternion maps base to world frame.~%State6d                 base              # base pos/vel/acc in world~%~%sensor_msgs/JointState  joint_state~%bool[]                  ee_contact        # True if the foot is touching the environment~%~%~%~%~%================================================================================~%MSG: xpp_msgs/State6d~%# The state of the 6D base of a system~%~%geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world~%geometry_msgs/Twist    twist        # The 6D linear and angular velocity ~%geometry_msgs/Accel    accel        # The 6D linear and angular acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotStateJoint)))
  "Returns full string definition for message of type 'RobotStateJoint"
  (cl:format cl:nil "# The state of a robot expressed in the Cartesian frame~%~%duration                time_from_start   # global time along trajectory~%~%# Position, velocity and acceleration of the base expressed in world frame~%# The orientation quaternion maps base to world frame.~%State6d                 base              # base pos/vel/acc in world~%~%sensor_msgs/JointState  joint_state~%bool[]                  ee_contact        # True if the foot is touching the environment~%~%~%~%~%================================================================================~%MSG: xpp_msgs/State6d~%# The state of the 6D base of a system~%~%geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world~%geometry_msgs/Twist    twist        # The 6D linear and angular velocity ~%geometry_msgs/Accel    accel        # The 6D linear and angular acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: sensor_msgs/JointState~%# This is a message that holds data to describe the state of a set of torque controlled joints. ~%#~%# The state of each joint (revolute or prismatic) is defined by:~%#  * the position of the joint (rad or m),~%#  * the velocity of the joint (rad/s or m/s) and ~%#  * the effort that is applied in the joint (Nm or N).~%#~%# Each joint is uniquely identified by its name~%# The header specifies the time at which the joint states were recorded. All the joint states~%# in one message have to be recorded at the same time.~%#~%# This message consists of a multiple arrays, one for each part of the joint state. ~%# The goal is to make each of the fields optional. When e.g. your joints have no~%# effort associated with them, you can leave the effort array empty. ~%#~%# All arrays in this message should have the same size, or be empty.~%# This is the only way to uniquely associate the joint name with the correct~%# states.~%~%~%Header header~%~%string[] name~%float64[] position~%float64[] velocity~%float64[] effort~%~%================================================================================~%MSG: std_msgs/Header~%# Standard metadata for higher-level stamped data types.~%# This is generally used to communicate timestamped data ~%# in a particular coordinate frame.~%# ~%# sequence ID: consecutively increasing ID ~%uint32 seq~%#Two-integer timestamp that is expressed as:~%# * stamp.sec: seconds (stamp_secs) since epoch (in Python the variable is called 'secs')~%# * stamp.nsec: nanoseconds since stamp_secs (in Python the variable is called 'nsecs')~%# time-handling sugar is provided by the client library~%time stamp~%#Frame this data is associated with~%string frame_id~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotStateJoint>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'base))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'joint_state))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ee_contact) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotStateJoint>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotStateJoint
    (cl:cons ':time_from_start (time_from_start msg))
    (cl:cons ':base (base msg))
    (cl:cons ':joint_state (joint_state msg))
    (cl:cons ':ee_contact (ee_contact msg))
))

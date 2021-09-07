; Auto-generated. Do not edit!


(cl:in-package xpp_msgs-msg)


;//! \htmlinclude RobotStateCartesian.msg.html

(cl:defclass <RobotStateCartesian> (roslisp-msg-protocol:ros-message)
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
   (ee_motion
    :reader ee_motion
    :initarg :ee_motion
    :type (cl:vector xpp_msgs-msg:StateLin3d)
   :initform (cl:make-array 0 :element-type 'xpp_msgs-msg:StateLin3d :initial-element (cl:make-instance 'xpp_msgs-msg:StateLin3d)))
   (ee_forces
    :reader ee_forces
    :initarg :ee_forces
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3)))
   (ee_contact
    :reader ee_contact
    :initarg :ee_contact
    :type (cl:vector cl:boolean)
   :initform (cl:make-array 0 :element-type 'cl:boolean :initial-element cl:nil)))
)

(cl:defclass RobotStateCartesian (<RobotStateCartesian>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotStateCartesian>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotStateCartesian)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xpp_msgs-msg:<RobotStateCartesian> is deprecated: use xpp_msgs-msg:RobotStateCartesian instead.")))

(cl:ensure-generic-function 'time_from_start-val :lambda-list '(m))
(cl:defmethod time_from_start-val ((m <RobotStateCartesian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:time_from_start-val is deprecated.  Use xpp_msgs-msg:time_from_start instead.")
  (time_from_start m))

(cl:ensure-generic-function 'base-val :lambda-list '(m))
(cl:defmethod base-val ((m <RobotStateCartesian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:base-val is deprecated.  Use xpp_msgs-msg:base instead.")
  (base m))

(cl:ensure-generic-function 'ee_motion-val :lambda-list '(m))
(cl:defmethod ee_motion-val ((m <RobotStateCartesian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:ee_motion-val is deprecated.  Use xpp_msgs-msg:ee_motion instead.")
  (ee_motion m))

(cl:ensure-generic-function 'ee_forces-val :lambda-list '(m))
(cl:defmethod ee_forces-val ((m <RobotStateCartesian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:ee_forces-val is deprecated.  Use xpp_msgs-msg:ee_forces instead.")
  (ee_forces m))

(cl:ensure-generic-function 'ee_contact-val :lambda-list '(m))
(cl:defmethod ee_contact-val ((m <RobotStateCartesian>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:ee_contact-val is deprecated.  Use xpp_msgs-msg:ee_contact instead.")
  (ee_contact m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotStateCartesian>) ostream)
  "Serializes a message object of type '<RobotStateCartesian>"
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
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ee_motion))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ee_motion))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ee_forces))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'ee_forces))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ee_contact))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if ele 1 0)) ostream))
   (cl:slot-value msg 'ee_contact))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotStateCartesian>) istream)
  "Deserializes a message object of type '<RobotStateCartesian>"
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
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ee_motion) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ee_motion)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'xpp_msgs-msg:StateLin3d))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ee_forces) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ee_forces)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
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
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotStateCartesian>)))
  "Returns string type for a message object of type '<RobotStateCartesian>"
  "xpp_msgs/RobotStateCartesian")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotStateCartesian)))
  "Returns string type for a message object of type 'RobotStateCartesian"
  "xpp_msgs/RobotStateCartesian")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotStateCartesian>)))
  "Returns md5sum for a message object of type '<RobotStateCartesian>"
  "25955243f6c682a57bfe4fb411b854bb")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotStateCartesian)))
  "Returns md5sum for a message object of type 'RobotStateCartesian"
  "25955243f6c682a57bfe4fb411b854bb")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotStateCartesian>)))
  "Returns full string definition for message of type '<RobotStateCartesian>"
  (cl:format cl:nil "# The state of a robot expressed in the Cartesian frame~%~%duration                time_from_start   # global time along trajectory~%~%# Position, velocity and acceleration of the base expressed in world frame~%# The orientation quaternion maps base to world frame.~%State6d                 base              # base pos/vel/acc in world~%~%StateLin3d[]            ee_motion         # endeffector pos/vel/acc in world~%geometry_msgs/Vector3[] ee_forces         # endeffector forces expressed in world~%bool[]                  ee_contact        # True if the foot is touching the environment~%~%~%~%~%================================================================================~%MSG: xpp_msgs/State6d~%# The state of the 6D base of a system~%~%geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world~%geometry_msgs/Twist    twist        # The 6D linear and angular velocity ~%geometry_msgs/Accel    accel        # The 6D linear and angular acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: xpp_msgs/StateLin3d~%# This contains the 3D representation of a linear state, including:~%# position, velocity, acceleration~%~%geometry_msgs/Point pos~%geometry_msgs/Vector3 vel~%geometry_msgs/Vector3 acc~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotStateCartesian)))
  "Returns full string definition for message of type 'RobotStateCartesian"
  (cl:format cl:nil "# The state of a robot expressed in the Cartesian frame~%~%duration                time_from_start   # global time along trajectory~%~%# Position, velocity and acceleration of the base expressed in world frame~%# The orientation quaternion maps base to world frame.~%State6d                 base              # base pos/vel/acc in world~%~%StateLin3d[]            ee_motion         # endeffector pos/vel/acc in world~%geometry_msgs/Vector3[] ee_forces         # endeffector forces expressed in world~%bool[]                  ee_contact        # True if the foot is touching the environment~%~%~%~%~%================================================================================~%MSG: xpp_msgs/State6d~%# The state of the 6D base of a system~%~%geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world~%geometry_msgs/Twist    twist        # The 6D linear and angular velocity ~%geometry_msgs/Accel    accel        # The 6D linear and angular acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: xpp_msgs/StateLin3d~%# This contains the 3D representation of a linear state, including:~%# position, velocity, acceleration~%~%geometry_msgs/Point pos~%geometry_msgs/Vector3 vel~%geometry_msgs/Vector3 acc~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotStateCartesian>))
  (cl:+ 0
     8
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'base))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ee_motion) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ee_forces) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ee_contact) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 1)))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotStateCartesian>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotStateCartesian
    (cl:cons ':time_from_start (time_from_start msg))
    (cl:cons ':base (base msg))
    (cl:cons ':ee_motion (ee_motion msg))
    (cl:cons ':ee_forces (ee_forces msg))
    (cl:cons ':ee_contact (ee_contact msg))
))

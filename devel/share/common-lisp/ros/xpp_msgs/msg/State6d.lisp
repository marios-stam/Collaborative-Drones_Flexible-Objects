; Auto-generated. Do not edit!


(cl:in-package xpp_msgs-msg)


;//! \htmlinclude State6d.msg.html

(cl:defclass <State6d> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (twist
    :reader twist
    :initarg :twist
    :type geometry_msgs-msg:Twist
    :initform (cl:make-instance 'geometry_msgs-msg:Twist))
   (accel
    :reader accel
    :initarg :accel
    :type geometry_msgs-msg:Accel
    :initform (cl:make-instance 'geometry_msgs-msg:Accel)))
)

(cl:defclass State6d (<State6d>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <State6d>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'State6d)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xpp_msgs-msg:<State6d> is deprecated: use xpp_msgs-msg:State6d instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <State6d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:pose-val is deprecated.  Use xpp_msgs-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'twist-val :lambda-list '(m))
(cl:defmethod twist-val ((m <State6d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:twist-val is deprecated.  Use xpp_msgs-msg:twist instead.")
  (twist m))

(cl:ensure-generic-function 'accel-val :lambda-list '(m))
(cl:defmethod accel-val ((m <State6d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:accel-val is deprecated.  Use xpp_msgs-msg:accel instead.")
  (accel m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <State6d>) ostream)
  "Serializes a message object of type '<State6d>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'twist) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'accel) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <State6d>) istream)
  "Deserializes a message object of type '<State6d>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'twist) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'accel) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<State6d>)))
  "Returns string type for a message object of type '<State6d>"
  "xpp_msgs/State6d")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'State6d)))
  "Returns string type for a message object of type 'State6d"
  "xpp_msgs/State6d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<State6d>)))
  "Returns md5sum for a message object of type '<State6d>"
  "12a3981be6e2e29bdfd02e1da364b8ff")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'State6d)))
  "Returns md5sum for a message object of type 'State6d"
  "12a3981be6e2e29bdfd02e1da364b8ff")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<State6d>)))
  "Returns full string definition for message of type '<State6d>"
  (cl:format cl:nil "# The state of the 6D base of a system~%~%geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world~%geometry_msgs/Twist    twist        # The 6D linear and angular velocity ~%geometry_msgs/Accel    accel        # The 6D linear and angular acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'State6d)))
  "Returns full string definition for message of type 'State6d"
  (cl:format cl:nil "# The state of the 6D base of a system~%~%geometry_msgs/Pose     pose         # The 6D linear and angular position, orientation maps base to world~%geometry_msgs/Twist    twist        # The 6D linear and angular velocity ~%geometry_msgs/Accel    accel        # The 6D linear and angular acceleration~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%================================================================================~%MSG: geometry_msgs/Twist~%# This expresses velocity in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%================================================================================~%MSG: geometry_msgs/Accel~%# This expresses acceleration in free space broken into its linear and angular parts.~%Vector3  linear~%Vector3  angular~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <State6d>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'twist))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'accel))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <State6d>))
  "Converts a ROS message object to a list"
  (cl:list 'State6d
    (cl:cons ':pose (pose msg))
    (cl:cons ':twist (twist msg))
    (cl:cons ':accel (accel msg))
))

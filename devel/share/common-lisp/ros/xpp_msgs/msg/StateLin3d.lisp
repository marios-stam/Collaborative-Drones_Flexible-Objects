; Auto-generated. Do not edit!


(cl:in-package xpp_msgs-msg)


;//! \htmlinclude StateLin3d.msg.html

(cl:defclass <StateLin3d> (roslisp-msg-protocol:ros-message)
  ((pos
    :reader pos
    :initarg :pos
    :type geometry_msgs-msg:Point
    :initform (cl:make-instance 'geometry_msgs-msg:Point))
   (vel
    :reader vel
    :initarg :vel
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (acc
    :reader acc
    :initarg :acc
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3)))
)

(cl:defclass StateLin3d (<StateLin3d>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <StateLin3d>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'StateLin3d)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xpp_msgs-msg:<StateLin3d> is deprecated: use xpp_msgs-msg:StateLin3d instead.")))

(cl:ensure-generic-function 'pos-val :lambda-list '(m))
(cl:defmethod pos-val ((m <StateLin3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:pos-val is deprecated.  Use xpp_msgs-msg:pos instead.")
  (pos m))

(cl:ensure-generic-function 'vel-val :lambda-list '(m))
(cl:defmethod vel-val ((m <StateLin3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:vel-val is deprecated.  Use xpp_msgs-msg:vel instead.")
  (vel m))

(cl:ensure-generic-function 'acc-val :lambda-list '(m))
(cl:defmethod acc-val ((m <StateLin3d>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:acc-val is deprecated.  Use xpp_msgs-msg:acc instead.")
  (acc m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <StateLin3d>) ostream)
  "Serializes a message object of type '<StateLin3d>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pos) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'vel) ostream)
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'acc) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <StateLin3d>) istream)
  "Deserializes a message object of type '<StateLin3d>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pos) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'vel) istream)
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'acc) istream)
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<StateLin3d>)))
  "Returns string type for a message object of type '<StateLin3d>"
  "xpp_msgs/StateLin3d")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'StateLin3d)))
  "Returns string type for a message object of type 'StateLin3d"
  "xpp_msgs/StateLin3d")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<StateLin3d>)))
  "Returns md5sum for a message object of type '<StateLin3d>"
  "c4069b8f5d3058377f8685efad96ae30")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'StateLin3d)))
  "Returns md5sum for a message object of type 'StateLin3d"
  "c4069b8f5d3058377f8685efad96ae30")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<StateLin3d>)))
  "Returns full string definition for message of type '<StateLin3d>"
  (cl:format cl:nil "# This contains the 3D representation of a linear state, including:~%# position, velocity, acceleration~%~%geometry_msgs/Point pos~%geometry_msgs/Vector3 vel~%geometry_msgs/Vector3 acc~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'StateLin3d)))
  "Returns full string definition for message of type 'StateLin3d"
  (cl:format cl:nil "# This contains the 3D representation of a linear state, including:~%# position, velocity, acceleration~%~%geometry_msgs/Point pos~%geometry_msgs/Vector3 vel~%geometry_msgs/Vector3 acc~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <StateLin3d>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pos))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'vel))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'acc))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <StateLin3d>))
  "Converts a ROS message object to a list"
  (cl:list 'StateLin3d
    (cl:cons ':pos (pos msg))
    (cl:cons ':vel (vel msg))
    (cl:cons ':acc (acc msg))
))

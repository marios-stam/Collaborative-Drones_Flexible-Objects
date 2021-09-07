; Auto-generated. Do not edit!


(cl:in-package thesis_drone-msg)


;//! \htmlinclude drone_pose.msg.html

(cl:defclass <drone_pose> (roslisp-msg-protocol:ros-message)
  ((x
    :reader x
    :initarg :x
    :type cl:float
    :initform 0.0))
)

(cl:defclass drone_pose (<drone_pose>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <drone_pose>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'drone_pose)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name thesis_drone-msg:<drone_pose> is deprecated: use thesis_drone-msg:drone_pose instead.")))

(cl:ensure-generic-function 'x-val :lambda-list '(m))
(cl:defmethod x-val ((m <drone_pose>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader thesis_drone-msg:x-val is deprecated.  Use thesis_drone-msg:x instead.")
  (x m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <drone_pose>) ostream)
  "Serializes a message object of type '<drone_pose>"
  (cl:let ((bits (roslisp-utils:encode-single-float-bits (cl:slot-value msg 'x))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <drone_pose>) istream)
  "Deserializes a message object of type '<drone_pose>"
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'x) (roslisp-utils:decode-single-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<drone_pose>)))
  "Returns string type for a message object of type '<drone_pose>"
  "thesis_drone/drone_pose")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'drone_pose)))
  "Returns string type for a message object of type 'drone_pose"
  "thesis_drone/drone_pose")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<drone_pose>)))
  "Returns md5sum for a message object of type '<drone_pose>"
  "abd5d1e9c3ac157a0df3ba27b65d3384")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'drone_pose)))
  "Returns md5sum for a message object of type 'drone_pose"
  "abd5d1e9c3ac157a0df3ba27b65d3384")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<drone_pose>)))
  "Returns full string definition for message of type '<drone_pose>"
  (cl:format cl:nil "float32 x~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'drone_pose)))
  "Returns full string definition for message of type 'drone_pose"
  (cl:format cl:nil "float32 x~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <drone_pose>))
  (cl:+ 0
     4
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <drone_pose>))
  "Converts a ROS message object to a list"
  (cl:list 'drone_pose
    (cl:cons ':x (x msg))
))

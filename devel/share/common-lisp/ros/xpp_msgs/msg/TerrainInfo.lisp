; Auto-generated. Do not edit!


(cl:in-package xpp_msgs-msg)


;//! \htmlinclude TerrainInfo.msg.html

(cl:defclass <TerrainInfo> (roslisp-msg-protocol:ros-message)
  ((surface_normals
    :reader surface_normals
    :initarg :surface_normals
    :type (cl:vector geometry_msgs-msg:Vector3)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Vector3 :initial-element (cl:make-instance 'geometry_msgs-msg:Vector3)))
   (friction_coeff
    :reader friction_coeff
    :initarg :friction_coeff
    :type cl:float
    :initform 0.0))
)

(cl:defclass TerrainInfo (<TerrainInfo>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <TerrainInfo>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'TerrainInfo)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xpp_msgs-msg:<TerrainInfo> is deprecated: use xpp_msgs-msg:TerrainInfo instead.")))

(cl:ensure-generic-function 'surface_normals-val :lambda-list '(m))
(cl:defmethod surface_normals-val ((m <TerrainInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:surface_normals-val is deprecated.  Use xpp_msgs-msg:surface_normals instead.")
  (surface_normals m))

(cl:ensure-generic-function 'friction_coeff-val :lambda-list '(m))
(cl:defmethod friction_coeff-val ((m <TerrainInfo>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:friction_coeff-val is deprecated.  Use xpp_msgs-msg:friction_coeff instead.")
  (friction_coeff m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <TerrainInfo>) ostream)
  "Serializes a message object of type '<TerrainInfo>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'surface_normals))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'surface_normals))
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'friction_coeff))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <TerrainInfo>) istream)
  "Deserializes a message object of type '<TerrainInfo>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'surface_normals) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'surface_normals)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Vector3))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'friction_coeff) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<TerrainInfo>)))
  "Returns string type for a message object of type '<TerrainInfo>"
  "xpp_msgs/TerrainInfo")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'TerrainInfo)))
  "Returns string type for a message object of type 'TerrainInfo"
  "xpp_msgs/TerrainInfo")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<TerrainInfo>)))
  "Returns md5sum for a message object of type '<TerrainInfo>"
  "58f8d0d19c0428c00252cd1c16c74dcf")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'TerrainInfo)))
  "Returns md5sum for a message object of type 'TerrainInfo"
  "58f8d0d19c0428c00252cd1c16c74dcf")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<TerrainInfo>)))
  "Returns full string definition for message of type '<TerrainInfo>"
  (cl:format cl:nil "# Extending the robot state~%~%geometry_msgs/Vector3[] surface_normals      # at every endeffector, expressed in world~%float64                 friction_coeff       # friction coefficient~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'TerrainInfo)))
  "Returns full string definition for message of type 'TerrainInfo"
  (cl:format cl:nil "# Extending the robot state~%~%geometry_msgs/Vector3[] surface_normals      # at every endeffector, expressed in world~%float64                 friction_coeff       # friction coefficient~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <TerrainInfo>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'surface_normals) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <TerrainInfo>))
  "Converts a ROS message object to a list"
  (cl:list 'TerrainInfo
    (cl:cons ':surface_normals (surface_normals msg))
    (cl:cons ':friction_coeff (friction_coeff msg))
))

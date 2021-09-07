; Auto-generated. Do not edit!


(cl:in-package xpp_msgs-msg)


;//! \htmlinclude RobotParameters.msg.html

(cl:defclass <RobotParameters> (roslisp-msg-protocol:ros-message)
  ((ee_names
    :reader ee_names
    :initarg :ee_names
    :type (cl:vector cl:string)
   :initform (cl:make-array 0 :element-type 'cl:string :initial-element ""))
   (nominal_ee_pos
    :reader nominal_ee_pos
    :initarg :nominal_ee_pos
    :type (cl:vector geometry_msgs-msg:Point)
   :initform (cl:make-array 0 :element-type 'geometry_msgs-msg:Point :initial-element (cl:make-instance 'geometry_msgs-msg:Point)))
   (ee_max_dev
    :reader ee_max_dev
    :initarg :ee_max_dev
    :type geometry_msgs-msg:Vector3
    :initform (cl:make-instance 'geometry_msgs-msg:Vector3))
   (base_mass
    :reader base_mass
    :initarg :base_mass
    :type cl:float
    :initform 0.0))
)

(cl:defclass RobotParameters (<RobotParameters>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <RobotParameters>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'RobotParameters)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name xpp_msgs-msg:<RobotParameters> is deprecated: use xpp_msgs-msg:RobotParameters instead.")))

(cl:ensure-generic-function 'ee_names-val :lambda-list '(m))
(cl:defmethod ee_names-val ((m <RobotParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:ee_names-val is deprecated.  Use xpp_msgs-msg:ee_names instead.")
  (ee_names m))

(cl:ensure-generic-function 'nominal_ee_pos-val :lambda-list '(m))
(cl:defmethod nominal_ee_pos-val ((m <RobotParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:nominal_ee_pos-val is deprecated.  Use xpp_msgs-msg:nominal_ee_pos instead.")
  (nominal_ee_pos m))

(cl:ensure-generic-function 'ee_max_dev-val :lambda-list '(m))
(cl:defmethod ee_max_dev-val ((m <RobotParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:ee_max_dev-val is deprecated.  Use xpp_msgs-msg:ee_max_dev instead.")
  (ee_max_dev m))

(cl:ensure-generic-function 'base_mass-val :lambda-list '(m))
(cl:defmethod base_mass-val ((m <RobotParameters>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader xpp_msgs-msg:base_mass-val is deprecated.  Use xpp_msgs-msg:base_mass instead.")
  (base_mass m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <RobotParameters>) ostream)
  "Serializes a message object of type '<RobotParameters>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'ee_names))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (cl:let ((__ros_str_len (cl:length ele)))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_str_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_str_len) ostream))
  (cl:map cl:nil #'(cl:lambda (c) (cl:write-byte (cl:char-code c) ostream)) ele))
   (cl:slot-value msg 'ee_names))
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'nominal_ee_pos))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'nominal_ee_pos))
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'ee_max_dev) ostream)
  (cl:let ((bits (roslisp-utils:encode-double-float-bits (cl:slot-value msg 'base_mass))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 32) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 40) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 48) bits) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 56) bits) ostream))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <RobotParameters>) istream)
  "Deserializes a message object of type '<RobotParameters>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'ee_names) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'ee_names)))
    (cl:dotimes (i __ros_arr_len)
    (cl:let ((__ros_str_len 0))
      (cl:setf (cl:ldb (cl:byte 8 0) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) __ros_str_len) (cl:read-byte istream))
      (cl:setf (cl:aref vals i) (cl:make-string __ros_str_len))
      (cl:dotimes (__ros_str_idx __ros_str_len msg)
        (cl:setf (cl:char (cl:aref vals i) __ros_str_idx) (cl:code-char (cl:read-byte istream))))))))
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'nominal_ee_pos) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'nominal_ee_pos)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'geometry_msgs-msg:Point))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'ee_max_dev) istream)
    (cl:let ((bits 0))
      (cl:setf (cl:ldb (cl:byte 8 0) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 8) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 16) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 24) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 32) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 40) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 48) bits) (cl:read-byte istream))
      (cl:setf (cl:ldb (cl:byte 8 56) bits) (cl:read-byte istream))
    (cl:setf (cl:slot-value msg 'base_mass) (roslisp-utils:decode-double-float-bits bits)))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<RobotParameters>)))
  "Returns string type for a message object of type '<RobotParameters>"
  "xpp_msgs/RobotParameters")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'RobotParameters)))
  "Returns string type for a message object of type 'RobotParameters"
  "xpp_msgs/RobotParameters")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<RobotParameters>)))
  "Returns md5sum for a message object of type '<RobotParameters>"
  "93bb9137a8bf2b168102f89fd6a86853")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'RobotParameters)))
  "Returns md5sum for a message object of type 'RobotParameters"
  "93bb9137a8bf2b168102f89fd6a86853")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<RobotParameters>)))
  "Returns full string definition for message of type '<RobotParameters>"
  (cl:format cl:nil "# Parameters used to generate this optimization/trajectory~%# Should basically save class xpp::OptimizationParameters~%~%# endeffector names (order of endeffectors, e.g. LF, RF, LH, RH)~%string[] ee_names  ~%~%geometry_msgs/Point[]   nominal_ee_pos    # nominal position of each endeffector~%geometry_msgs/Vector3   ee_max_dev        # the maximum distance the endeffector can deviate from the nominal position~%~%float64                 base_mass         # mass of the robot base (for plotting gravity force)             ~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'RobotParameters)))
  "Returns full string definition for message of type 'RobotParameters"
  (cl:format cl:nil "# Parameters used to generate this optimization/trajectory~%# Should basically save class xpp::OptimizationParameters~%~%# endeffector names (order of endeffectors, e.g. LF, RF, LH, RH)~%string[] ee_names  ~%~%geometry_msgs/Point[]   nominal_ee_pos    # nominal position of each endeffector~%geometry_msgs/Vector3   ee_max_dev        # the maximum distance the endeffector can deviate from the nominal position~%~%float64                 base_mass         # mass of the robot base (for plotting gravity force)             ~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Vector3~%# This represents a vector in free space. ~%# It is only meant to represent a direction. Therefore, it does not~%# make sense to apply a translation to it (e.g., when applying a ~%# generic rigid transformation to a Vector3, tf2 will only apply the~%# rotation). If you want your data to be translatable too, use the~%# geometry_msgs/Point message instead.~%~%float64 x~%float64 y~%float64 z~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <RobotParameters>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'ee_names) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ 4 (cl:length ele))))
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'nominal_ee_pos) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'ee_max_dev))
     8
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <RobotParameters>))
  "Converts a ROS message object to a list"
  (cl:list 'RobotParameters
    (cl:cons ':ee_names (ee_names msg))
    (cl:cons ':nominal_ee_pos (nominal_ee_pos msg))
    (cl:cons ':ee_max_dev (ee_max_dev msg))
    (cl:cons ':base_mass (base_mass msg))
))

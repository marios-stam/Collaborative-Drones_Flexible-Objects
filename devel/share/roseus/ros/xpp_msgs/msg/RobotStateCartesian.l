;; Auto-generated. Do not edit!


(when (boundp 'xpp_msgs::RobotStateCartesian)
  (if (not (find-package "XPP_MSGS"))
    (make-package "XPP_MSGS"))
  (shadow 'RobotStateCartesian (find-package "XPP_MSGS")))
(unless (find-package "XPP_MSGS::ROBOTSTATECARTESIAN")
  (make-package "XPP_MSGS::ROBOTSTATECARTESIAN"))

(in-package "ROS")
;;//! \htmlinclude RobotStateCartesian.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass xpp_msgs::RobotStateCartesian
  :super ros::object
  :slots (_time_from_start _base _ee_motion _ee_forces _ee_contact ))

(defmethod xpp_msgs::RobotStateCartesian
  (:init
   (&key
    ((:time_from_start __time_from_start) (instance ros::time :init))
    ((:base __base) (instance xpp_msgs::State6d :init))
    ((:ee_motion __ee_motion) ())
    ((:ee_forces __ee_forces) ())
    ((:ee_contact __ee_contact) (let (r) (dotimes (i 0) (push nil r)) r))
    )
   (send-super :init)
   (setq _time_from_start __time_from_start)
   (setq _base __base)
   (setq _ee_motion __ee_motion)
   (setq _ee_forces __ee_forces)
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
  (:ee_motion
   (&rest __ee_motion)
   (if (keywordp (car __ee_motion))
       (send* _ee_motion __ee_motion)
     (progn
       (if __ee_motion (setq _ee_motion (car __ee_motion)))
       _ee_motion)))
  (:ee_forces
   (&rest __ee_forces)
   (if (keywordp (car __ee_forces))
       (send* _ee_forces __ee_forces)
     (progn
       (if __ee_forces (setq _ee_forces (car __ee_forces)))
       _ee_forces)))
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
    ;; xpp_msgs/StateLin3d[] _ee_motion
    (apply #'+ (send-all _ee_motion :serialization-length)) 4
    ;; geometry_msgs/Vector3[] _ee_forces
    (apply #'+ (send-all _ee_forces :serialization-length)) 4
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
     ;; xpp_msgs/StateLin3d[] _ee_motion
     (write-long (length _ee_motion) s)
     (dolist (elem _ee_motion)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3[] _ee_forces
     (write-long (length _ee_forces) s)
     (dolist (elem _ee_forces)
       (send elem :serialize s)
       )
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
   ;; xpp_msgs/StateLin3d[] _ee_motion
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ee_motion (let (r) (dotimes (i n) (push (instance xpp_msgs::StateLin3d :init) r)) r))
     (dolist (elem- _ee_motion)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3[] _ee_forces
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ee_forces (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _ee_forces)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
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

(setf (get xpp_msgs::RobotStateCartesian :md5sum-) "25955243f6c682a57bfe4fb411b854bb")
(setf (get xpp_msgs::RobotStateCartesian :datatype-) "xpp_msgs/RobotStateCartesian")
(setf (get xpp_msgs::RobotStateCartesian :definition-)
      "# The state of a robot expressed in the Cartesian frame

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



(provide :xpp_msgs/RobotStateCartesian "25955243f6c682a57bfe4fb411b854bb")



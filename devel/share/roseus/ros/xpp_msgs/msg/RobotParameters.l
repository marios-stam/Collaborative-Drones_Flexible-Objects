;; Auto-generated. Do not edit!


(when (boundp 'xpp_msgs::RobotParameters)
  (if (not (find-package "XPP_MSGS"))
    (make-package "XPP_MSGS"))
  (shadow 'RobotParameters (find-package "XPP_MSGS")))
(unless (find-package "XPP_MSGS::ROBOTPARAMETERS")
  (make-package "XPP_MSGS::ROBOTPARAMETERS"))

(in-package "ROS")
;;//! \htmlinclude RobotParameters.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass xpp_msgs::RobotParameters
  :super ros::object
  :slots (_ee_names _nominal_ee_pos _ee_max_dev _base_mass ))

(defmethod xpp_msgs::RobotParameters
  (:init
   (&key
    ((:ee_names __ee_names) (let (r) (dotimes (i 0) (push "" r)) r))
    ((:nominal_ee_pos __nominal_ee_pos) ())
    ((:ee_max_dev __ee_max_dev) (instance geometry_msgs::Vector3 :init))
    ((:base_mass __base_mass) 0.0)
    )
   (send-super :init)
   (setq _ee_names __ee_names)
   (setq _nominal_ee_pos __nominal_ee_pos)
   (setq _ee_max_dev __ee_max_dev)
   (setq _base_mass (float __base_mass))
   self)
  (:ee_names
   (&optional __ee_names)
   (if __ee_names (setq _ee_names __ee_names)) _ee_names)
  (:nominal_ee_pos
   (&rest __nominal_ee_pos)
   (if (keywordp (car __nominal_ee_pos))
       (send* _nominal_ee_pos __nominal_ee_pos)
     (progn
       (if __nominal_ee_pos (setq _nominal_ee_pos (car __nominal_ee_pos)))
       _nominal_ee_pos)))
  (:ee_max_dev
   (&rest __ee_max_dev)
   (if (keywordp (car __ee_max_dev))
       (send* _ee_max_dev __ee_max_dev)
     (progn
       (if __ee_max_dev (setq _ee_max_dev (car __ee_max_dev)))
       _ee_max_dev)))
  (:base_mass
   (&optional __base_mass)
   (if __base_mass (setq _base_mass __base_mass)) _base_mass)
  (:serialization-length
   ()
   (+
    ;; string[] _ee_names
    (apply #'+ (mapcar #'(lambda (x) (+ 4 (length x))) _ee_names)) 4
    ;; geometry_msgs/Point[] _nominal_ee_pos
    (apply #'+ (send-all _nominal_ee_pos :serialization-length)) 4
    ;; geometry_msgs/Vector3 _ee_max_dev
    (send _ee_max_dev :serialization-length)
    ;; float64 _base_mass
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; string[] _ee_names
     (write-long (length _ee_names) s)
     (dolist (elem _ee_names)
       (write-long (length elem) s) (princ elem s)
       )
     ;; geometry_msgs/Point[] _nominal_ee_pos
     (write-long (length _nominal_ee_pos) s)
     (dolist (elem _nominal_ee_pos)
       (send elem :serialize s)
       )
     ;; geometry_msgs/Vector3 _ee_max_dev
       (send _ee_max_dev :serialize s)
     ;; float64 _base_mass
       (sys::poke _base_mass (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; string[] _ee_names
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _ee_names (make-list n))
     (dotimes (i n)
     (let (n) (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4) (setf (elt _ee_names i) (subseq buf ptr- (+ ptr- n))) (incf ptr- n))
     ))
   ;; geometry_msgs/Point[] _nominal_ee_pos
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _nominal_ee_pos (let (r) (dotimes (i n) (push (instance geometry_msgs::Point :init) r)) r))
     (dolist (elem- _nominal_ee_pos)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; geometry_msgs/Vector3 _ee_max_dev
     (send _ee_max_dev :deserialize buf ptr-) (incf ptr- (send _ee_max_dev :serialization-length))
   ;; float64 _base_mass
     (setq _base_mass (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get xpp_msgs::RobotParameters :md5sum-) "93bb9137a8bf2b168102f89fd6a86853")
(setf (get xpp_msgs::RobotParameters :datatype-) "xpp_msgs/RobotParameters")
(setf (get xpp_msgs::RobotParameters :definition-)
      "# Parameters used to generate this optimization/trajectory
# Should basically save class xpp::OptimizationParameters

# endeffector names (order of endeffectors, e.g. LF, RF, LH, RH)
string[] ee_names  

geometry_msgs/Point[]   nominal_ee_pos    # nominal position of each endeffector
geometry_msgs/Vector3   ee_max_dev        # the maximum distance the endeffector can deviate from the nominal position

float64                 base_mass         # mass of the robot base (for plotting gravity force)             

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

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
")



(provide :xpp_msgs/RobotParameters "93bb9137a8bf2b168102f89fd6a86853")



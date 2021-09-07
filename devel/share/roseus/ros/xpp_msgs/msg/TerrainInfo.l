;; Auto-generated. Do not edit!


(when (boundp 'xpp_msgs::TerrainInfo)
  (if (not (find-package "XPP_MSGS"))
    (make-package "XPP_MSGS"))
  (shadow 'TerrainInfo (find-package "XPP_MSGS")))
(unless (find-package "XPP_MSGS::TERRAININFO")
  (make-package "XPP_MSGS::TERRAININFO"))

(in-package "ROS")
;;//! \htmlinclude TerrainInfo.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass xpp_msgs::TerrainInfo
  :super ros::object
  :slots (_surface_normals _friction_coeff ))

(defmethod xpp_msgs::TerrainInfo
  (:init
   (&key
    ((:surface_normals __surface_normals) ())
    ((:friction_coeff __friction_coeff) 0.0)
    )
   (send-super :init)
   (setq _surface_normals __surface_normals)
   (setq _friction_coeff (float __friction_coeff))
   self)
  (:surface_normals
   (&rest __surface_normals)
   (if (keywordp (car __surface_normals))
       (send* _surface_normals __surface_normals)
     (progn
       (if __surface_normals (setq _surface_normals (car __surface_normals)))
       _surface_normals)))
  (:friction_coeff
   (&optional __friction_coeff)
   (if __friction_coeff (setq _friction_coeff __friction_coeff)) _friction_coeff)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Vector3[] _surface_normals
    (apply #'+ (send-all _surface_normals :serialization-length)) 4
    ;; float64 _friction_coeff
    8
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Vector3[] _surface_normals
     (write-long (length _surface_normals) s)
     (dolist (elem _surface_normals)
       (send elem :serialize s)
       )
     ;; float64 _friction_coeff
       (sys::poke _friction_coeff (send s :buffer) (send s :count) :double) (incf (stream-count s) 8)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Vector3[] _surface_normals
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _surface_normals (let (r) (dotimes (i n) (push (instance geometry_msgs::Vector3 :init) r)) r))
     (dolist (elem- _surface_normals)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;; float64 _friction_coeff
     (setq _friction_coeff (sys::peek buf ptr- :double)) (incf ptr- 8)
   ;;
   self)
  )

(setf (get xpp_msgs::TerrainInfo :md5sum-) "58f8d0d19c0428c00252cd1c16c74dcf")
(setf (get xpp_msgs::TerrainInfo :datatype-) "xpp_msgs/TerrainInfo")
(setf (get xpp_msgs::TerrainInfo :definition-)
      "# Extending the robot state

geometry_msgs/Vector3[] surface_normals      # at every endeffector, expressed in world
float64                 friction_coeff       # friction coefficient
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



(provide :xpp_msgs/TerrainInfo "58f8d0d19c0428c00252cd1c16c74dcf")



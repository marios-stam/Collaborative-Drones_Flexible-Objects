;; Auto-generated. Do not edit!


(when (boundp 'thesis_drone::drone_pose)
  (if (not (find-package "THESIS_DRONE"))
    (make-package "THESIS_DRONE"))
  (shadow 'drone_pose (find-package "THESIS_DRONE")))
(unless (find-package "THESIS_DRONE::DRONE_POSE")
  (make-package "THESIS_DRONE::DRONE_POSE"))

(in-package "ROS")
;;//! \htmlinclude drone_pose.msg.html


(defclass thesis_drone::drone_pose
  :super ros::object
  :slots (_x ))

(defmethod thesis_drone::drone_pose
  (:init
   (&key
    ((:x __x) 0.0)
    )
   (send-super :init)
   (setq _x (float __x))
   self)
  (:x
   (&optional __x)
   (if __x (setq _x __x)) _x)
  (:serialization-length
   ()
   (+
    ;; float32 _x
    4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; float32 _x
       (sys::poke _x (send s :buffer) (send s :count) :float) (incf (stream-count s) 4)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; float32 _x
     (setq _x (sys::peek buf ptr- :float)) (incf ptr- 4)
   ;;
   self)
  )

(setf (get thesis_drone::drone_pose :md5sum-) "abd5d1e9c3ac157a0df3ba27b65d3384")
(setf (get thesis_drone::drone_pose :datatype-) "thesis_drone/drone_pose")
(setf (get thesis_drone::drone_pose :definition-)
      "float32 x
")



(provide :thesis_drone/drone_pose "abd5d1e9c3ac157a0df3ba27b65d3384")



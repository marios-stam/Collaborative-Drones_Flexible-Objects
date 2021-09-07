
(cl:in-package :asdf)

(defsystem "xpp_msgs-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
               :sensor_msgs-msg
               :std_msgs-msg
)
  :components ((:file "_package")
    (:file "RobotParameters" :depends-on ("_package_RobotParameters"))
    (:file "_package_RobotParameters" :depends-on ("_package"))
    (:file "RobotStateCartesian" :depends-on ("_package_RobotStateCartesian"))
    (:file "_package_RobotStateCartesian" :depends-on ("_package"))
    (:file "RobotStateCartesianTrajectory" :depends-on ("_package_RobotStateCartesianTrajectory"))
    (:file "_package_RobotStateCartesianTrajectory" :depends-on ("_package"))
    (:file "RobotStateJoint" :depends-on ("_package_RobotStateJoint"))
    (:file "_package_RobotStateJoint" :depends-on ("_package"))
    (:file "State6d" :depends-on ("_package_State6d"))
    (:file "_package_State6d" :depends-on ("_package"))
    (:file "StateLin3d" :depends-on ("_package_StateLin3d"))
    (:file "_package_StateLin3d" :depends-on ("_package"))
    (:file "TerrainInfo" :depends-on ("_package_TerrainInfo"))
    (:file "_package_TerrainInfo" :depends-on ("_package"))
  ))
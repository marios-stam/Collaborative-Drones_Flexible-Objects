
(cl:in-package :asdf)

(defsystem "thesis_drone-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "drone_pose" :depends-on ("_package_drone_pose"))
    (:file "_package_drone_pose" :depends-on ("_package"))
  ))
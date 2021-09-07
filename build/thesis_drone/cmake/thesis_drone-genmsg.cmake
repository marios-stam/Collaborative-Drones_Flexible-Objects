# generated from genmsg/cmake/pkg-genmsg.cmake.em

message(STATUS "thesis_drone: 1 messages, 0 services")

set(MSG_I_FLAGS "-Ithesis_drone:/home/marios/catkin_ws/src/thesis_drone/msg;-Istd_msgs:/opt/ros/noetic/share/std_msgs/cmake/../msg")

# Find all generators
find_package(gencpp REQUIRED)
find_package(geneus REQUIRED)
find_package(genlisp REQUIRED)
find_package(gennodejs REQUIRED)
find_package(genpy REQUIRED)

add_custom_target(thesis_drone_generate_messages ALL)

# verify that message/service dependencies have not changed since configure



get_filename_component(_filename "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" NAME_WE)
add_custom_target(_thesis_drone_generate_messages_check_deps_${_filename}
  COMMAND ${CATKIN_ENV} ${PYTHON_EXECUTABLE} ${GENMSG_CHECK_DEPS_SCRIPT} "thesis_drone" "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" ""
)

#
#  langs = gencpp;geneus;genlisp;gennodejs;genpy
#

### Section generating for lang: gencpp
### Generating Messages
_generate_msg_cpp(thesis_drone
  "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thesis_drone
)

### Generating Services

### Generating Module File
_generate_module_cpp(thesis_drone
  ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thesis_drone
  "${ALL_GEN_OUTPUT_FILES_cpp}"
)

add_custom_target(thesis_drone_generate_messages_cpp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_cpp}
)
add_dependencies(thesis_drone_generate_messages thesis_drone_generate_messages_cpp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" NAME_WE)
add_dependencies(thesis_drone_generate_messages_cpp _thesis_drone_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thesis_drone_gencpp)
add_dependencies(thesis_drone_gencpp thesis_drone_generate_messages_cpp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thesis_drone_generate_messages_cpp)

### Section generating for lang: geneus
### Generating Messages
_generate_msg_eus(thesis_drone
  "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thesis_drone
)

### Generating Services

### Generating Module File
_generate_module_eus(thesis_drone
  ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thesis_drone
  "${ALL_GEN_OUTPUT_FILES_eus}"
)

add_custom_target(thesis_drone_generate_messages_eus
  DEPENDS ${ALL_GEN_OUTPUT_FILES_eus}
)
add_dependencies(thesis_drone_generate_messages thesis_drone_generate_messages_eus)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" NAME_WE)
add_dependencies(thesis_drone_generate_messages_eus _thesis_drone_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thesis_drone_geneus)
add_dependencies(thesis_drone_geneus thesis_drone_generate_messages_eus)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thesis_drone_generate_messages_eus)

### Section generating for lang: genlisp
### Generating Messages
_generate_msg_lisp(thesis_drone
  "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thesis_drone
)

### Generating Services

### Generating Module File
_generate_module_lisp(thesis_drone
  ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thesis_drone
  "${ALL_GEN_OUTPUT_FILES_lisp}"
)

add_custom_target(thesis_drone_generate_messages_lisp
  DEPENDS ${ALL_GEN_OUTPUT_FILES_lisp}
)
add_dependencies(thesis_drone_generate_messages thesis_drone_generate_messages_lisp)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" NAME_WE)
add_dependencies(thesis_drone_generate_messages_lisp _thesis_drone_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thesis_drone_genlisp)
add_dependencies(thesis_drone_genlisp thesis_drone_generate_messages_lisp)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thesis_drone_generate_messages_lisp)

### Section generating for lang: gennodejs
### Generating Messages
_generate_msg_nodejs(thesis_drone
  "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thesis_drone
)

### Generating Services

### Generating Module File
_generate_module_nodejs(thesis_drone
  ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thesis_drone
  "${ALL_GEN_OUTPUT_FILES_nodejs}"
)

add_custom_target(thesis_drone_generate_messages_nodejs
  DEPENDS ${ALL_GEN_OUTPUT_FILES_nodejs}
)
add_dependencies(thesis_drone_generate_messages thesis_drone_generate_messages_nodejs)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" NAME_WE)
add_dependencies(thesis_drone_generate_messages_nodejs _thesis_drone_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thesis_drone_gennodejs)
add_dependencies(thesis_drone_gennodejs thesis_drone_generate_messages_nodejs)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thesis_drone_generate_messages_nodejs)

### Section generating for lang: genpy
### Generating Messages
_generate_msg_py(thesis_drone
  "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg"
  "${MSG_I_FLAGS}"
  ""
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone
)

### Generating Services

### Generating Module File
_generate_module_py(thesis_drone
  ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone
  "${ALL_GEN_OUTPUT_FILES_py}"
)

add_custom_target(thesis_drone_generate_messages_py
  DEPENDS ${ALL_GEN_OUTPUT_FILES_py}
)
add_dependencies(thesis_drone_generate_messages thesis_drone_generate_messages_py)

# add dependencies to all check dependencies targets
get_filename_component(_filename "/home/marios/catkin_ws/src/thesis_drone/msg/drone_pose.msg" NAME_WE)
add_dependencies(thesis_drone_generate_messages_py _thesis_drone_generate_messages_check_deps_${_filename})

# target for backward compatibility
add_custom_target(thesis_drone_genpy)
add_dependencies(thesis_drone_genpy thesis_drone_generate_messages_py)

# register target for catkin_package(EXPORTED_TARGETS)
list(APPEND ${PROJECT_NAME}_EXPORTED_TARGETS thesis_drone_generate_messages_py)



if(gencpp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thesis_drone)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gencpp_INSTALL_DIR}/thesis_drone
    DESTINATION ${gencpp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_cpp)
  add_dependencies(thesis_drone_generate_messages_cpp std_msgs_generate_messages_cpp)
endif()

if(geneus_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thesis_drone)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${geneus_INSTALL_DIR}/thesis_drone
    DESTINATION ${geneus_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_eus)
  add_dependencies(thesis_drone_generate_messages_eus std_msgs_generate_messages_eus)
endif()

if(genlisp_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thesis_drone)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genlisp_INSTALL_DIR}/thesis_drone
    DESTINATION ${genlisp_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_lisp)
  add_dependencies(thesis_drone_generate_messages_lisp std_msgs_generate_messages_lisp)
endif()

if(gennodejs_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thesis_drone)
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${gennodejs_INSTALL_DIR}/thesis_drone
    DESTINATION ${gennodejs_INSTALL_DIR}
  )
endif()
if(TARGET std_msgs_generate_messages_nodejs)
  add_dependencies(thesis_drone_generate_messages_nodejs std_msgs_generate_messages_nodejs)
endif()

if(genpy_INSTALL_DIR AND EXISTS ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone)
  install(CODE "execute_process(COMMAND \"/usr/bin/python3\" -m compileall \"${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone\")")
  # install generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone
    DESTINATION ${genpy_INSTALL_DIR}
    # skip all init files
    PATTERN "__init__.py" EXCLUDE
    PATTERN "__init__.pyc" EXCLUDE
  )
  # install init files which are not in the root folder of the generated code
  install(
    DIRECTORY ${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone
    DESTINATION ${genpy_INSTALL_DIR}
    FILES_MATCHING
    REGEX "${CATKIN_DEVEL_PREFIX}/${genpy_INSTALL_DIR}/thesis_drone/.+/__init__.pyc?$"
  )
endif()
if(TARGET std_msgs_generate_messages_py)
  add_dependencies(thesis_drone_generate_messages_py std_msgs_generate_messages_py)
endif()

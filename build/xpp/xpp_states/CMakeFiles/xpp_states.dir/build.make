# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.16

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/marios/catkin_ws/src

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/marios/catkin_ws/build

# Include any dependencies generated for this target.
include xpp/xpp_states/CMakeFiles/xpp_states.dir/depend.make

# Include the progress variables for this target.
include xpp/xpp_states/CMakeFiles/xpp_states.dir/progress.make

# Include the compile flags for this target's objects.
include xpp/xpp_states/CMakeFiles/xpp_states.dir/flags.make

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/state.cc.o: xpp/xpp_states/CMakeFiles/xpp_states.dir/flags.make
xpp/xpp_states/CMakeFiles/xpp_states.dir/src/state.cc.o: /home/marios/catkin_ws/src/xpp/xpp_states/src/state.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marios/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object xpp/xpp_states/CMakeFiles/xpp_states.dir/src/state.cc.o"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/xpp_states.dir/src/state.cc.o -c /home/marios/catkin_ws/src/xpp/xpp_states/src/state.cc

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/state.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/xpp_states.dir/src/state.cc.i"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/marios/catkin_ws/src/xpp/xpp_states/src/state.cc > CMakeFiles/xpp_states.dir/src/state.cc.i

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/state.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/xpp_states.dir/src/state.cc.s"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/marios/catkin_ws/src/xpp/xpp_states/src/state.cc -o CMakeFiles/xpp_states.dir/src/state.cc.s

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/joints.cc.o: xpp/xpp_states/CMakeFiles/xpp_states.dir/flags.make
xpp/xpp_states/CMakeFiles/xpp_states.dir/src/joints.cc.o: /home/marios/catkin_ws/src/xpp/xpp_states/src/joints.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marios/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object xpp/xpp_states/CMakeFiles/xpp_states.dir/src/joints.cc.o"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/xpp_states.dir/src/joints.cc.o -c /home/marios/catkin_ws/src/xpp/xpp_states/src/joints.cc

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/joints.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/xpp_states.dir/src/joints.cc.i"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/marios/catkin_ws/src/xpp/xpp_states/src/joints.cc > CMakeFiles/xpp_states.dir/src/joints.cc.i

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/joints.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/xpp_states.dir/src/joints.cc.s"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/marios/catkin_ws/src/xpp/xpp_states/src/joints.cc -o CMakeFiles/xpp_states.dir/src/joints.cc.s

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.o: xpp/xpp_states/CMakeFiles/xpp_states.dir/flags.make
xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.o: /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_cartesian.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marios/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.o"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.o -c /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_cartesian.cc

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.i"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_cartesian.cc > CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.i

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.s"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_cartesian.cc -o CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.s

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.o: xpp/xpp_states/CMakeFiles/xpp_states.dir/flags.make
xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.o: /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_joint.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/marios/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.o"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.o -c /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_joint.cc

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.i"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_joint.cc > CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.i

xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.s"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/marios/catkin_ws/src/xpp/xpp_states/src/robot_state_joint.cc -o CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.s

# Object files for target xpp_states
xpp_states_OBJECTS = \
"CMakeFiles/xpp_states.dir/src/state.cc.o" \
"CMakeFiles/xpp_states.dir/src/joints.cc.o" \
"CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.o" \
"CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.o"

# External object files for target xpp_states
xpp_states_EXTERNAL_OBJECTS =

/home/marios/catkin_ws/devel/lib/libxpp_states.so: xpp/xpp_states/CMakeFiles/xpp_states.dir/src/state.cc.o
/home/marios/catkin_ws/devel/lib/libxpp_states.so: xpp/xpp_states/CMakeFiles/xpp_states.dir/src/joints.cc.o
/home/marios/catkin_ws/devel/lib/libxpp_states.so: xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_cartesian.cc.o
/home/marios/catkin_ws/devel/lib/libxpp_states.so: xpp/xpp_states/CMakeFiles/xpp_states.dir/src/robot_state_joint.cc.o
/home/marios/catkin_ws/devel/lib/libxpp_states.so: xpp/xpp_states/CMakeFiles/xpp_states.dir/build.make
/home/marios/catkin_ws/devel/lib/libxpp_states.so: xpp/xpp_states/CMakeFiles/xpp_states.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/marios/catkin_ws/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Linking CXX shared library /home/marios/catkin_ws/devel/lib/libxpp_states.so"
	cd /home/marios/catkin_ws/build/xpp/xpp_states && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/xpp_states.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
xpp/xpp_states/CMakeFiles/xpp_states.dir/build: /home/marios/catkin_ws/devel/lib/libxpp_states.so

.PHONY : xpp/xpp_states/CMakeFiles/xpp_states.dir/build

xpp/xpp_states/CMakeFiles/xpp_states.dir/clean:
	cd /home/marios/catkin_ws/build/xpp/xpp_states && $(CMAKE_COMMAND) -P CMakeFiles/xpp_states.dir/cmake_clean.cmake
.PHONY : xpp/xpp_states/CMakeFiles/xpp_states.dir/clean

xpp/xpp_states/CMakeFiles/xpp_states.dir/depend:
	cd /home/marios/catkin_ws/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/marios/catkin_ws/src /home/marios/catkin_ws/src/xpp/xpp_states /home/marios/catkin_ws/build /home/marios/catkin_ws/build/xpp/xpp_states /home/marios/catkin_ws/build/xpp/xpp_states/CMakeFiles/xpp_states.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : xpp/xpp_states/CMakeFiles/xpp_states.dir/depend

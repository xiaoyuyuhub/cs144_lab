# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.19

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Disable VCS-based implicit rules.
% : %,v


# Disable VCS-based implicit rules.
% : RCS/%


# Disable VCS-based implicit rules.
% : RCS/%,v


# Disable VCS-based implicit rules.
% : SCCS/s.%


# Disable VCS-based implicit rules.
% : s.%


.SUFFIXES: .hpux_make_needs_suffix_list


# Command-line flag to silence nested $(MAKE).
$(VERBOSE)MAKESILENT = -s

#Suppress display of executed commands.
$(VERBOSE).SILENT:

# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /home/xuyu/桌面/clion-2021.1.3/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /home/xuyu/桌面/clion-2021.1.3/bin/cmake/linux/bin/cmake -E rm -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/xuyu/桌面/TCP-Lab

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/xuyu/桌面/TCP-Lab/cmake-build-debug

# Include any dependencies generated for this target.
include apps/CMakeFiles/bouncer.dir/depend.make

# Include the progress variables for this target.
include apps/CMakeFiles/bouncer.dir/progress.make

# Include the compile flags for this target's objects.
include apps/CMakeFiles/bouncer.dir/flags.make

apps/CMakeFiles/bouncer.dir/bouncer.cc.o: apps/CMakeFiles/bouncer.dir/flags.make
apps/CMakeFiles/bouncer.dir/bouncer.cc.o: ../apps/bouncer.cc
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/xuyu/桌面/TCP-Lab/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object apps/CMakeFiles/bouncer.dir/bouncer.cc.o"
	cd /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/bouncer.dir/bouncer.cc.o -c /home/xuyu/桌面/TCP-Lab/apps/bouncer.cc

apps/CMakeFiles/bouncer.dir/bouncer.cc.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/bouncer.dir/bouncer.cc.i"
	cd /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /home/xuyu/桌面/TCP-Lab/apps/bouncer.cc > CMakeFiles/bouncer.dir/bouncer.cc.i

apps/CMakeFiles/bouncer.dir/bouncer.cc.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/bouncer.dir/bouncer.cc.s"
	cd /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps && /usr/bin/c++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /home/xuyu/桌面/TCP-Lab/apps/bouncer.cc -o CMakeFiles/bouncer.dir/bouncer.cc.s

# Object files for target bouncer
bouncer_OBJECTS = \
"CMakeFiles/bouncer.dir/bouncer.cc.o"

# External object files for target bouncer
bouncer_EXTERNAL_OBJECTS =

apps/bouncer: apps/CMakeFiles/bouncer.dir/bouncer.cc.o
apps/bouncer: apps/CMakeFiles/bouncer.dir/build.make
apps/bouncer: libsponge/libsponge.a
apps/bouncer: /usr/lib/x86_64-linux-gnu/libpthread.a
apps/bouncer: apps/CMakeFiles/bouncer.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/xuyu/桌面/TCP-Lab/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Linking CXX executable bouncer"
	cd /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/bouncer.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
apps/CMakeFiles/bouncer.dir/build: apps/bouncer

.PHONY : apps/CMakeFiles/bouncer.dir/build

apps/CMakeFiles/bouncer.dir/clean:
	cd /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps && $(CMAKE_COMMAND) -P CMakeFiles/bouncer.dir/cmake_clean.cmake
.PHONY : apps/CMakeFiles/bouncer.dir/clean

apps/CMakeFiles/bouncer.dir/depend:
	cd /home/xuyu/桌面/TCP-Lab/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/xuyu/桌面/TCP-Lab /home/xuyu/桌面/TCP-Lab/apps /home/xuyu/桌面/TCP-Lab/cmake-build-debug /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps /home/xuyu/桌面/TCP-Lab/cmake-build-debug/apps/CMakeFiles/bouncer.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : apps/CMakeFiles/bouncer.dir/depend


# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.14

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
CMAKE_COMMAND = /snap/clion/69/bin/cmake/linux/bin/cmake

# The command to remove a file.
RM = /snap/clion/69/bin/cmake/linux/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /home/vered/CLionProjects/MA4

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /home/vered/CLionProjects/MA4/cmake-build-debug

# Include any dependencies generated for this target.
include CMakeFiles/MA4.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/MA4.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/MA4.dir/flags.make

CMakeFiles/MA4.dir/threadPool.c.o: CMakeFiles/MA4.dir/flags.make
CMakeFiles/MA4.dir/threadPool.c.o: ../threadPool.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vered/CLionProjects/MA4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building C object CMakeFiles/MA4.dir/threadPool.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MA4.dir/threadPool.c.o   -c /home/vered/CLionProjects/MA4/threadPool.c

CMakeFiles/MA4.dir/threadPool.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MA4.dir/threadPool.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vered/CLionProjects/MA4/threadPool.c > CMakeFiles/MA4.dir/threadPool.c.i

CMakeFiles/MA4.dir/threadPool.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MA4.dir/threadPool.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vered/CLionProjects/MA4/threadPool.c -o CMakeFiles/MA4.dir/threadPool.c.s

CMakeFiles/MA4.dir/osqueue.c.o: CMakeFiles/MA4.dir/flags.make
CMakeFiles/MA4.dir/osqueue.c.o: ../osqueue.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vered/CLionProjects/MA4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building C object CMakeFiles/MA4.dir/osqueue.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MA4.dir/osqueue.c.o   -c /home/vered/CLionProjects/MA4/osqueue.c

CMakeFiles/MA4.dir/osqueue.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MA4.dir/osqueue.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vered/CLionProjects/MA4/osqueue.c > CMakeFiles/MA4.dir/osqueue.c.i

CMakeFiles/MA4.dir/osqueue.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MA4.dir/osqueue.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vered/CLionProjects/MA4/osqueue.c -o CMakeFiles/MA4.dir/osqueue.c.s

CMakeFiles/MA4.dir/test1.c.o: CMakeFiles/MA4.dir/flags.make
CMakeFiles/MA4.dir/test1.c.o: ../test1.c
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/home/vered/CLionProjects/MA4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building C object CMakeFiles/MA4.dir/test1.c.o"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -o CMakeFiles/MA4.dir/test1.c.o   -c /home/vered/CLionProjects/MA4/test1.c

CMakeFiles/MA4.dir/test1.c.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing C source to CMakeFiles/MA4.dir/test1.c.i"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -E /home/vered/CLionProjects/MA4/test1.c > CMakeFiles/MA4.dir/test1.c.i

CMakeFiles/MA4.dir/test1.c.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling C source to assembly CMakeFiles/MA4.dir/test1.c.s"
	/usr/bin/cc $(C_DEFINES) $(C_INCLUDES) $(C_FLAGS) -S /home/vered/CLionProjects/MA4/test1.c -o CMakeFiles/MA4.dir/test1.c.s

# Object files for target MA4
MA4_OBJECTS = \
"CMakeFiles/MA4.dir/threadPool.c.o" \
"CMakeFiles/MA4.dir/osqueue.c.o" \
"CMakeFiles/MA4.dir/test1.c.o"

# External object files for target MA4
MA4_EXTERNAL_OBJECTS =

MA4: CMakeFiles/MA4.dir/threadPool.c.o
MA4: CMakeFiles/MA4.dir/osqueue.c.o
MA4: CMakeFiles/MA4.dir/test1.c.o
MA4: CMakeFiles/MA4.dir/build.make
MA4: CMakeFiles/MA4.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/home/vered/CLionProjects/MA4/cmake-build-debug/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Linking C executable MA4"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/MA4.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/MA4.dir/build: MA4

.PHONY : CMakeFiles/MA4.dir/build

CMakeFiles/MA4.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/MA4.dir/cmake_clean.cmake
.PHONY : CMakeFiles/MA4.dir/clean

CMakeFiles/MA4.dir/depend:
	cd /home/vered/CLionProjects/MA4/cmake-build-debug && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /home/vered/CLionProjects/MA4 /home/vered/CLionProjects/MA4 /home/vered/CLionProjects/MA4/cmake-build-debug /home/vered/CLionProjects/MA4/cmake-build-debug /home/vered/CLionProjects/MA4/cmake-build-debug/CMakeFiles/MA4.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/MA4.dir/depend


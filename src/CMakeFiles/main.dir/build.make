# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 2.8

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

# The program to use to edit the cache.
CMAKE_EDIT_COMMAND = /usr/bin/ccmake

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /root/game_first

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /root/game_first

# Include any dependencies generated for this target.
include src/CMakeFiles/main.dir/depend.make

# Include the progress variables for this target.
include src/CMakeFiles/main.dir/progress.make

# Include the compile flags for this target's objects.
include src/CMakeFiles/main.dir/flags.make

src/CMakeFiles/main.dir/main.cpp.o: src/CMakeFiles/main.dir/flags.make
src/CMakeFiles/main.dir/main.cpp.o: src/main.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /root/game_first/CMakeFiles $(CMAKE_PROGRESS_1)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/main.dir/main.cpp.o"
	cd /root/game_first/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/main.cpp.o -c /root/game_first/src/main.cpp

src/CMakeFiles/main.dir/main.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/main.cpp.i"
	cd /root/game_first/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/game_first/src/main.cpp > CMakeFiles/main.dir/main.cpp.i

src/CMakeFiles/main.dir/main.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/main.cpp.s"
	cd /root/game_first/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/game_first/src/main.cpp -o CMakeFiles/main.dir/main.cpp.s

src/CMakeFiles/main.dir/main.cpp.o.requires:
.PHONY : src/CMakeFiles/main.dir/main.cpp.o.requires

src/CMakeFiles/main.dir/main.cpp.o.provides: src/CMakeFiles/main.dir/main.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/main.dir/build.make src/CMakeFiles/main.dir/main.cpp.o.provides.build
.PHONY : src/CMakeFiles/main.dir/main.cpp.o.provides

src/CMakeFiles/main.dir/main.cpp.o.provides.build: src/CMakeFiles/main.dir/main.cpp.o

src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o: src/CMakeFiles/main.dir/flags.make
src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o: src/Demo/Common/SimpleEvent.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /root/game_first/CMakeFiles $(CMAKE_PROGRESS_2)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o"
	cd /root/game_first/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o -c /root/game_first/src/Demo/Common/SimpleEvent.cpp

src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.i"
	cd /root/game_first/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/game_first/src/Demo/Common/SimpleEvent.cpp > CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.i

src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.s"
	cd /root/game_first/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/game_first/src/Demo/Common/SimpleEvent.cpp -o CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.s

src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.requires:
.PHONY : src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.requires

src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.provides: src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/main.dir/build.make src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.provides.build
.PHONY : src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.provides

src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.provides.build: src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o

src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o: src/CMakeFiles/main.dir/flags.make
src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o: src/Demo/TapQuoteAPI/Quote.cpp
	$(CMAKE_COMMAND) -E cmake_progress_report /root/game_first/CMakeFiles $(CMAKE_PROGRESS_3)
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Building CXX object src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o"
	cd /root/game_first/src && /usr/bin/c++   $(CXX_DEFINES) $(CXX_FLAGS) -o CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o -c /root/game_first/src/Demo/TapQuoteAPI/Quote.cpp

src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.i"
	cd /root/game_first/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -E /root/game_first/src/Demo/TapQuoteAPI/Quote.cpp > CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.i

src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.s"
	cd /root/game_first/src && /usr/bin/c++  $(CXX_DEFINES) $(CXX_FLAGS) -S /root/game_first/src/Demo/TapQuoteAPI/Quote.cpp -o CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.s

src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.requires:
.PHONY : src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.requires

src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.provides: src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.requires
	$(MAKE) -f src/CMakeFiles/main.dir/build.make src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.provides.build
.PHONY : src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.provides

src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.provides.build: src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o

# Object files for target main
main_OBJECTS = \
"CMakeFiles/main.dir/main.cpp.o" \
"CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o" \
"CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o"

# External object files for target main
main_EXTERNAL_OBJECTS =

bin/main: src/CMakeFiles/main.dir/main.cpp.o
bin/main: src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o
bin/main: src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o
bin/main: src/CMakeFiles/main.dir/build.make
bin/main: src/CMakeFiles/main.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --red --bold "Linking CXX executable ../bin/main"
	cd /root/game_first/src && $(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/main.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
src/CMakeFiles/main.dir/build: bin/main
.PHONY : src/CMakeFiles/main.dir/build

src/CMakeFiles/main.dir/requires: src/CMakeFiles/main.dir/main.cpp.o.requires
src/CMakeFiles/main.dir/requires: src/CMakeFiles/main.dir/Demo/Common/SimpleEvent.cpp.o.requires
src/CMakeFiles/main.dir/requires: src/CMakeFiles/main.dir/Demo/TapQuoteAPI/Quote.cpp.o.requires
.PHONY : src/CMakeFiles/main.dir/requires

src/CMakeFiles/main.dir/clean:
	cd /root/game_first/src && $(CMAKE_COMMAND) -P CMakeFiles/main.dir/cmake_clean.cmake
.PHONY : src/CMakeFiles/main.dir/clean

src/CMakeFiles/main.dir/depend:
	cd /root/game_first && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /root/game_first /root/game_first/src /root/game_first /root/game_first/src /root/game_first/src/CMakeFiles/main.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : src/CMakeFiles/main.dir/depend


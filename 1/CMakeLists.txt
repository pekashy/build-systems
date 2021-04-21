cmake_minimum_required(VERSION 3.20.1)
project(Task1Easy)

# Set global params
set(MAIN_SOURCE C/main.cpp)
set(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
include_directories(${PROJECT_SOURCE_DIR})
file(MAKE_DIRECTORY bin lib)
SET(EXECUTABLE_OUTPUT_PATH bin)
SET(LIBRARY_OUTPUT_PATH ${PROJECT_SOURCE_DIR}/lib)

# Configure 'B' Lib
add_subdirectory(B)
set_target_properties(B PROPERTIES LINKER_LANGUAGE CXX)

# Configure easy target
add_executable(task1easy ${MAIN_SOURCE})
target_link_libraries(task1easy B)
 
# Configure code generation in 'A'
add_custom_command( 
	OUTPUT A/index.h
	COMMAND python ${PROJECT_SOURCE_DIR}/A/preparing.py
	WORKING_DIRECTORY A
	COMMENT "Generating index.h..."
)
add_custom_target(
	generate_index_h
	DEPENDS A/index.h
)
add_dependencies(task1easy generate_index_h)

# HARD TARGET

# Setting Up GTest
enable_testing()
find_package(GTest REQUIRED)
include_directories(${GTest_SOURCE_DIR}/include ${GTest_SOURCE_DIR})

# Setting up hard target
add_executable(task1hard C/main_test.cpp C/tests.cpp)
add_dependencies(task1hard task1easy)
target_link_libraries(task1hard gtest gtest_main pthread B)
add_test( task1hard task1hard )
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

# Configure main target
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

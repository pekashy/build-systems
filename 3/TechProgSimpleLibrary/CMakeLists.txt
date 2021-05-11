cmake_minimum_required(VERSION 3.20.1)

set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR arm)
set(tools ${CMAKE_CURRENT_SOURCE_DIR}/gcc-linaro-7.5.0-2019.12-i686_arm-linux-gnueabihf)
set(CMAKE_C_COMPILER ${tools}/bin/arm-linux-gnueabihf-gcc)
set(CMAKE_CXX_COMPILER ${tools}/bin/arm-linux-gnueabihf-g++)
project(SimpleLibrary)
SET(CMAKE_INSTALL_RPATH_USE_LINK_PATH TRUE)
file(MAKE_DIRECTORY lib)
SET(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${PROJECT_SOURCE_DIR}/lib)
include_directories(include)

add_subdirectory(src)
add_executable(MainLib main_lib.cpp)
add_executable(Main main.cpp)

target_link_libraries(MainLib buffer)

install(TARGETS MainLib Main
        RUNTIME DESTINATION ${PROJECT_SOURCE_DIR}/bin
        PUBLIC_HEADER DESTINATION ${PROJECT_SOURCE_DIR}/include 
        )
install(DIRECTORY ${PROJECT_SOURCE_DIR}/sysroot-glibc-linaro-2.25-2019.12-armv8l-linux-gnueabihf/lib DESTINATION ${PROJECT_SOURCE_DIR})
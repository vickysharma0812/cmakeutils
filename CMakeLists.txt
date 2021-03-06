cmake_minimum_required(VERSION 3.14)
project(CMakeDemos
LANGUAGES C CXX Fortran
VERSION 1.7.1
DESCRIPTION "Demonstrate CMake usage"
HOMEPAGE_URL https://github.com/scivision/cmake-utils)
enable_testing()

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules/)

message(STATUS "CMake ${CMAKE_VERSION}")

add_subdirectory(autotools)
add_subdirectory(fetchContent)
add_subdirectory(externalProject)

add_subdirectory(zip)

add_subdirectory(mpi)
add_subdirectory(openmp)
add_subdirectory(opencl)

add_subdirectory(matlab)
add_subdirectory(octave)

add_subdirectory(system)

# demo target echo properties
include(echo_target_properties.cmake)
find_package(ZLIB)
if(ZLIB_FOUND)
  echo_target_properties(ZLIB::ZLIB)
endif()

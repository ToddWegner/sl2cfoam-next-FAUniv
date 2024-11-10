##################################################################
#
# sl2cfoam-next-FAUniv/CMakeList.txt, created 2.11.2024
#
##################################################################

CMAKE_MINIMUM_REQUIRED(VERSION 3.17.5)

set(CMAKE_C_STANDARD 23)
PROJECT(tools C)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wpedantic")

# for shared libraries
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/libs")

# for static libraries
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY "${CMAKE_BINARY_DIR}/libs")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY  "${CMAKE_BINARY_DIR}/bin")

add_subdirectory(src/wigxjpf-1.13)
add_subdirectory(src/fastwigxj-1.4.1)
add_subdirectory(src)
add_subdirectory(tools)
add_subdirectory(test)



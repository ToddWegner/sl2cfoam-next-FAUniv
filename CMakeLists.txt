##################################################################
#
# sl2cfoam-next-FAUniv/CMakeList.txt, created 2.11.2024
#
##################################################################

CMAKE_MINIMUM_REQUIRED(VERSION 3.17.5)

set(CMAKE_C_STANDARD 11)
PROJECT(tools C)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wpedantic")

#add_subdirectory(src/wigxjpf-1.13)
add_subdirectory(src)
add_subdirectory(tools)
add_subdirectory(test)



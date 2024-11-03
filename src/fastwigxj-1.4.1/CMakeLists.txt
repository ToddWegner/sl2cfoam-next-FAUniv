##################################################################
#
# sl2cfoam-next-FAUniv/src/fastwigxj-1.4.1/CMakeList.txt, created 2.11.2024
# 
##################################################################

CMAKE_MINIMUM_REQUIRED(VERSION 3.17.5)

set(CMAKE_C_STANDARD 23)
PROJECT(fastwigxj C)

set(CMAKE_C_FLAGS "${CMAKE_C_FLAGS} -Wall -Wextra -Wpedantic")

add_subdirectory(src)



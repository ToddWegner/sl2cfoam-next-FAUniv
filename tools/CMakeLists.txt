##################################################################
#
# sl2cfoam-next-FAUniv/tools/CMakeList.txt, created 2.11.2024
#
##################################################################

CMAKE_MINIMUM_REQUIRED(VERSION 3.17.5)

set(CMAKE_C_STANDARD 11)
PROJECT(tools C)

##################################################################
#
# vertex-fulltensor
#
##################################################################
add_executable(vertex-fulltensor vertex-fulltensor.c)
target_include_directories(vertex-fulltensor PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../src)
                                                     
target_link_directories(vertex-fulltensor PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(vertex-fulltensor -fopenmp sl2cfoam )

##################################################################
#
# vertex-amplitude
#
##################################################################
add_executable(vertex-amplitude vertex-amplitude.c)
target_include_directories(vertex-amplitude PRIVATE ${CMAKE_SOURCE_DIR}/src)

target_link_directories(vertex-amplitude PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(vertex-amplitude -fopenmp sl2cfoam )

##################################################################
#
# sl2cfoam-next-FAUniv/test/CMakeList.txt, created 2.11.2024
#
##################################################################

CMAKE_MINIMUM_REQUIRED(VERSION 3.17.5)

set(CMAKE_C_STANDARD 11)
PROJECT(test C)

##################################################################
#
# b4_test
#
##################################################################
add_executable(b4_test b4_test.c)
target_include_directories(b4_test PUBLIC  ${CMAKE_SOURCE_DIR}/inc
                                   PRIVATE ${CMAKE_SOURCE_DIR}/src)
                                                     
target_link_directories(b4_test PRIVATE ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/lib
                                        ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/lib)
                                                  
target_link_libraries(b4_test -fopenmp sl2cfoam )

##################################################################
#
# dsmall_test
#
##################################################################
add_executable(dsmall_test dsmall_test.c)
target_include_directories(dsmall_test PUBLIC  ${CMAKE_SOURCE_DIR}/inc
                                       PRIVATE ${CMAKE_SOURCE_DIR}/src)
                                                     
target_link_directories(dsmall_test PRIVATE ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/lib
                                            ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/lib)
                                                  
target_link_libraries(dsmall_test -fopenmp sl2cfoam )

##################################################################
#
# lib_test
#
##################################################################
add_executable(lib_test lib_test.c)
target_include_directories(lib_test PUBLIC  ${CMAKE_SOURCE_DIR}/inc
                                    PRIVATE ${CMAKE_SOURCE_DIR}/src)
                                                     
target_link_directories(lib_test PRIVATE ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/lib
                                         ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/lib)
                                                  
target_link_libraries(lib_test -fopenmp sl2cfoam )

##################################################################
#
# integration_test
#
##################################################################
add_executable(integration_test integration_test.c)
target_include_directories(integration_test PUBLIC  ${CMAKE_SOURCE_DIR}/inc
                                            PRIVATE ${CMAKE_SOURCE_DIR}/src)
                                                     
target_link_directories(integration_test PRIVATE ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/lib
                                                 ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/lib)
                                                  
target_link_libraries(integration_test -fopenmp sl2cfoam )

##################################################################
#
# tensor_test
#
##################################################################
add_executable(tensor_test tensor_test.c)
target_include_directories(tensor_test PUBLIC  ${CMAKE_SOURCE_DIR}/inc
                                       PRIVATE ${CMAKE_SOURCE_DIR}/src)
                                                     
target_link_directories(tensor_test PRIVATE ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/lib
                                            ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/lib)
                                                  
target_link_libraries(tensor_test -fopenmp sl2cfoam )



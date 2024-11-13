##################################################################
#
# sl2cfoam-next-FAUniv/src/CMakeList.txt, created 2.11.2024
#
##################################################################

cmake_minimum_required(VERSION 3.28.1)

project(sl2cfoam)
set(CMAKE_C_STANDARD 11)

option(ENABLE_MPI "Enable MPI" OFF)

set (SL2CFOAM_HEADERS
blas_wrapper.h
boosters.h
cgamma.h
common.h
config.h
dbg.h
dsmall.h
error.h
integration_gk.h
integration_qagp.h
jsymbols.h
mpi_utils.h
timing.h
utils.h
verb.h)

set (SL2CFOAM_SRC
b4.c
b4_qagp.c
boosters.c
cgamma.c
coherentstates.c
dsmall.c
integration_gk.c
integration_qagp.c
setup.c
sl2cfoam.c
vertex_bf.c
vertex.c)

add_library(sl2cfoam SHARED ${SL2CFOAM_HEADERS} ${SL2CFOAM_SRC} )
target_compile_options(sl2cfoam PRIVATE -DUSE_OMP -DUSE_SYSBLAS)

if(ENABLE_MPI)
    target_compile_options(sl2cfoam PRIVATE -DUSE_MPI)
endif()

target_include_directories(sl2cfoam PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                             PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/wigxjpf-1.13/inc
                                                                             ${CMAKE_CURRENT_SOURCE_DIR}/fastwigxj-1.4.1/inc )
                                            
target_link_directories(sl2cfoam  PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(sl2cfoam -lopenblas -lblas -lpthread)
target_link_libraries(sl2cfoam -lmpc -lmpfr -lgmp -lquadmath -lfastwigxj -lwigxjpf -lwigxjpf_quadmath -lm -fopenmp)

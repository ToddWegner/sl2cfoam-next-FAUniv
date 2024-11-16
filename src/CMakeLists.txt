##################################################################
#
# sl2cfoam-next-FAUniv/src/CMakeList.txt, created 2.11.2024
#
##################################################################

cmake_minimum_required(VERSION 3.28.1)

project(sl2cfoam)
set(CMAKE_C_STANDARD 11)

option(ENABLE_MPI "Enable MPI" OFF)
option(ENABLE_OMP "Enable OMP" ON)
option(ENABLE_SYS_BLAS "Use system BLAS" ON)

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

set (SL2FOAM_LIBRARIES -lopenblas -lblas -lpthread -lmpc -lmpfr
                                             -lgmp -lquadmath -lfastwigxj -lwigxjpf
                                             -lwigxjpf_quadmath -lm -fopenmp)

##################################################################
#
# build shared sl2cfoam library
#
##################################################################

add_library(sl2cfoam SHARED ${SL2CFOAM_HEADERS} ${SL2CFOAM_SRC} )
add_dependencies (sl2cfoam fastwigxj  wigxjpf_quadmath)

if(ENABLE_MPI)
    target_compile_options(sl2cfoam PRIVATE -DUSE_MPI=1)
endif()

if(ENABLE_OMP)
    target_compile_options(sl2cfoam PRIVATE -DUSE_OMPI=1)
endif()

if(ENABLE_SYS_BLAS)
    target_compile_options(sl2cfoam PRIVATE -DUSE_SYSBLAS=1)
endif()

target_include_directories(sl2cfoam PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                             PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/wigxjpf-1.13/inc
                                                                             ${CMAKE_CURRENT_SOURCE_DIR}/fastwigxj-1.4.1/inc)
                                            
target_link_directories(sl2cfoam  PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(sl2cfoam ${SL2FOAM_LIBRARIES})


##################################################################
#
# build static sl2cfoam library
#
##################################################################

add_library(sl2cfoam_static STATIC ${SL2CFOAM_HEADERS} ${SL2CFOAM_SRC} )
add_dependencies (sl2cfoam_static fastwigxj  wigxjpf_quadmath)

if(ENABLE_MPI)
    target_compile_options(sl2cfoam_static PRIVATE -DUSE_MPI=1)
endif()

if(ENABLE_OMP)
    target_compile_options(sl2cfoam_static PRIVATE -DUSE_OMPI=1)
endif()

if(ENABLE_SYS_BLAS)
    target_compile_options(sl2cfoam_static PRIVATE -DUSE_SYSBLAS=1)
endif()

target_include_directories(sl2cfoam_static PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/../inc
        PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/wigxjpf-1.13/inc
        ${CMAKE_CURRENT_SOURCE_DIR}/fastwigxj-1.4.1/inc)

target_link_directories(sl2cfoam_static  PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(sl2cfoam_static ${SL2FOAM_LIBRARIES})

##################################################################
#
# sl2cfoam-next-FAUniv/src/fastwigxj-1.4.1/src/CMakeList.txt, created 2.11.2024
#
##################################################################

cmake_minimum_required(VERSION 3.28.1)

project(fastwigxj)
set(CMAKE_C_STANDARD 23)

#[===[
combine_js.cc
fastwigxj_cc.cc
gen_3j.cc
gen_9j.cc
gen_buf.cc
gen_header.cc
hash_js.cc
info_js.cc
unique_js.cc
]===]

set (FASTWIGXJ_HEADERS
canonicalise_inc.h
fastwigxj_header.h
sort_deduplicate.h
tkloop.h
triple_mul.h
wigner36j_regge_canonicalize.h
wigner6j_regge_canonicalize_inc.h)

set (FASTWIGXJ_SRC
canonicalise.c
fastwigxj.c
fortran_wrap.c
test_cc_dbl.c
wigner3j_regge_canonicalize.c
wigner6j_regge_canonicalize.c
wigner9j_canonicalize.c)

add_library(fastwigxj SHARED ${FASTWIGXJ_HEADERS} ${FASTWIGXJ_SRC} )
target_compile_options(fastwigxj PRIVATE -O3 -fPIC -g -Wall -Wextra -Wconversion -Wcast-qual -Wno-shadow)

target_include_directories(fastwigxj PUBLIC  ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/inc
                                     PRIVATE ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/cfg
                                             ${CMAKE_SOURCE_DIR}/src/fastwigxj-1.4.1/gen
                                             ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/inc)                                            
                                     
target_link_directories(fastwigxj PRIVATE ${CMAKE_SOURCE_DIR}/src/wigxjpf-1.13/lib)

target_link_libraries(fastwigxj -lwigxjpf -lwigxjpf_quadmath -lm )

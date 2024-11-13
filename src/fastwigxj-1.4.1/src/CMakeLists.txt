##################################################################
#
# sl2cfoam-next-FAUniv/src/fastwigxj-1.4.1/src/CMakeList.txt, created 2.11.2024
#
##################################################################

cmake_minimum_required(VERSION 3.28.1)

project(fastwigxj)
set(CMAKE_C_STANDARD 23)

# Set configuration options
option(FASTWIGXJ_USE_LONG_DOUBLE "Use long double" ON)
option(FASTWIGXJ_USE_FLOAT128 "Use __float128" OFF)
option(FASTWIGXJ_HAVE_THREAD "Have thread support" ON)
option(FASTWIGXJ_HAVE_SSE4_1 "Have SSE4.1 support" ON)
option(FASTWIGXJ_HAVE_AVX2 "Have AVX2 support" ON)

# Configure the header file
configure_file( ${CMAKE_CURRENT_SOURCE_DIR}/../cfg/fastwigxj_auto_config.h.in
                         ${CMAKE_CURRENT_SOURCE_DIR}/../cfg/fastwigxj_auto_config.h)

##################################################################
#
#                fastwigxj
#
##################################################################

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
)

add_library(fastwigxj SHARED ${FASTWIGXJ_HEADERS} ${FASTWIGXJ_SRC} )
target_compile_options(fastwigxj PRIVATE -O3 -fPIC -g -Wall -Wextra -Wconversion -Wcast-qual -Wno-shadow)
target_include_directories(fastwigxj PUBLIC   ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                             PRIVATE  ${CMAKE_CURRENT_SOURCE_DIR}/../cfg
                                                                              ${CMAKE_CURRENT_SOURCE_DIR}/../gen
                                                                              ${CMAKE_CURRENT_SOURCE_DIR}/../../wigxjpf-1.13/inc)
                                     
target_link_directories(fastwigxj PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(fastwigxj -lwigxjpf -lwigxjpf_quadmath -lm )


##################################################################
#
#                combine_js.cc
#
##################################################################

add_executable(combine_js combine_js.cc
                             gen_header.hh gen_header.cc)

target_link_directories(combine_js PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(combine_js fastwigxj)

##################################################################
#
#                fastwigxj_cc.cc
#
##################################################################

add_executable(fastwigxj_cc fastwigxj_cc.cc
                            gen_header.hh gen_header.cc)
target_include_directories(fastwigxj_cc PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                                   PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../cfg
                                                                                   ${CMAKE_CURRENT_SOURCE_DIR}/../gen)

target_link_directories(fastwigxj_cc PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(fastwigxj_cc fastwigxj quadmath)

##################################################################
#
#                gen_3j.cc
#
##################################################################

add_executable(gen_3j gen_3j.cc
        gen_header.hh gen_header.cc
        gen_buf.hh gen_buf.cc)

target_include_directories(gen_3j PUBLIC   ${CMAKE_CURRENT_SOURCE_DIR}/../inc )
target_link_directories(gen_3j       PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(gen_3j fastwigxj quadmath)

##################################################################
#
#                gen_9j.cc
#
##################################################################
add_executable(gen_9j gen_9j.cc
        gen_header.hh gen_header.cc
        gen_buf.hh gen_buf.cc)

target_compile_options(gen_9j PRIVATE -Wall -Wextra -O2 -mavx2  -fPIC -g)

target_include_directories(gen_9j PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                         PRIVATE ${CMAKE_CURRENT_SOURCE_DIR}/../cfg
                                                                         ${CMAKE_CURRENT_SOURCE_DIR}/../gen)
target_link_directories(gen_9j PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(gen_9j fastwigxj quadmath)

##################################################################
#
#       hash_js.cc
#
##################################################################
add_executable(hash_js hash_js.cc
                             gen_header.hh gen_header.cc
                             gen_buf.hh gen_buf.cc)

target_include_directories(hash_js PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                            PRIVATE  ${CMAKE_CURRENT_SOURCE_DIR}/../cfg
                                                                             ${CMAKE_CURRENT_SOURCE_DIR}/../gen
                                                                             ${CMAKE_CURRENT_SOURCE_DIR}/../../wigxjpf-1.13/inc)

target_link_directories(hash_js PRIVATE  ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(hash_js fastwigxj quadmath)

##################################################################
#
#       info_js.cc
#
##################################################################
add_executable(info_js info_js.cc fastwigxj_cc.cc)

target_include_directories(info_js PUBLIC  ${CMAKE_CURRENT_SOURCE_DIR}/../inc
                                                          PRIVATE  ${CMAKE_CURRENT_SOURCE_DIR}/../cfg
                                                                           ${CMAKE_CURRENT_SOURCE_DIR}/../gen)

target_link_directories(info_js PRIVATE ${CMAKE_BINARY_DIR}/libs)
target_link_libraries(info_js fastwigxj quadmath)

##################################################################
#
#       unique_js.cc
#
##################################################################
add_executable(unique_js unique_js.cc
               gen_header.hh gen_header.cc)

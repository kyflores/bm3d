add_library(ffht)

set (FFHT_INCLUDE {CMAKE_CURRENT_SOURCE_DIR})

target_include_directories(ffht
    PRIVATE
    ${FFHT_INCLUDE}
)
target_sources(ffht
    PRIVATE
    ${CMAKE_CURRENT_SOURCE_DIR}/fast_copy.c
    ${CMAKE_CURRENT_SOURCE_DIR}/fht_avx.c
    ${CMAKE_CURRENT_SOURCE_DIR}/fht.c
)
target_compile_options(ffht
    PRIVATE
    "-Wall"
    "-march=native"
    "-g"
    "-O3"
    "--std=c99"
)
target_compile_definitions(ffht
    PRIVATE
    __AVX__
)
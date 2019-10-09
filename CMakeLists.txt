cmake_minimum_required(VERSION 3.14)
project(da3d)

find_package (TIFF REQUIRED)
find_package (JPEG REQUIRED)
find_package (PNG REQUIRED)
find_package (OpenMP)

set (APP_SOURCES
    ${CMAKE_SOURCE_DIR}/bm3d.cpp
    ${CMAKE_SOURCE_DIR}/iio.c
    ${CMAKE_SOURCE_DIR}/lib_transforms.cpp
    ${CMAKE_SOURCE_DIR}/main.cpp
    ${CMAKE_SOURCE_DIR}/utilities.cpp
)

set (APP_INCLUDES
    ${CMAKE_SOURCE_DIR}
)

set (LIB_INCLUDES
    ${TIFF_INCLUDE_DIR}
    ${JPEG_INCLUDE_DIR}
    ${PNG_INCLUDE_DIR}
)

# FFHT subproject
add_subdirectory(FFHT)

# Main Application Target
add_executable(bm3d)
target_include_directories(bm3d PRIVATE
    ${APP_INCLUDES}
    ${LIB_INCLUDES}
)
target_sources(bm3d PRIVATE
    ${APP_SOURCES}
)
target_link_libraries(bm3d PRIVATE
    ${TIFF_LIBRARIES}
    ${JPEG_LIBRARIES}
    ${PNG_LIBRARIES}
    ${OpenMP_CXX_LIBRARIES}
    fftw3f
)
target_compile_options(bm3d PRIVATE
    "-Wall"
    "-march=native"
    "-g"
)
if(OPENMP_FOUND)
    target_compile_options(bm3d PRIVATE
        ${OpenMP_CXX_FLAGS}
    )
endif()

target_link_libraries(bm3d PRIVATE
    ffht
)

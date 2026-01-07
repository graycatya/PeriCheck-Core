include(ExternalProject)

set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS ON CACHE BOOL "Suppress CMake developer warnings" FORCE)

ExternalProject_Add(
    libdeflate_external
    URL ${3RDPARTY_ZIP_PATH}/libdeflate-1.25.zip
    SOURCE_DIR ${CMAKE_BINARY_DIR}/libdeflate-src
    BINARY_DIR ${CMAKE_BINARY_DIR}/libdeflate-build
    INSTALL_DIR ${PERICHECK_INSTALL_DIR}
 
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    UPDATE_COMMAND    ""
 
    LOG_DOWNLOAD      ON
    LOG_CONFIGURE     ON
    LOG_BUILD         ON
    LOG_INSTALL       ON
)
set(LIBDEFLATE_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(LIBDEFLATE_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/deflatestatic.lib)
else()
    set(LIBDEFLATE_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/deflatestatic.a)
endif()

add_subdirectory(${CMAKE_SOURCE_DIR}/buildscripts/libdeflate_Interface)

include(ExternalProject)

set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS ON CACHE BOOL "Suppress CMake developer warnings" FORCE)
ExternalProject_Add(
    libuv_external

    # GIT_REPOSITORY    https://github.com/libuv/libuv.git
    # GIT_TAG           v1.x  
    # GIT_SHALLOW       TRUE
    URL               ${3RDPARTY_ZIP_PATH}/libuv-1.x.zip
    SOURCE_DIR        ${CMAKE_BINARY_DIR}/libuv-src
    BINARY_DIR        ${CMAKE_BINARY_DIR}/libuv-build
    INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DLIBUV_BUILD_TESTS=OFF 

    BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    
    UPDATE_COMMAND    ""
    
    LOG_DOWNLOAD      ON
    LOG_CONFIGURE     ON
    LOG_BUILD         ON
    LOG_INSTALL       ON

)


set(LIBUV_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(LIBUV_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uv.lib)
else()
    set(LIBUV_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uv.a)
endif()

add_subdirectory(${CMAKE_SOURCE_DIR}/buildscripts/libuv_Interface)

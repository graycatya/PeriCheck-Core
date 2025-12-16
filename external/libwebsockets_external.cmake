include(ExternalProject)

message("MBEDTLS_LIBRARY: ${MBEDTLS_LIBRARY}")
ExternalProject_Add(
    libwebsockets_external

    GIT_REPOSITORY    https://github.com/warmcat/libwebsockets.git
    GIT_TAG           main
    GIT_SHALLOW       TRUE
    
    SOURCE_DIR        ${CMAKE_BINARY_DIR}/libwebsockets-src
    BINARY_DIR        ${CMAKE_BINARY_DIR}/libwebsockets-build
    INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DLWS_WITH_LWSWS=1 
        -DLWS_WITH_MBEDTLS=1 
        -DLWS_MBEDTLS_LIBRARIES=${MBEDTLS_LIBRARY}
        -DLWS_MBEDTLS_INCLUDE_DIRS=${MBEDTLS_INCLUDE_DIR}
        -DLWS_LIBUV_LIBRARIES=${LIBUV_LIBRARY}
        -DLWS_LIBUV_INCLUDE_DIRS=${LIBUV_INCLUDE_DIR}
        
    BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    
    UPDATE_COMMAND    ""
    
    LOG_DOWNLOAD      ON
    LOG_CONFIGURE     ON
    LOG_BUILD         ON
    LOG_INSTALL       ON
)


set(LIBWEBSOCKETS_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(LIBWEBSOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/libwebsockets.lib) 
else()
    set(LIBWEBSOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/libwebsockets.a)   
endif()
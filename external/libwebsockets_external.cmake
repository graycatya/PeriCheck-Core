include(ExternalProject)
message("LWS_MBEDTLS_LIBRARIES: ${MBEDTLS_LIBRARY}")
message("LWS_MBEDTLS_INCLUDE_DIRS: ${MBEDTLS_INCLUDE_DIR}")
message("LWS_LIBUV_LIBRARIES: ${LIBUV_LIBRARY}")
message("LWS_LIBUV_INCLUDE_DIRS: ${LIBUV_INCLUDE_DIR}")

if(MSVC)
    # 移除所有目标的/WX
    string(REGEX REPLACE "/WX" "" CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS}")
    string(REGEX REPLACE "/WX" "" CMAKE_C_FLAGS "${CMAKE_C_FLAGS}")
    # 针对MSVC的Debug/Release等配置，也移除/WX
    foreach(config IN LISTS CMAKE_CONFIGURATION_TYPES)
        string(TOUPPER "${config}" config_u)
        string(REGEX REPLACE "/WX" "" CMAKE_CXX_FLAGS_${config_u} "${CMAKE_CXX_FLAGS_${config_u}}")
        string(REGEX REPLACE "/WX" "" CMAKE_C_FLAGS_${config_u} "${CMAKE_C_FLAGS_${config_u}}")
    endforeach()
endif()
ExternalProject_Add(
    libwebsockets_external

    # GIT_REPOSITORY    https://github.com/warmcat/libwebsockets.git
    # GIT_TAG           main
    # GIT_SHALLOW       TRUE
    URL               ${3RDPARTY_ZIP_PATH}/libwebsockets-4.5.2.zip
    SOURCE_DIR        ${CMAKE_BINARY_DIR}/libwebsockets-src
    BINARY_DIR        ${CMAKE_BINARY_DIR}/libwebsockets-build
    INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    DEPENDS libuv_external
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DLWS_WITH_SHARED=OFF
        # -DLWS_WITH_MBEDTLS=1
        #-DLWS_WITH_HTTP2=1
        #-DLWS_WITH_LWSWS=1
        # -DLWS_WITH_MINIMAL_EXAMPLES=1
        # -DLWS_MBEDTLS_LIBRARIES=${MBEDTLS_LIBRARY}
        # -DLWS_MBEDTLS_INCLUDE_DIRS=${MBEDTLS_INCLUDE_DIR}
        -DLWS_WITH_SSL=OFF
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

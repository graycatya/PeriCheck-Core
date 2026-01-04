include(ExternalProject)
message("uSockets: " ${CMAKE_SOURCE_DIR})
# ExternalProject_Add(
#     uSockets_unpack
#     URL ${3RDPARTY_ZIP_PATH}/uSockets-0.8.8.zip
#     SOURCE_DIR ${CMAKE_BINARY_DIR}/uSockets-src
#     CONFIGURE_COMMAND ""
#     BUILD_COMMAND ""
#     INSTALL_COMMAND ""
#     UPDATE_COMMAND ""
#     LOG_DOWNLOAD ON
#     PATCH_COMMAND
#         # 拷贝单个文件
#         COMMAND ${CMAKE_COMMAND} -E copy
#             ${CMAKE_SOURCE_DIR}/buildscripts/uSockets/CMakeLists.txt
#             ${CMAKE_BINARY_DIR}/uSockets-src/CMakeLists.txt
# )


# ExternalProject_Add(
#     uSockets_external
#     SOURCE_DIR        ${CMAKE_BINARY_DIR}/uSockets-src
#     BINARY_DIR        ${CMAKE_BINARY_DIR}/uSockets-build
#     INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    
#     CMAKE_ARGS
#         -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
#         -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
#         -DUSE_LIBUV=ON
#         -DLIBUV_LIBRARIES=${LIBUV_LIBRARY}
#         -DLIBUV_INCLUDE_DIRS=${LIBUV_INCLUDE_DIR}
#         -DUSE_OPENSSL=ON
#         -DOPENSSL_INCLUDE_DIRS=${OPENSSL_INCLUDE_DIR}
#         -DOPENSSL_SSL_LIBRARIES=${OPENSSL_SSL_LIBRARIES}
#         -DOPENSSL_CRYPTO_LIBRARIES=${OPENSSL_CRYPTO_LIBRARIES}

#     BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    
#     UPDATE_COMMAND    ""
#     DEPENDS libuv_external openssl_external uSockets_unpack
#     LOG_DOWNLOAD      ON
#     LOG_CONFIGURE     ON
#     LOG_BUILD         ON
#     LOG_INSTALL       ON
# )
ExternalProject_Add(
    uSockets_external
    URL ${3RDPARTY_ZIP_PATH}/uSockets-0.8.8.zip
    SOURCE_DIR ${CMAKE_BINARY_DIR}/uSockets-src
    BINARY_DIR ${CMAKE_BINARY_DIR}/uSockets-build
    INSTALL_DIR ${PERICHECK_INSTALL_DIR}

    PATCH_COMMAND
        COMMAND ${CMAKE_COMMAND} -E copy
            ${CMAKE_SOURCE_DIR}/buildscripts/uSockets/CMakeLists.txt
            ${CMAKE_BINARY_DIR}/uSockets-src/CMakeLists.txt
 
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DUSE_LIBUV=ON
        -DLIBUV_LIBRARIES=${LIBUV_LIBRARY}
        -DLIBUV_INCLUDE_DIRS=${LIBUV_INCLUDE_DIR}
        -DUSE_OPENSSL=ON
        -DOPENSSL_INCLUDE_DIRS=${OPENSSL_INCLUDE_DIR}
        -DOPENSSL_SSL_LIBRARIES=${OPENSSL_SSL_LIBRARIES}
        -DOPENSSL_CRYPTO_LIBRARIES=${OPENSSL_CRYPTO_LIBRARIES}
    BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    UPDATE_COMMAND    ""
    DEPENDS libuv_external openssl_external  
    LOG_DOWNLOAD      ON
    LOG_CONFIGURE     ON
    LOG_BUILD         ON
    LOG_INSTALL       ON
)
set(USOCKETS_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(USOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uSockets.lib)
else()
    set(USOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uSockets.a)
endif()

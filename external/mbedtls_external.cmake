include(ExternalProject)

ExternalProject_Add(
    mbedtls_unpack
    URL ${3RDPARTY_ZIP_PATH}/mbedtls-mbedtls-3.6.5.zip
    SOURCE_DIR ${CMAKE_BINARY_DIR}/mbedtls-src
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    UPDATE_COMMAND ""
    LOG_DOWNLOAD ON
)

ExternalProject_Add(
    mbedtls_framework_unpack
    URL ${3RDPARTY_ZIP_PATH}/mbedtls-framework-875ec308e7ff34610075507b7216172ce8eb0785.zip         
    SOURCE_DIR ${CMAKE_BINARY_DIR}/mbedtls-src/framework
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    UPDATE_COMMAND ""
    DEPENDS mbedtls_unpack
    LOG_DOWNLOAD ON
)

ExternalProject_Add(
    mbedtls_external

    # GIT_REPOSITORY    https://github.com/Mbed-TLS/mbedtls.git
    # GIT_TAG           mbedtls-3.6.5
    # GIT_SHALLOW       TRUE
    # URL               ${3RDPARTY_ZIP_PATH}/mbedtls-mbedtls-3.6.5.zip
    SOURCE_DIR        ${CMAKE_BINARY_DIR}/mbedtls-src
    BINARY_DIR        ${CMAKE_BINARY_DIR}/mbedtls-build
    INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DMBEDTLS_BUILD_TESTS=OFF 
        
    BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    
    UPDATE_COMMAND    ""
    DEPENDS mbedtls_unpack mbedtls_framework_unpack
    LOG_DOWNLOAD      ON
    LOG_CONFIGURE     ON
    LOG_BUILD         ON
    LOG_INSTALL       ON
)


set(MBEDTLS_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(MBEDTLS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/mbedtls.lib
                        ${PERICHECK_INSTALL_DIR}/lib/mbedcrypto.lib
                        ${PERICHECK_INSTALL_DIR}/lib/mbedx509.lib
                        ${PERICHECK_INSTALL_DIR}/lib/p256m.lib) 
else()
    set(MBEDTLS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/mbedtls.a
                        ${PERICHECK_INSTALL_DIR}/lib/mbedcrypto.a
                        ${PERICHECK_INSTALL_DIR}/lib/mbedx509.a
                        ${PERICHECK_INSTALL_DIR}/lib/p256m.a)   
endif()

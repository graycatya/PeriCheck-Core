include(ExternalProject)

set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS ON CACHE BOOL "Suppress CMake developer warnings" FORCE)
ExternalProject_Add(
    openssl_external


    URL               ${3RDPARTY_ZIP_PATH}/openssl-cmake-1.1.1w-20250419.zip
    SOURCE_DIR        ${CMAKE_BINARY_DIR}/openssl-src
    BINARY_DIR        ${CMAKE_BINARY_DIR}/openssl-build
    INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    
    CMAKE_ARGS
        -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
        -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
        -DOPENSSL_BUILD_TESTS=OFF 

    BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    
    UPDATE_COMMAND    ""
    
    LOG_DOWNLOAD      ON
    LOG_CONFIGURE     ON
    LOG_BUILD         ON
    LOG_INSTALL       ON

)



set(OPENSSL_ROOT_DIR ${PERICHECK_INSTALL_DIR})
set(OPENSSL_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    if (CMAKE_SIZEOF_VOID_P EQUAL 8)

        set(OPENSSL_CRYPTO_LIBRARIES "${PERICHECK_INSTALL_DIR}/lib/libcrypto-1_1-x64.lib")
        set(OPENSSL_SSL_LIBRARIES "${PERICHECK_INSTALL_DIR}/lib/libssl-1_1-x64.lib")
    elseif (CMAKE_SIZEOF_VOID_P EQUAL 4)

        set(OPENSSL_CRYPTO_LIBRARIES "${PERICHECK_INSTALL_DIR}/lib/libcrypto-1_1-x32.lib")
        set(OPENSSL_SSL_LIBRARIES "${PERICHECK_INSTALL_DIR}/lib/libssl-1_1-x32.lib")
    endif()

else()
    set(OPENSSL_CRYPTO_LIBRARIES "${PERICHECK_INSTALL_DIR}/lib/libcrypto-1_1.a")  
    set(OPENSSL_SSL_LIBRARIES "${PERICHECK_INSTALL_DIR}/lib/libssl-1_1.a")
endif()


#add_subdirectory(${CMAKE_SOURCE_DIR}/buildscripts/openssl_Interface)

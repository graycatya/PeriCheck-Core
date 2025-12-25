include(ExternalProject)


ExternalProject_Add(
    uSockets_external


    URL               ${3RDPARTY_ZIP_PATH}/uSockets-0.8.8.zip
    SOURCE_DIR        ${CMAKE_BINARY_DIR}/uSockets-src
    BINARY_DIR        ${CMAKE_BINARY_DIR}/uSockets-build
    INSTALL_DIR       ${PERICHECK_INSTALL_DIR}
    
    # CMAKE_ARGS
    #     -DCMAKE_INSTALL_PREFIX=${PERICHECK_INSTALL_DIR}
    #     -DCMAKE_BUILD_TYPE=${CMAKE_BUILD_TYPE}
    #     -DLIBUV_BUILD_TESTS=OFF 
        
    # BUILD_COMMAND     ${CMAKE_COMMAND} --build <BINARY_DIR> --config ${CMAKE_BUILD_TYPE}
    
    # UPDATE_COMMAND    ""
    
    # LOG_DOWNLOAD      ON
    # LOG_CONFIGURE     ON
    # LOG_BUILD         ON
    # LOG_INSTALL       ON
)


set(USOCKETS_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(USOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uv.lib)
else()
    set(USOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uv.a)
endif()

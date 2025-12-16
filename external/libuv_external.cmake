include(ExternalProject)


ExternalProject_Add(
    libuv_external

    GIT_REPOSITORY    https://github.com/libuv/libuv.git
    GIT_TAG           v1.x  
    GIT_SHALLOW       TRUE
    
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
    set(LIBUV_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/libuv.lib) 
else()
    set(LIBUV_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/libuv.a)   
endif()
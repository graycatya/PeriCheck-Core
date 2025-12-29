include(ExternalProject)

ExternalProject_Add(
    uSockets_unpack
    URL ${3RDPARTY_ZIP_PATH}/uSockets-0.8.8.zip
    SOURCE_DIR ${CMAKE_BINARY_DIR}/uSockets-src
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    UPDATE_COMMAND ""
    LOG_DOWNLOAD ON
)



set(USOCKETS_INCLUDE_DIR ${PERICHECK_INSTALL_DIR}/include)

if(WIN32)
    set(USOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uv.lib)
else()
    set(USOCKETS_LIBRARY ${PERICHECK_INSTALL_DIR}/lib/uv.a)
endif()

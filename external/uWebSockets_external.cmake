include(ExternalProject)

set(CMAKE_SUPPRESS_DEVELOPER_WARNINGS ON CACHE BOOL "Suppress CMake developer warnings" FORCE)
ExternalProject_Add(
    uWebSockets_external
    URL ${3RDPARTY_ZIP_PATH}/uWebSockets-20.74.0.zip
    SOURCE_DIR ${CMAKE_BINARY_DIR}/uWebSockets-src
    # BINARY_DIR ${CMAKE_BINARY_DIR}/uWebSockets-build
    # INSTALL_DIR ${PERICHECK_INSTALL_DIR}
    CONFIGURE_COMMAND ""
    BUILD_COMMAND ""
    INSTALL_COMMAND ""
    UPDATE_COMMAND ""
    DEPENDS libdeflate_external uSockets_external
    LOG_DOWNLOAD ON
    BUILD_ALWAYS OFF
    EXCLUDE_FROM_ALL ON
)
add_subdirectory(${CMAKE_SOURCE_DIR}/buildscripts/uWebSockets_Interface)


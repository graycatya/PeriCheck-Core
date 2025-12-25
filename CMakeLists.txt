cmake_minimum_required(VERSION 3.15)

project(PeriCheck-Core LANGUAGES C CXX)

if(CMAKE_SYSTEM_NAME STREQUAL "Darwin")
elseif (UNIX)
add_compile_options(-Wall -fPIC -Wno-stringop-overflow)
endif()

message(STATUS "------------------------------------------------------------" )
message(STATUS "[${PROJECT_NAME}] Configuration summary."                     )
message(STATUS "------------------------------------------------------------ ")
message(STATUS " System configuration:"                                       )
message(STATUS " .. Processor type .............. = ${CMAKE_SYSTEM_PROCESSOR}")
message(STATUS " .. CMake executable ............ = ${CMAKE_COMMAND}"         )
message(STATUS " .. CMake version ............... = ${CMAKE_VERSION}"         )
message(STATUS " .. System name ................. = ${CMAKE_SYSTEM}"          )
message(STATUS " .. C++ compiler ................ = ${CMAKE_CXX_COMPILER}"    )
message(STATUS " .. C compiler .................. = ${CMAKE_C_COMPILER}"      )
message(STATUS " .. size(void*) ................. = ${CMAKE_SIZEOF_VOID_P}"   )
message(STATUS " .. cmake build type ................. = ${CMAKE_BUILD_TYPE}")
message(STATUS " .. cmake current source ................. = ${CMAKE_CURRENT_SOURCE_DIR}")
message(STATUS " .. cmake system name ................. = ${CMAKE_SYSTEM_NAME}")
message(STATUS "------------------------------------------------------------ ")

set(CMAKE_INSTALL_PREFIX ${CMAKE_BINARY_DIR}/install CACHE PATH "Installation prefix")

set(3RDPARTY_PATH ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty)
set(3RDPARTY_ZIP_PATH ${CMAKE_CURRENT_SOURCE_DIR}/3rdparty-zip)
set(PERICHECK_INSTALL_DIR ${CMAKE_BINARY_DIR}/install) 

list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/external)
include(libuv_external)
include(openssl_external)
include(uSockets_external)

#add_dependencies(libwebsockets_external libuv_external mbedtls_external)

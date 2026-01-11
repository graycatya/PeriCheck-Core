cmake_minimum_required(VERSION 3.15)
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
# 禁用编译器特定的扩展（可选，推荐开启以保证跨平台兼容性）
set(CMAKE_CXX_EXTENSIONS OFF)
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
set(BUILDSCRIPTS_PATH ${CMAKE_CURRENT_SOURCE_DIR}/buildscripts)
set(PERICHECK_INSTALL_DIR ${CMAKE_BINARY_DIR}/install) 

set(3RDPARTY_ZIPS
    libuv-1.x
    openssl-cmake-1.1.1w-20250419
    libdeflate-1.25
    uSockets-0.8.8
    uWebSockets-20.74.0
)

set(IS_CUSTOM_BUILDS_PROJECT
    uSockets-0.8.8
    uWebSockets-20.74.0
)

foreach(3RDPARTY_ZIP ${3RDPARTY_ZIPS})
    if(NOT EXISTS "${3RDPARTY_PATH}/${3RDPARTY_ZIP}")
        file(ARCHIVE_EXTRACT
            INPUT "${3RDPARTY_ZIP_PATH}/${3RDPARTY_ZIP}.zip"
            DESTINATION "${3RDPARTY_PATH}"
        )
    # message(FATAL_ERROR "Cannot find the ZIP file: ${3RDPARTY_ZIP}，Please check if the path is correct!")
    endif()
endforeach(3RDPARTY_ZIP)

foreach(3RDPARTY ${3RDPARTY_ZIPS})
    if("${3RDPARTY}" IN_LIST IS_CUSTOM_BUILDS_PROJECT)
        #message("custom project: " ${3RDPARTY})
        if(${3RDPARTY} STREQUAL "uSockets-0.8.8")
            add_subdirectory(${BUILDSCRIPTS_PATH}/uSockets)
        elseif(${3RDPARTY} STREQUAL "uWebSockets-20.74.0")
            add_subdirectory(${BUILDSCRIPTS_PATH}/uWebSockets_Interface)
        endif()
    else()
        #message("build project: " ${3RDPARTY})
        add_subdirectory(${3RDPARTY_PATH}/${3RDPARTY})
    endif()
endforeach(3RDPARTY)

# list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/external)
# include(libuv_external)
# include(openssl_external)
# include(uSockets_external)
# include(libdeflate_external)
# include(uWebSockets_external)

add_subdirectory(unit_tests)


#add_dependencies(libwebsockets_external libuv_external mbedtls_external)

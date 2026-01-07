cmake_minimum_required(VERSION 3.10)

project(uWebSockets LANGUAGES C)


add_library(${PROJECT_NAME} INTERFACE)
target_compile_definitions(${PROJECT_NAME} INTERFACE
    UWS_NO_ZLIB
    UWS_USE_LIBDEFLATE
    USE_OPENSSL
)
target_include_directories(${PROJECT_NAME} INTERFACE ${CMAKE_BINARY_DIR}/${PROJECT_NAME}-src/src)
target_link_libraries(${PROJECT_NAME} INTERFACE libdeflate uSockets OpenSSL libuv)

add_dependencies(${PROJECT_NAME} uWebSockets_external libuv_external libdeflate_external uSockets_external openssl_external)

cmake_minimum_required(VERSION 3.10)

project(unit_tests LANGUAGES C CXX)

if(MSVC)
    add_compile_options(/wd4996)
endif()

include_directories(${LIBDEFLATE_INCLUDE_DIR}
                    ${USOCKETS_INCLUDE_DIR})
add_executable(uWebSocketsHelloWorld uWebSocketsHelloWorld.cpp)
target_compile_definitions(uWebSocketsHelloWorld INTERFACE
    USE_LIBUV
    USE_OPENSSL
)
target_link_libraries(uWebSocketsHelloWorld PUBLIC OpenSSL libuv uWebSockets libdeflate uSockets)

add_dependencies(uWebSocketsHelloWorld uWebSockets_external libdeflate_external uSockets_external openssl_external)

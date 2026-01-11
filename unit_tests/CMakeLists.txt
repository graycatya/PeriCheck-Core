cmake_minimum_required(VERSION 3.10)

project(unit_tests LANGUAGES C CXX)

if(MSVC)
    add_compile_options(/wd4996)
endif()


add_executable(uWebSocketsHelloWorld uWebSocketsHelloWorld.cpp)
target_compile_definitions(uWebSocketsHelloWorld INTERFACE
    USE_LIBUV
    USE_OPENSSL
)
target_link_libraries(uWebSocketsHelloWorld PUBLIC uv ssl crypto uWebSockets libdeflate_shared uSockets)

add_executable(uWebSocketsClient uWebSocketsClient.cpp)
target_compile_definitions(uWebSocketsClient INTERFACE
    USE_LIBUV
    USE_OPENSSL
)
target_link_libraries(uWebSocketsClient PUBLIC uv ssl crypto uWebSockets libdeflate_shared uSockets)


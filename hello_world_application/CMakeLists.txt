cmake_minimum_required(VERSION 3.10)
project(hello_world)

add_executable(hello_world hello_world.cpp)
target_include_directories(hello_world PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/../formatter_ex_lib
)
target_link_libraries(hello_world PRIVATE formatter_ex_lib)

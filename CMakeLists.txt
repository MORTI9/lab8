cmake_minimum_required(VERSION 3.10...3.27)
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_CXX_EXTENSIONS OFF)
project(MyProject)

set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -fconcepts")
add_definitions(-DLOG_PATH=\"/var/log/app/log.txt\")

add_subdirectory(formatter_lib)
add_subdirectory(formatter_ex_lib)
add_subdirectory(solver_lib)


add_subdirectory(hello_world_application)
add_subdirectory(solver_application)



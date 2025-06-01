cmake_minimum_required(VERSION 3.10...3.27)
project(MyProject)


add_definitions(-DLOG_PATH=\"/var/log/app/log.txt\")

add_subdirectory(formatter_lib)
add_subdirectory(formatter_ex_lib)
add_subdirectory(solver_lib)


add_subdirectory(hello_world_application)
add_subdirectory(solver_application)



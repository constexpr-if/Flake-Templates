cmake_minimum_required(VERSION 3.21 FATAL_ERROR)
project(
    template_project
    VERSION 0.1
    DESCRIPTION "C++ Template Flake which is capable of multiple packages"
    LANGUAGES CXX
)
add_subdirectory(libhello)
add_executable(hello libhello/main.cpp)
target_link_libraries(hello hello_lib)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED True)

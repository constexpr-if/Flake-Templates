add_library(hello_lib STATIC main.cpp hello.cpp)
target_include_directories(hello_lib PUBLIC ${CMAKE_SOURCE_DIR}/include)
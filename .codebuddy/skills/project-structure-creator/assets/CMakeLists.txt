cmake_minimum_required(VERSION 3.10)
project(ProjectName VERSION 1.0.0 LANGUAGES CXX)

# 设置C++标准 (C11)
set(CMAKE_CXX_STANDARD 11)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# 输出目录
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)

# 头文件目录
include_directories(include)

# 源文件目录
add_subdirectory(src)

# 测试
enable_testing()
add_subdirectory(tests)

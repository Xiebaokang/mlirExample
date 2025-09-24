cmake_minimum_required(VERSION 3.13.4)

project(mlir-toy VERSION 0.0.0)

# 防止 cmake 生成一堆 warning
cmake_policy(SET CMP0116 NEW)

set(CMAKE_EXPORT_COMPILE_COMMANDS ON)
set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED YES)

add_compile_options(-g)

set(LLVM_BUILD_DIR /home/xiebaokang/software/llvm-project/build)
set(MLIR_DIR ${LLVM_BUILD_DIR}/lib/cmake/mlir)
find_package(MLIR REQUIRED)
list(APPEND CMAKE_MODULE_PATH "${MLIR_CMAKE_DIR}")
list(APPEND CMAKE_MODULE_PATH "${LLVM_CMAKE_DIR}")

include(TableGen)
include(AddLLVM)
include(AddMLIR)
include(HandleLLVMOptions)

include_directories(${LLVM_INCLUDE_DIRS} ${MLIR_INCLUDE_DIRS})


# 设置输出目录
SET(EXECUTABLE_OUTPUT_PATH ${CMAKE_BINARY_DIR}/bin)

add_subdirectory(ex1-io)
add_subdirectory(ex2-build)
# add_subdirectory(ex3-dialect)
# add_subdirectory(ex4-beautiful-dialect)
# add_subdirectory(ex5-pass)
add_subdirectory(ex7-convert)

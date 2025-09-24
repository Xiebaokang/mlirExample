cmake_minimum_required(VERSION 3.13.4)

add_executable(toy-ex2-build ex2-build.cpp)

target_link_libraries(
  toy-ex2-build
  MLIRMemRefDialect
  MLIRFuncDialect
  MLIRAffineDialect
  MLIRArithDialect
  MLIRAffineUtils
)
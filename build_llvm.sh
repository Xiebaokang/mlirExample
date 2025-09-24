#!/bin/bash
# 编译llvm
LLVM_COMMIT_HASH=be17791f2624f22b3ed24a2539406164a379125d


git clone https://github.com/llvm/llvm-project.git
cd llvm-project
git checkout $LLVM_COMMIT_HASH

mkdir build
cd build
cmake -G Ninja ../llvm \
  -DCMAKE_BUILD_TYPE=Release \
  -DLLVM_ENABLE_ASSERTIONS=ON \
  -DLLVM_ENABLE_PROJECTS="mlir;llvm" \
  -DLLVM_TARGETS_TO_BUILD="host;NVPTX" 
ninja
#!/bin/bash

# 默认 LLVM 构建目录（用户未指定时使用）
DEFAULT_LLVM_BUILD_DIR="$HOME/software/llvm-project/build"

# 用法提示
usage() {
    echo "用法: $0 [--llvm-build-dir=<LLVM_BUILD_DIR>]"
    echo "示例:"
    echo "  $0 --llvm-build-dir=/path/to/llvm/build"
    exit 1
}

# 初始化变量
LLVM_BUILD_DIR="$DEFAULT_LLVM_BUILD_DIR"
TARGET=""

# 解析命令行参数
while [[ $# -gt 0 ]]; do
    case "$1" in
        --llvm-build-dir=*)
            LLVM_BUILD_DIR="${1#*=}"
            shift
            ;;
        *)
            echo "错误: 未知参数 $1"
            usage
            ;;
    esac
done

# 检查 LLVM 构建目录是否存在
if [ ! -d "$LLVM_BUILD_DIR" ]; then
    echo "错误: LLVM 构建目录不存在: $LLVM_BUILD_DIR"
    exit 1
fi

# 创建构建
if [ ! -d "./build" ]; then
    mkdir build
fi
cd build
cmake .. -DLLVM_BUILD_DIR=$LLVM_BUILD_DIR
make -j32
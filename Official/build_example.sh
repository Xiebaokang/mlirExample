#!/bin/bash

# 默认 LLVM 构建目录（用户未指定时使用）
DEFAULT_LLVM_BUILD_DIR="$HOME/software/llvm-project/build"

# 用法提示
usage() {
    echo "用法: $0 [--llvm-build-dir=<LLVM_BUILD_DIR>] --target=<TARGET>"
    echo "示例:"
    echo "  $0 --target=Toy"
    echo "  $0 --llvm-build-dir=/path/to/llvm/build --target=Transform"
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
        --target=*)
            TARGET="${1#*=}"
            shift
            ;;
        *)
            echo "错误: 未知参数 $1"
            usage
            ;;
    esac
done

# 检查必须参数
if [ -z "$TARGET" ]; then
    echo "错误: 必须指定 --target"
    usage
fi

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

# 根据 target 执行构建
case "$TARGET" in
    Toy)
        echo "正在构建 Toy (LLVM 构建目录: $LLVM_BUILD_DIR)..."
        make -j32 Toy
        ;;
    Transform)
        echo "正在构建 Transform (LLVM 构建目录: $LLVM_BUILD_DIR)..."
        make -j32 Transform
        ;;
    *)
        echo "错误: 未知 target: $TARGET"
        echo "支持的 target: Toy, Transform"
        exit 1
        ;;
esac
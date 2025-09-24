# 🎯 MLIR教程
> 这是MLIR的入门教程项目，主要参考了和总结了官方教程和非官方的开源项目代码。

## 🚀 安装步骤

1. **克隆项目**
```bash
git clone https://github.com/Xiebaokang/mlirExample.git
cd project
```

2. **安装依赖**
编译该项目所需要的LLVM环境，时间会有点长。
```bash
./build_llvm.sh
```

3. **编译项目**
该项目主要分为官方教程和非官方教程两个部分，其中官方部分代码含有toy教程和transform教程，编译方式为：
```bash
# 可以先打开./build_example.sh设置默认llvm的build目录，也可以直接在脚本指令输入
# target设置可以选择不同教程进行编译（Toy教程和Transform教程）
cd ./Official
./build_example.sh  --llvm-build-dir=/path/to/llvm/build --target=Toy
```
若编译非官方教程，则编译方式为：
```bash
# 可以先打开./build_example.sh设置默认llvm的build目录，也可以直接在脚本指令输入
cd ./Unofficial
./build_example.sh  --llvm-build-dir=/path/to/llvm/build
```


4. **执行项目**
项目执行也分为官方教程和非官方教程两个部分，且执行所需要的mlir代码均在Official/UnOfficial目录的 MLIRCode 文件夹下，其中官方部分执行：
```bash
# 当前目录 ： Official
# 查看如何执行
./build/bin/toyc-ch1 -help
# 示例：
./build/bin/toyc-ch1 ./MLIRCode/Toy/Ch1/ast.toy  --emit=ast
```
非官方部分的执行为：
```bash
# 当前目录 ： UnOfficial
# 查看如何执行（自己定义的pass opt在=aggressive下）
./build/bin/toy-ex7-opt -help
# 示例（示例7只有两个自定义的pass）：
./build/bin/toy-ex7-opt ./MLIRcode/ex7.mlir --convert-toy-to-arith
./build/bin/toy-ex7-opt ./MLIRcode/ex7.mlir --toy-dce
```

## 🤝 主要参考链接
- MLIR官方教程: [https://github.com/llvm/llvm-project/tree/main/mlir/examples](https://github.com/llvm/llvm-project/tree/main/mlir/examples)
- 非官方教程: [https://github.com/OpenMLIR/mlir-tutorial/tree/main](https://github.com/OpenMLIR/mlir-tutorial/tree/main)
- 其他参考项目: [https://github.com/OpenMLIR/mlir-tutorial/blob/main/MLIR%E5%AD%A6%E4%B9%A0%E5%8F%AF%E4%BB%A5%E5%8F%82%E8%80%83%E7%9A%84%E9%A1%B9%E7%9B%AE.md](https://github.com/OpenMLIR/mlir-tutorial/blob/main/MLIR%E5%AD%A6%E4%B9%A0%E5%8F%AF%E4%BB%A5%E5%8F%82%E8%80%83%E7%9A%84%E9%A1%B9%E7%9B%AE.md)
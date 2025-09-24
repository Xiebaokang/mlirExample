#ifndef TOY_PASSES_TD
#define TOY_PASSES_TD

include "mlir/Pass/PassBase.td"

// 我这定义了pass，然后我编译好后的选项是--convert-toy-to-arith或者toy-dce
def ConvertToyToArith : Pass<"convert-toy-to-arith"> {
  let summary = "Convert Toy To Arith";
  let constructor = "toy::createConvertToyToArithPass()";
  let options = [
    Option<"name", "name", "std::string", "", "help">
  ];
}

// 死代码消除
def DCE : Pass<"toy-dce", "toy::FuncOp"> {
  let summary = "dce";
  let constructor = "toy::createDCEPass()";
}
#endif

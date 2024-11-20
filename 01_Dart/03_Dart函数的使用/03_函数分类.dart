main(List<String> args) {
  //1、函数可以作为参数
  test(bar);

  //2、匿名函数
  test(() {
    print("匿名函数被调用");
    return 10;
  });

  //3、箭头函数： 条件，函数只有一行代码
  test(() => print("箭头函数被调用"));
}

//1、函数可以作为参数
void test(Function foo) {
  foo(); //调用
  // var result = foo(); //接受参数
}

void bar() {
  print("函数被调用");
}

/*
函数体：
 1、 大括号括起来的语句列表（参数可能为空）
 2、=>符号后跟着一个表达式。
    函数要么返回一个值要么抛出一个异常，如果完成了最后一条语句，而且它不是return，则我们讲返回null
*/ 
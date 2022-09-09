main(List<String> args) {
  
  //1、函数可以作为参数
  // test(bar);

  //2、匿名函数
   test((){
     print("匿名函数被调用");
      return 10;
   });

   //3、箭头函数： 条件，函数只有一行代码
   test(() => print("箭头函数被调用"));

}

//1、函数可以作为参数
void test(Function foo){

  foo(); //调用
  // var result = foo(); //接受参数
  
}

void bar(){
  print("函数被调用");
}





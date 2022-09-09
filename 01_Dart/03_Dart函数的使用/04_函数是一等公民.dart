main(List<String> args) {
  
  //1、不带参函数，作为参数
  test1((abc){
    print(abc);
  });

//2、带参函数，作为参数
  test2((num1, num2) {
      return num1 + num2;
  });

//3、typedef作为参数
// test3((num1, num2) => print("箭头函数被调用"));


//4、函数作为返回值
  var demo1 = demo();
  print(demo1(20, 30));


}


// 封装test函数, 要求: 传入一个函数
void test1(Function foo) {
   foo("why");
}


void test2(int foo(int num1, int num2)){
  print(foo(20, 30));
}

typedef Calculate =  int Function(int num1, int num2);
void test3(Calculate calc){
    calc(20, 30);
}


//函数作为返回值
Calculate demo(){
    return (num1, num2){
      return num1 * num2;
    };
}


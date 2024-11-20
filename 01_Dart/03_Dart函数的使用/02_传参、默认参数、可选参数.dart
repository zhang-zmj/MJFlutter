main(List<String> args) {
  sayHello1("why");

  // sayHello2("why", 18);
  // sayHello3("why", age: 16);
}

//方法传参
void sayHello1(String name) {
  print(name);
}

/*
可选参数：
   类型：
      1、位置可选参数，按顺序写，
      2、命名可选参数，参数名必须写，顺序随便写
   注意：‘
      只有可选参数才可以有默认值
      * 位置参数可以必需的也可以是可选。
      * 如果可选参数个数只有一个建议直接使用可选位置参数［num a，num b］；
        如果可选参数个数是多个的话建议用可选命名参数｛num a，num b｝
      * 默认值必须是编译时常量。如果没有提供默认值，则默认值为null。
*/

//位置可选参数：
// void sayHello2(String name, [int age, double height = 2.0]) {}

//命名可选参数：必须有参数
// void sayHello3(String name, {int age, double height = 2.0}) {}

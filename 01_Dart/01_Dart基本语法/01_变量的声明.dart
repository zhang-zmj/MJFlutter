void main(List<String> args) {
  //1、明确的声明
  String name = "why";
  print(name);

  /*
  2、类型推导： var/dynamic/const/final/late 变量名称 = 赋值;

     var ：声明变量，
     const： 声明常量，编译时就要有一个确定的值，只能赋值一次
     final： 声明常量，通过计算/函数获取一个值(运行期间来确定一个值)，只能赋值一次
     dynamic：修改变量的类型
     late： 显式声明一个非空的变量，但不初始化、 延迟初始化变量
     Object：
  */
  var age = 20;
  final height = DateTime.now();
  const address = "广州市";

  dynamic person = 'LiLi';
  print(person.runtimeType); // String
  person = 22;
  print(person.runtimeType); // int

  print(age);
  print(height);
  print(address);

  /*
  3、const 与 final 不同点
    * final可修饰实例变量、const不可以修饰实例变量
    * 访问类中const修饰的变量需要static修饰
    * const修饰的List集合任意索引不可修改，final修饰的可以修改
    
    当const修饰类的构造函数时，它要求该类的所有成员都必须是final的。  
  */
}

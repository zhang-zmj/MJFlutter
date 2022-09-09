/*
    class 类名 {
      类型 成员名;
      返回值类型 方法名(参数列表) {
        方法体
      }
    }
*/
void main(List<String> args) {
  var p = Person("why", 18);
  // p.getInfo();
}

class Person {
/* 
  String name = "张三";
  int age = 23;
  void getInfo() {
    print("${name}------${age}");
  }
*/

  String name;
  int age;

//1、默认的初始化
  // Person(String name, int age){
  //    this.name = name;
  //    this.age = age;
  // }

  //2、语法糖
  Person(this.name, this.age);
}

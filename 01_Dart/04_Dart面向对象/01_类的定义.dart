/*
    class 类名 {
      类型 成员名;
      返回值类型 方法名(参数列表) {
        方法体
      }
    }
*/
void main(List<String> args) {
  var person = Person("why", 18);
  print(person);
}

class Person {
  //1、成员变量
  String? name;
  int? age;

  //2、默认的初始化
  // Person(String name, int age) {
  //   this.name = name;
  //   this.age = age;
  // }

  //3、语法糖
  Person(this.name, this.age);
}

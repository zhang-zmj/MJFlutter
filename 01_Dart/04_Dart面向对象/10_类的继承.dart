void main(List<String> args) {
  var p = Person("zhang san", 22, "男");
  print(p.name);
  print(p.age);
}

class Animal {
  int age;
  Animal(this.age);

  work() {
    print("正在工作。。。。");
  }
}

/*
  1、继承使用 extends 关键字
  2、如果重载父类的方法时，需要调用父类的方法，使用 super 关键字
*/
class Person extends Animal {
  String name;
  late String sex;
  Person(this.name, int age, String sex) : super(age) {
    this.sex = sex;
    this.name = name;
  }
  @override
  work() {
    print("开始了。。。。");
    return super.work();
  }
}

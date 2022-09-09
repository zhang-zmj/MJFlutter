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

class Person extends Animal {
  String name;
  late String sex;
  Person(this.name, int age, String sex) : super(age) {
    this.sex = sex;
  }
  @override
  work() {
    print("开始了。。。。");
    return super.work();
  }
}

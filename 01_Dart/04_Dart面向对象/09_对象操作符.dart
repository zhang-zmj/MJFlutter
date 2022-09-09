void main(List<String> args) {
  //条件运算符
  // Person p;
  // p?.run();

  // 类型判断
  Person p1 = Person("liu");
  // ignore: unnecessary_type_check
  if (p1 is Person) {
    print("--------你好啊 ");
  }

  //类型转换
  var p2;
  p2 = '';
  p2 = Person("zhang");
  (p2 as Person).run();

  //级联运算符
  var person = Person("zmj")
    ..name = "why"
    ..eat()
    ..run();
  print(person);
}

class Person {
  String name = "";

  Person(this.name);
  void run() {
    print("running");
  }

  void eat() {
    print("eatning");
  }

  @override
  String toString() {
    return "$name";
  }
}

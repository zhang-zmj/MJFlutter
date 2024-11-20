void main(List<String> args) {
  Person.courseTime = "8:30";
  print(Person.courseTime);
  Person.gotoCourse();
}

class Person {
  //成员变量
  late String name;
  //静态属性(类属性)
  static String? courseTime;

  //对象方法
  void eating() {
    print("eating");
  }

  //静态方法(类方法)
  static void gotoCourse() {
    print("去上课");
  }
}

/*
late：
  1、避免一些日常开发中很难被发现的错误
*/
void main(List<String> args) {
  Person p = new Person();
  p.setName("张", 20);
  print(p.getName());
}

class Person {
  late String name;
  late int age;

  void setName(String name, int age) {
    this.name = name;
    this.age = age;
  }

  String getName() {
    return "${this.name}-----${this.age}";
  }
}

void main(List<String> args) {
  var p = Person("why");
  print(p.age);
}

class Person {
  String name;
  int age;

  //默认构造函数调用内部构造函数，重定向
  Person(String name) : this._internal(name, 18);
  Person._internal(this.name, this.age);
}

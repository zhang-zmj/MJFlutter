void main(List<String> args) {
  final p = Person();

  //直接访问属性
  p.name = "why";
  print(p.name);

  //通过getter和setter访问
  p.setName = "lilei";
  print(p.getName);
}

class Person {
  //late 显式声明一个非空的变量，但不初始化、 延迟初始化变量
  late String name;

  //setter方法
  set setName(String name) => this.name = name;
  //getter方法
  String get getName => name;
}

main(List<String> args) {
  var p0 = Person("zhangmingjun", 19, 1.88);
  print(p0);

  var p1 = Person.withNameAgeHeight("why", 18, 1.88);
  print(p1.toString());

  var p2 = Person.fromMap({"name": "lilei", "age": 18, "height": 1.88});
  print(p2);

/*
 父类应用指向子类对象
  Object和dynamic的区别：
  
    调用方法时，编译时会报错
       Object obj = "why";
       print(obj,substring(1));
    调用方法时，编译时不报错，但是运行时会存在安全隐患
       dynamic obj = "why";
       print(obj,substring(1));

*/
}

class Person {

  // int? 告诉编译器，我处理了后面为空的情况
  String? name;
  int? age ;
  double? height;

  //1、常规构造函数
  Person(this.name, this.age, this.height);

  //2、命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  Person.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  @override
  String toString() {
    return "$name $age $height";
  }
}

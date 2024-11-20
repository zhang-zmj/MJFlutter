void main(List<String> args) {
  var p0 = Person("zhangmingjun", 19, 1.88);
  print(p0);

  var p1 = Person.withNameAgeHeight("why", 18, 1.88);
  print(p1.toString());

  var p2 = Person.fromMap({"name": "lilei", "age": 18, "height": 1.88});
  print(p2);
}

// Dart中 使用 _ 把一个属性或者方法定义成私有
class Person {
  String? _type;
  String? name;
  int? age;
  double? height;

  //1、常规构造函数
  Person(this.name, this.age, this.height);

  //2、命名构造函数
  Person.withNameAgeHeight(this.name, this.age, this.height);

  // 赋值
  Person.fromMap(Map<String, dynamic> map) {
    this.name = map["name"];
    this.age = map["age"];
    this.height = map["height"];
  }

  String getType() {
    return this._type ?? "";
  }

  @override
  String toString() {
    return "$name $age $height";
  }
}

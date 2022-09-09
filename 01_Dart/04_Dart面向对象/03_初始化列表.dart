void main(List<String> args) {
  var p = Person("why");
  print(p);
}

const temp = 20;

class Person {
  late final String name;
  late final int age;

  // Person(this.name) : age = 10 {
  //   this.name = name;
  //   this.age = age;
  //   print("${this.name}-------${this.age}");
  // }

  // 如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  Person(this.name, {int? age}) : age = age ?? 10 {}

  // 如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  // Person(this.name, {int? age}) : age = temp > 20 ? 30 : 50 {}

  //  Instance of 'Person'  没有重写toString()方法
  @override
  String toString() {
    return "$name $age";
  }
}

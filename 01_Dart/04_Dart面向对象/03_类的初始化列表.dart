main(List<String> args) {
  /*
    class 类名 {
      类型 成员名;
      返回值类型 方法名(参数列表) {
        方法体
      }
    }
 */
  var p = Person("why");
  print(p);
}

const temp = 20;

class Person {
  final String name;
  final int age;

  // Person(this.name): age = 10 { }

  // 如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  Person(this.name, {int? age}) : age = age ?? 10 {}

  // 如果创建对象时, 有传入一个age, 那么就使用传入的age, 如果没有传入age, 那么使用一个默认值
  // Person(this.name, {int? age}) : age = temp > 20 ? 30 : 50 {}

}

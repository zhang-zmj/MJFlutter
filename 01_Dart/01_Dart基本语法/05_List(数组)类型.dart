void main(List<String> args) {
// 1、第一种定义List的方式
  var person = ["张三", 20, true];
  print(person);
  print(person.length);
  print(person[0]);
  print(person[1]);

// 2、第二种定义List的方式
  var pepole = <String>["张三", "20", "true"];
  print(pepole);

  // 3、第三种定义List的方式，增加数据，长度可以修改
  var empty = [];
  empty.add("abc");
  empty.add("cba");
  empty.add("bca");
  empty.add("nba");
  empty.remove("abc");
  print(empty);

// 4、第四种定义List的方式，长度无法修改
  // var objc = List.filled(2, '');
  var objc = List<String>.filled(2, '');
  objc[0] = "张三";
  objc[1] = "李四";
  print(objc);

// 5、第五种定义List的方式
  List<int> ages = [20, 30];
  print("年龄是：${ages} 类型是：${ages.runtimeType}");
}

/*
Dart判断数据类型：
  is 关键词来判断类型
*/
void main(List<String> args) {
// 1、第一种定义Maps的方式
  var person = {"name": "why", "age": 18};
  print(person);
  print(person["name"]);
  print(person["age"]);

// 2、第二种定义Maps的方式
  var p = new Map();
  p["name"] = "李四";
  p["age"] = 22;
  p["work"] = ["程序员", "送外卖"];
  print(p);


// 3.明确指定类型
  Map<String, Object> infoMap2 = {'height': 1.88, 'address': '北京市'};
  print('$infoMap2 ${infoMap2.runtimeType}');

}

void main(List<String> args) {
// List数组
  var l1 = ["香蕉", "苹果", "西瓜"];
  // 常用属性
  print(l1.length);
  print(l1.reversed);
  print(l1.isEmpty);
  print(l1.isNotEmpty);
  print(l1);

  // 常用方法 ：
  l1.add("草莓");
  l1.addAll(["桃子", "葡萄"]);
  print(l1.indexOf("桃子"));
  print(l1.indexOf("李子")); // 不存在返回-1

  l1.remove("桃子");
  l1.removeAt(0);
  l1.fillRange(1, 2, "aaaa"); //修改
  l1.insert(1, "菠萝");
  l1.insertAll(2, ["榴莲", "橙子", "西红柿"]);
  print(l1);

  // List转字符串
  var str = l1.join("-");
  print(str);

  // 字符串分割成List
  var arr = str.split("-");
  print(arr);

// Set集合
  var s = new Set();
  s.add("香蕉");
  s.add("苹果");
  print(s);

  List myList = ["香蕉", "苹果", "西瓜", "香蕉", "苹果", "西瓜" "香蕉", "苹果", "西瓜"];
  var single = new Set();
  single.addAll(myList);
  print(single.toList());

// Map
  var person = {"name": "张三", "age": 20};
  person.addAll({
    "work": ["敲代码", "送外卖"],
    "height": 160
  });
  person.remove("age");
  var m = new Map();
  m["name"] = "李四";
  print(m);
  print(person);
  print(person.keys.toList());
  print(person.values.toList());

// 其他方法：forEach  map  where  any  every
  var shop = ["香蕉", "苹果", "西瓜"];
  shop.forEach((element) {
    print("------" + element);
  });

  List numList = [1, 2, 3, 4];
  var newNumList = numList.map((value) {
    return value * 2;
  });
  print(newNumList);

  List number = [1, 2, 3, 4, 5, 6, 7, 8, 9];

  // 只要集合里面有满足条件的就返回true
  var findle = number.every((element) {
    return element > 5;
  });
  print(findle);
}

/*
常用属性：
  Length 长度
  reversed  翻转
  isEmpty  是否为空
  isNotEmpty 是否不为室

常用方法：
add 增加
addAll  拼接数组
indexof 查找 传入具体值
remove  删除 传入具体值
removeAt  删除：传入索引值
fillRange 修改
insert (index, value);   指定位置插入
insertAll (index, list)  指定位置插入List
tolist()  其他类型转换成List
join()  List转换成字符串
split() 字符串转化成List
*/ 
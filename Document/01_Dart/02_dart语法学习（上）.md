#### 一、 在 vscode 中安装相关插件

- Dart
- Flutter
- code runner： 帮助我们运行文件

#### 二、变量的声明

1、明确声明(Explicit)

```
  String name = "why";
  print(name);
```

2、类型推导(Type Inference)
类型推导声明变量的方式, 格式如下:

> var / dynamic / const / final 变量名称 = 赋值;

- var ：声明变量，
- const： 声明常量，编译时就要有一个确定的值，只能赋值一次
- final： 声明常量，通过计算/函数获取一个值(运行期间来确定一个值)，只能赋值一次
- dynamic：修改变量的类型

```
  var age = 20;
  final height = DateTime.now();
  const address = "广州市";

  dynamic person = 'LiLi';
  print(person.runtimeType); // String
  person = 22;
  print(person.runtimeType); // int

  print(age);
  print(height);
  print(address);
```

#### 三、数值类型

- int
- double

```
  // 1、int
  int a = 123;
  a = 45;
  int b = 35;
  b = 36;
  print(a);
  print(b);

  // 2、double
  double c = 23.5;
  c = 24;
  print(c);

  // 判断奇数和偶数
  print(a.isOdd); // 奇数
  print(b.isEven); // 偶数
```

#### 四、字符串类型

```
//1、字符串声明
  var str1 = 'this is str';
  String str2 = '你好dart';
  print(str1);
  print(str2);

  //2、多行字符串声明
  var str3 = """
    abc
    cba
    nba
    """;
  print(str3);

  //3、字符串和表示进行拼接： 强调：${变量}, 那么{}可以省略
  var name = "why";
  var age = 19;
  var height = 1.88;
  var message1 = "my name is ${name}, age is ${age}, height is ${height}";
  print(message1);
```

#### 五 、布尔类型

```
  //不正确
  var flag1 = "abc";
  print(flag1);

  //只有布尔类型的 "true" 被视为true
  var flag2 = true;
  if (flag2) {
    print("执行代码");
  }
```

#### 六 、List(数组)类型

```
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
```

#### 七、Map(字典)类型

```
Dart判断数据类型：
  is 关键词来判断类型

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
```

#### 八、Set(集合)类型：是无序的，并且元素是不重复的

```
    // 1.使用类型推导定义
    var lettersSet = {'a', 'b', 'c', 'd'};
    print('$lettersSet ${lettersSet.runtimeType}');

    // 2.明确指定类型
    Set<int> numbersSet = {1, 2, 3, 4};
    print('$numbersSet ${numbersSet.runtimeType}');
```

#### 九、List(数组)、Map(字典)、Set(集合)操作

```
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
```

#### 十、运算符

- 算术运算符
- 关系运算符
- 逻辑运算符
- 赋值运算符
- 三目运算符
- 空值运算符
- 级联运算符

#### 十一、类型转换

```
// 1.字符串转数字

  // String str1 = "123";
  // var myNum = int.parse(str);

  String str = "123.1";
  var myNum = double.parse(str);
  var isNumber = (myNum is int);
  print(isNumber);

  String price = "";
  try {
    var myNum = double.parse(price);
    print(myNum);
    print((myNum is double));
  } catch (e) {
    print(("报错了。。。。"));
  }


// 2.数字转字符串
var num1 = 123;
var num2 = 123.456;
var num1Str = num1.toString();
var num2Str = num2.toString();
var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
print('${num1Str} ${num1Str.runtimeType}'); // 123 String
print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String

提示：Dart 语言打印是: ${要打印的变量}，可以省略 {}，但是如果 {} 里面是表达式 就不能省略
```

#### 十二、循环语句

- for 循环
- while 循环
- continue 与 break
















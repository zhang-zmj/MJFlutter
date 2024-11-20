void main(List<String> args) {
  // 1、算术运算符
  int a = 13;
  int b = 5;
  print(a ~/ b); //取整

  // 2、关系运算符
  print(a > b);

  // 3、逻辑运算符
  bool one = true;
  bool two = false;
  print(one && two);

  // 4、赋值运算符
  int num = 10;
  num += 23;
  print(num);

// 5、三目运算符
  bool flag = false;
  String str = flag ? "我是true" : "我是false";
  print(str);

  // ??=  原来这个变量有值，就不赋值，没有值就赋值
  var name = null;
  name ??= "张明军";
  print(name);

  // ??
  var age = null;
  var temp = age ?? "lilei";
  print(temp);

  /*
  6、自增自减
  ++、--：写在前面，先运算后赋值
  ++、--：写在后面，先赋值后运算
*/
  var aa = 10;
  var bb = aa--;
  print(aa);
  print(bb);

  /*
  7、级联操作符：级联操作符用于对同一个对象连续执行多个操作。
  */
  Builder builder = Builder()
    ..setWidth(100)
    ..setHeight(200)
    ..setColor("red");
  print(builder);

  // 8、扩展操作符：用于在集合中插入另一个集合的所有元素。
  List<int> list1 = [1, 2, 3];
  List<int>? list2;

  List<int> combinedList = [0, ...list1, ...?list2];
  print(combinedList);

  var colors1 = ['red', 'yellow', 'green', 'black'].sublist(1, 3);
  colors1.sort(); //不使用级联
  print(colors1);

  var colors2 = ['red', 'yellow', 'green', 'black'].sublist(1, 3)..sort(); //使用级联
  print(colors2);
}

class Builder {
  int? width;
  int? height;
  String? color;

  void setWidth(int w) => width = w;
  void setHeight(int h) => height = h;
  void setColor(String c) => color = c;
}

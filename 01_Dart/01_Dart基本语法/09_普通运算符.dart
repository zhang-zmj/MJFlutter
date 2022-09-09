/*
1、算术运算符
2、关系运算符
3、逻辑运算符
4、赋值运算符
5、三目运算符
6、
*/
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
}

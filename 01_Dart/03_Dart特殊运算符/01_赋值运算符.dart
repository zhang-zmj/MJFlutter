main(List<String> args) {
  //  ?= 原来这个变量有值，就不赋值，没有值就赋值
  var name = null;
  name ??= "张明军";
  print(name);

  // ??
  var age = null;
  var temp = age ?? "lilei";
  print(temp);
}

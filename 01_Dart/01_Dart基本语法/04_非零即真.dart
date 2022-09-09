void main(List<String> args) {
  //不正确
  var flag1 = "abc";
  print(flag1);

  //只有布尔类型的 "true" 被视为true
  var flag2 = true;
  if (flag2) {
    print("执行代码");
  }
}

 
main(List<String> args) {
  //1、基础for循环
  for (var i = 0; i < 10; i++) {
    print(i);
  }

  //2.遍历数组
  var names = ["why", "cba", "cba"];
  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }

  for (var name in names) {
    print(name);
  }

  //3、continue： 结束本次的循环，进入下一次的循环
  //4、break： 终止、永久跳出循环，只能跳出来一层
}

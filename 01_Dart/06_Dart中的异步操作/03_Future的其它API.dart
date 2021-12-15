main(List<String> args) {
  Future.value("哈哈哈哈哈").then((value) {
    print(value);
  });

  Future.error("我是一个错误").catchError((error) {
    print(error);
  });

  Future.delayed(Duration(seconds: 3), () {
    return "Hello Flutter";
  }).then((value) {
    print(value);
    return "hello world";
  }).then((value) {
    print(value);
  });
}

import 'dart:io';

main(List<String> args) {
  print("main start");

  Future(() {
    sleep(Duration(seconds: 3));
    return "第一次的结果";
    // throw Exception("第一次异常");
  }).then((value) {
    sleep(Duration(seconds: 2));
    return "第二次的结果";
    // throw Exception("第二次异常");
  }).then((value) {
    sleep(Duration(seconds: 1));
    return "第三次的结果";
    // throw Exception("第三次异常");
  }).catchError((error) {
    print("你好啊，张明军" + error.toString());
  }).whenComplete(() => {print("已经完成了。。。。。")});

  print("main end");
}

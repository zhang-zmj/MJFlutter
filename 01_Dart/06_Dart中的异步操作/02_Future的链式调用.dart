import 'dart:io';

void main(List<String> args) {
//1、延迟指定指定时间后被调用。

  // var result = getCallBackResult();
  // result.then((value) {
  //   print(value);
  // }).catchError((error) {
  //   print(error);
  // }).whenComplete(() {
  //   print("代码执行完成");
  // });

//2、链式调用
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
    // return "第三次的结果";
    // throw Exception("第三次异常");
  }).catchError((error) {
    print("你好啊，张明军" + error.toString());
  }).whenComplete(() {
    print("已经完成了。。。。。");
  });
  print("main end");
}

//发送一个网络请求
Future getCallBackResult() {
  return Future(() {
    return true;
  }).timeout(Duration(milliseconds: 2), onTimeout: () {
    return false;
  });
  // onTimeout的返回值和上面的保持一致。
}

import 'dart:io';

void main(List<String> args) {
  print("main start");

  getNetworkData().then((res) {
    print(res);
  });

  print("main end");
}

/**
 * 解决两个问题:
 *  1.await必须在async函数中才能使用
 *  2.async函数返回的结果必须是一个Future
 */
Future getNetworkData() async {
  // await sleep(Duration(seconds: 3));

  var result = await Future.value("哈哈哈哈哈").then((value) {
    sleep(Duration(seconds: 3));
    return value;
  });

  return result;
}




// Future getNetworkData() {
//   return Future(() {
//     sleep(Duration(seconds: 3));
//     return "Hello World";
//   });
// }










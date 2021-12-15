import 'dart:async';
import 'dart:isolate';

main(List<String> args) async {
  print("main start");

//1、创建管道
  ReceivePort reprot = ReceivePort();
//2、创建Isolate
  Isolate isolate = await Isolate.spawn(foo, reprot.sendPort);
//3、监听管道
  reprot.listen((message) {
    print("----------$message");
    reprot.close();
    isolate.kill();
  });

  print("main end");

}

void foo(SendPort send) {
  return send.send("hello world");
}

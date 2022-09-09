import 'dart:isolate';

void main(List<String> args) async {
  print("main start");

// 正是由于Isolate之间没有内存共享，他们之间的唯一通讯方式只能是通过Port进行，而且这个消息传递是异步的
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

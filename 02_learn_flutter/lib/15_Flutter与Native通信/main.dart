import 'package:flutter/material.dart';
import '03_EventChannel.dart';



/*
BasicMessageChannel：用于传递数据
       Flutter与原生项目的资源是不共享的，可以通过此方法来获取Native项目的图标等资源

   消息编解码MessageCodec有4个子类:
      StandardMessageCodec：默认编解码器，其支持基础数据类型、二进制数据、列表、字典

      StringCodec： 用于字符串与二进制数据之间的编解码，其编码格式为UTF-8

      JSONMessageCodec：  用于基础数据与二进制数据之间的编解码，其支持基础数据类型以及列表、字典。
                          其在iOS端使用了NSJSONSerialization作为序列化的工具，
                          而在Android端则使用了其自定义的JSONUtil与StringCodec作为序列化工具

      BinaryCodec： 因为其返回值类型和入参的类型相同，均为二进制格式（Android中为ByteBuffer，iOS中为NSData）。
                    实际上，BinaryCodec在编解码过程中什么都没做，只是原封不动将二进制数据消息返回而已


MethodChannel: 传递方法调用
    Flutter主动调用Native的方法，并获取相应的返回值。比如获取系统电量，发起Toast等调用系统API

  方法编解码MethodCodec有两个子类：
     StandardMethodCodec：
          当其编码MethodCall时，会将method和args依次使用StandardMessageCodec编码，写入二进制数据容器。
          其在编码方法的调用结果时，若调用成功，会先向二进制数据容器写入数值0（代表调用成功），
          再写入StandardMessageCodec编码后的result

     JSONMethodCodec：
          当其在编码MethodCall时，会先将MethodCall转化为字典{"method":method,"args":args}。
          其在编码调用结果时，会将其转化为一个数组，调用成功为[result]，调用失败为[code,message,detail]。
          再使用JSONMessageCodec将字典或数组转化为二进制数据


EventChannel:  主要是用于数据流（event streams）的通信
    ventChannel可以将Flutter的一个监听交给Native，Native去做网络广播的监听，
    当收到广播后借助EventChannel调用Flutter注册的监听，完成对Flutter的事件通知



Flutter 与 Dart 异步发送消息，但无论何时调用通道方法，都必须在平台的主线程上调用该方法


*/


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            splashColor: Colors.transparent
        ),
        home: ZMJHomePage()
    );
  }

}

class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("测试Demo"),
        ),
        body: EventChannelPage()
    );
  }
}













import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BasicMessageChannelPage extends StatefulWidget {
  const BasicMessageChannelPage({super.key});

  @override
  State<BasicMessageChannelPage> createState() => _BasicMessageChannelPageState();
}

class _BasicMessageChannelPageState extends State<BasicMessageChannelPage> {
  var messageChannel = const BasicMessageChannel('com.example.learnFlutter', StandardMessageCodec());
  var _data = '';
  var _nativeData = '';

  @override
  void initState() {
    super.initState();
    receiveMessage();
  }

  //2、原生调用Flutter
  void receiveMessage() {
    messageChannel.setMessageHandler((message) async {
      setState(() {
        Map? args = message as Map?;
        _nativeData = "${args?['count']}";
      });
      return 'Reply from Dart';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            ElevatedButton(
              //1、Flutter 给原生端发送消息，并接收回调
              onPressed: () async {
                Map? result = (await messageChannel.send({'name': 'Jack', 'age': 18})) as Map?;

                var name = result!['name'];
                var age = result['age'];
                setState(() {
                  _data = '$name,$age';
                });
              },
              child: const Text('发送数据到原生'),
            ),
            const SizedBox(
              height: 50,
            ),
            Text("返回原生数据：$_data"),
            Text('原生主动发送数据：$_nativeData')
          ],
        ),
      ),
    );
  }
}

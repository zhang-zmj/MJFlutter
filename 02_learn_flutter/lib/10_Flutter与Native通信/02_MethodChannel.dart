import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MethodChannelPage extends StatefulWidget {
  const MethodChannelPage({super.key});
  @override
  State<MethodChannelPage> createState() => _MethodChannelPageState();
}

class _MethodChannelPageState extends State<MethodChannelPage> {
  var channel = const MethodChannel("com.example.learnFlutter");
  var _data = '';
  var _nativeData = '';

  @override
  void initState() {
    super.initState();
    receiveMessage();
  }

  //2、原生调用Flutter
  void receiveMessage() {
    channel.setMethodCallHandler((call) async {
      debugPrint("-----------${call.method}");
      setState(() {
        _nativeData = "${call.arguments['count']}";
      });
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
                var result = await channel.invokeMethod('sendData', {'name': 'Jack', 'age': 18});
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

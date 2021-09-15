import 'package:flutter/material.dart';
import 'event_bus.dart';

// 1.创建全局的EventBus对象
class UserInfo {
  String nickname;
  int level;

  UserInfo(this.nickname, this.level);
}

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表测试"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            HYButton(),
            HYText()
          ],
        ),
      ),
    );
  }
}

class HYButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: Text("按钮"),
      onPressed: () {
        // 2.发出事件
        final info = UserInfo("coderwhy", 18);
        eventBus.fire(info);
      },
    );
  }
}

class HYText extends StatefulWidget {
  @override
  _HYTextState createState() => _HYTextState();
}

class _HYTextState extends State<HYText> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();

    // 3.监听事件的类型
    eventBus.on<UserInfo>().listen((data) {
      print(data.nickname);
      print(data.level);
      setState(() {
        _message = "${data.nickname}-${data.level}";
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20),);
  }
}



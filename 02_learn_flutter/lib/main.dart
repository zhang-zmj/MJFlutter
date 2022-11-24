import 'package:flutter/material.dart';
import '08_自定义组件/06_自绘组件: DoneWidget/03_SelectDoneWidget.dart';


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
      body: Text("测试Demo"),
    );
  }
}













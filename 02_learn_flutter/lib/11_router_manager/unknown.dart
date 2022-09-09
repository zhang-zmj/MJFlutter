import 'package:flutter/material.dart';

class ZMJUnkownPage extends StatelessWidget {
  const ZMJUnkownPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("错误页面"),
      ),
      body: Center(
        child: Text("错误界面", style: TextStyle(
          fontSize: 20,
          color: Colors.red
        )),
      ),
    );
  }
}

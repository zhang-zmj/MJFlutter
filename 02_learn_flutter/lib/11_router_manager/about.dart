import 'package:flutter/material.dart';

class ZMJAboutPage extends StatelessWidget {
  static const String routeName = "/detail";

  @override
  Widget build(BuildContext context) {

    final String message = ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text("关于页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            ElevatedButton(onPressed: ()=>  Navigator.of(context).pop(), child: Text("返回首页"))
          ],
        ),
      ),
    );
  }
}

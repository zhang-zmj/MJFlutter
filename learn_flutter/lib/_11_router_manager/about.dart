

import 'package:flutter/material.dart';

class ZMJAboutPage extends StatelessWidget {

  static const String routeName = "/about";

  @override
  Widget build(BuildContext context) {

    final String message = ModalRoute.of(context).settings.arguments as String;


    return Scaffold(
      appBar: AppBar(
        title: Text("关于界面"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(message),
            RaisedButton(
                child: Text("返回首页"),
                onPressed: (){
                    Navigator.of(context).pop("123456");
                }
            )
          ],
        ),
      ),
    );
  }
}




import 'package:flutter/material.dart';

class ZMJHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第一个Flutter程序"),
        ),
        body: ZMJContentBody()
    );
  }

}

class ZMJContentBody extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(
        "Hello world",
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontSize: 30,
          color: Colors.red,
        ),
      ),
    );
  }

}



/*
*  1、常用快捷键:
*       StatelessWidget 是 stl
*       抽象类的实现类    是 command + alt + b
*       Widget 转换：    alt + enter
*       抽取一个Widget快捷键：      option + command + s
*
*
*
*
*
*
**/



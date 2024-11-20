import 'package:flutter/material.dart';

class MJLifeStatelessWidget extends StatelessWidget {
  final String message;
  MJLifeStatelessWidget(this.message, {super.key}) {
    debugPrint("构造函数");
  }

  @override
  Widget build(BuildContext context) {
    debugPrint("调用build方法");
    return Scaffold(
        appBar: AppBar(
          title: const Text("首页"),
          backgroundColor: Colors.orange,
        ),
        body: Center(child: Text(message, style: const TextStyle(color: Colors.red, fontSize: 20))));
  }
}



// https://juejin.cn/post/7393304744712208394#heading-13
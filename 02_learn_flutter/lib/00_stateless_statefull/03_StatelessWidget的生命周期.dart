import 'package:flutter/material.dart';

class ZMJHomeContent extends StatelessWidget {

  final String message;
  ZMJHomeContent(this.message){
    print("构造函数被调用");
  }

  @override
  Widget build(BuildContext context) {
    print("调用build方法");
    return Center(
        child: Text(message, style: TextStyle(color: Colors.red, fontSize: 20) )
    );
  }
}



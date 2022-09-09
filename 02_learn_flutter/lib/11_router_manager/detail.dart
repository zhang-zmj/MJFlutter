import 'package:flutter/material.dart';

class ZMJDetailPage extends StatelessWidget {

  static const String routeName = "/detail";
  final String _message;
  ZMJDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      // 当返回为true时,可以自动返回(flutter帮助我们执行返回操作)
      // 当返回为false时, 自行写返回代码
      onWillPop: () {
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("详情页"),
          // leading: IconButton(onPressed: () => _backToHome(context), icon: Icon(Icons.arrow_back)),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_message, style: TextStyle(fontSize: 20)),
              ElevatedButton(onPressed: () => _backToHome(context), child: Text("回到首页"))
            ],
          ),
        ),
      ),
    );
  }
  
  void  _backToHome(BuildContext context){
    Navigator.of(context).pop("from detail message");
  }
  
}


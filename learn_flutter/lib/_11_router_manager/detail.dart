import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ZMJDetailPage extends StatelessWidget {

  static const String routeName = "/detail";
  final String _message;
  ZMJDetailPage(this._message);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(

      //当返回为true是，可以自动返回， 当返回为false，自行写返回代码
      onWillPop: (){
        _backToHome(context);
        return Future.value(false);
      },
      child: Scaffold(
          appBar: AppBar(
            title: Text("详情界面"),

            // leading: IconButton(
            //     icon: Icon(Icons.backspace),
            //     onPressed: (){
            //       _backToHome(context);
            //     }
            // ),

          ),
          body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(_message, style: TextStyle(fontSize: 20)),
                  RaisedButton(
                      child: Text("回到首页"),
                      onPressed: (){
                          _backToHome(context);
                      })
                ],
              )
          )
      ),
    );
  }


  void _backToHome(BuildContext context){

    Navigator.of(context).pop("a detail page");

  }


}

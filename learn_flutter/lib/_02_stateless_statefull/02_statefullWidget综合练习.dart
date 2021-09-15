

import 'package:flutter/material.dart';

main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ZMJHomePage()
    );
  }

}

class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("商品列表"),
      ),
      body: ZMJHomeContent("你好，孩子"),
    );
  }
}


//Widget是不加_的，暴露给别人使用的
class ZMJHomeContent extends StatefulWidget {

  final String message;
  ZMJHomeContent(this.message);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ZMJHomeContentState();
  }

}

//State是加_，状态这个类只是给widget使用
class _ZMJHomeContentState extends State<ZMJHomeContent> {

  int _counter = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(

        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                child: Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
                color: Colors.pink,
                onPressed: () {
                  setState(() {
                    _counter++;
                  });
                },
              ),
              RaisedButton(
                  child: Text("-", style: TextStyle(fontSize: 20, color: Colors.white)),
                  color: Colors.purple,
                  onPressed: () {
                    setState(() {
                      _counter--;
                    });
                  }
              ),
            ],
          ),
          Text("当前计数：$_counter", style: TextStyle(fontSize: 25)),
          Text("传递的信息，${widget.message}", style: TextStyle(fontSize: 25))

        ],
      ),
    );
  }

}


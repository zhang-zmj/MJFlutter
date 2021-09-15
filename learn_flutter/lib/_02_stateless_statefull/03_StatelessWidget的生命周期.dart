
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
      body: ZMJHomeContent(),
    );
  }
}

class ZMJHomeContent extends StatelessWidget {

  final String message;
  ZMJHomeContent(this.message){
    print("构造函数被调用");
  }

  @override
  Widget build(BuildContext context) {
    print("调用build方法");
    return Text(message);
  }

}





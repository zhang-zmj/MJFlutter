import 'package:flutter/material.dart';
import 'home_content.dart';

class ZMJHomePage extends StatefulWidget {
  @override
  _ZMJHomePageState createState() => _ZMJHomePageState();
}

class _ZMJHomePageState extends State<ZMJHomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: ZMJHomeContent(),
    );
  }

}



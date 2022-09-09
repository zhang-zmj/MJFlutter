import 'package:flutter/material.dart';
import '03_FadeRoute.dart';

class PageB extends StatefulWidget {
  const PageB({Key? key}) : super(key: key);

  @override
  State<PageB> createState() => _PageBState();
}

class _PageBState extends State<PageB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(child: Container(
        child: ElevatedButton(
            child: Text("返回首页"),
            onPressed: () {
                Navigator.pop(context);
            }
        ),
      )),
    );
  }
}

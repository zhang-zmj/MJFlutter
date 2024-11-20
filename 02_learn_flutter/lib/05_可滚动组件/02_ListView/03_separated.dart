import 'package:flutter/material.dart';

class MJSeparatedWidget extends StatefulWidget {
  const MJSeparatedWidget({super.key});

  @override
  State<MJSeparatedWidget> createState() => _MJSeparatedWidgetState();
}

class _MJSeparatedWidgetState extends State<MJSeparatedWidget> {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定以供复用
    Widget divider1 = const Divider(color: Colors.blue);
    Widget divider2 = const Divider(color: Colors.green);
    return ListView.separated(
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("--------$index"));
        },
        separatorBuilder: (BuildContext context, int index) {
          return index % 2 == 0 ? divider1 : divider2;
        },
        itemCount: 100);
  }
}

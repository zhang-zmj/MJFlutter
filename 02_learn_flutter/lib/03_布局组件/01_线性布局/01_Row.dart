import 'package:flutter/material.dart';

class MJRowWidget extends StatefulWidget {
  const MJRowWidget({super.key});

  @override
  State<MJRowWidget> createState() => _MJRowWidgetState();
}

class _MJRowWidgetState extends State<MJRowWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("hello world 哦哦哦哦"),
            Text("哈哈哈哈I am Jack"),
          ],
        ),
        Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [Text("hello world----"), Text("I am Jack")],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.ltr,
          children: [Text("----hello world"), Text("I am Jack")],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [Text("hello ---- world", style: TextStyle(fontSize: 30)), Text("I am Jack")],
        ),
      ],
    );
  }
}

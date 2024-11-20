import 'package:flutter/material.dart';

class MJBuilderWidget extends StatefulWidget {
  const MJBuilderWidget({super.key});

  @override
  State<MJBuilderWidget> createState() => _MJBuilderWidgetState();
}

class _MJBuilderWidgetState extends State<MJBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 35,
        itemExtent: 50, // 高度
        itemBuilder: (BuildContext context, int index) {
          return ListTile(title: Text("---------$index"));
        });
  }
}

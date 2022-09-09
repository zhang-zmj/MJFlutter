import 'package:flutter/material.dart';

class ColumnWidget extends StatefulWidget {
  const ColumnWidget({Key? key}) : super(key: key);

  @override
  State<ColumnWidget> createState() => _ColumnWidgetState();
}

class _ColumnWidgetState extends State<ColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints(minHeight: double.infinity),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text("hi"),
            Text("world")
          ],
        ),
    );
  }
}

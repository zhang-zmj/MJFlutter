import 'package:flutter/material.dart';

class CenterWidget extends StatefulWidget {
  const CenterWidget({Key? key}) : super(key: key);

  @override
  State<CenterWidget> createState() => _CenterWidgetState();
}

class _CenterWidgetState extends State<CenterWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              child: Text("xxxx"),
            ),
        ),
        SizedBox(height: 25),
        DecoratedBox(
            decoration: BoxDecoration(color: Colors.red),
            child: Center(
              widthFactor: 1,
              heightFactor: 1,
              child: Text("xxxx"),
            ),
        )
      ],
    );
  }
}

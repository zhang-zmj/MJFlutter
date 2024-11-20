import 'package:flutter/material.dart';

// DecoratedBox 装饰器
class MJCenterWidget extends StatefulWidget {
  const MJCenterWidget({super.key});

  @override
  State<MJCenterWidget> createState() => _MJCenterWidgetState();
}

class _MJCenterWidgetState extends State<MJCenterWidget> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(color: Colors.red),
          child: Center(
            child: Text(
              "xxxxxxxx",
            ),
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

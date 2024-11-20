import 'package:flutter/material.dart';
import './02_HitTestBlocker.dart';

class HitTestBlockerWidget extends StatelessWidget {
  const HitTestBlockerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [HitTestBlocker(child: wChild(1, 200)), HitTestBlocker(child: wChild(2, 200))]);
  }

  Widget wChild(int index, double size) {
    return GestureDetector(
      onTap: () => debugPrint('$index'),
      child: Container(
        width: size,
        height: size,
        color: Colors.red,
      ),
    );
  }
}

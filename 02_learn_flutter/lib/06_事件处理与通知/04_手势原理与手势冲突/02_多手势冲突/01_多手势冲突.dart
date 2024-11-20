import 'package:flutter/material.dart';

/*
由于手势竞争最终只有一个胜出者，所以，
   当我们通过一个 GestureDetector 监听多种手势时，也可能会产生冲突
*/

class GestureConflictWidget extends StatefulWidget {
  const GestureConflictWidget({super.key});

  @override
  State<GestureConflictWidget> createState() => _GestureConflictWidgetState();
}

class _GestureConflictWidgetState extends State<GestureConflictWidget> {
  double _left = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            left: _left,
            child: GestureDetector(
              //要拖动和点击的widget
              child: const CircleAvatar(child: Text("A")),
              onHorizontalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _left += details.delta.dx;
                });
              },
              onHorizontalDragEnd: (details) {
                debugPrint("onHorizontalDragEnd");
              },
              onTapDown: (details) {
                debugPrint("down");
              },
              onTapUp: (details) {
                debugPrint("up");
              },
            ))
      ],
    );
  }
}

import 'package:flutter/material.dart';

class GestureConflictWidget extends StatefulWidget {
  const GestureConflictWidget({super.key});
  @override
  State<GestureConflictWidget> createState() => _GestureConflictWidgetState();
}

class _GestureConflictWidgetState extends State<GestureConflictWidget> {
  double _leftB = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: 80,
            left: _leftB,
            child: Listener(
              onPointerDown: (details) {
                debugPrint("down");
              },
              onPointerUp: (details) {
                //会触发
                debugPrint("up");
              },
              child: GestureDetector(
                  child: const CircleAvatar(child: Text("B")),
                  onHorizontalDragUpdate: (DragUpdateDetails details) {
                    setState(() {
                      _leftB += details.delta.dx;
                    });
                  },
                  onHorizontalDragEnd: (details) {
                    debugPrint("onHorizontalDragEnd");
                  }),
            ))
      ],
    );
  }
}

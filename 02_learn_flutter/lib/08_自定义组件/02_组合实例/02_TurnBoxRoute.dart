import 'package:flutter/material.dart';
import '01_TurnBox.dart';

class TurnBoxRoute extends StatefulWidget {
  const TurnBoxRoute({super.key});
  @override
  State<TurnBoxRoute> createState() => _TurnBoxRouteState();
}

class _TurnBoxRouteState extends State<TurnBoxRoute> {
  double _turns = .0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        TurnBox(
          turns: _turns,
          speed: 500,
          child: const Icon(
            Icons.refresh,
            size: 50,
          ),
        ),
        TurnBox(
          turns: _turns,
          speed: 1000,
          child: const Icon(
            Icons.refresh,
            size: 150,
          ),
        ),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _turns += .2;
              });
            },
            child: const Text("顺时针旋转1/5圈")),
        ElevatedButton(
            onPressed: () {
              setState(() {
                _turns -= .2;
              });
            },
            child: const Text("逆时针旋转1/5圈"))
      ]),
    );
  }
}

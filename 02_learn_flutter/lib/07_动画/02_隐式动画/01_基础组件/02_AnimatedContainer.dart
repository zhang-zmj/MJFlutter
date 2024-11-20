import 'package:flutter/material.dart';
import 'dart:math';

double randomBorderRadius() {
  return Random().nextDouble() * 64;
}

double randomMargin() {
  return Random().nextDouble() * 64;
}

Color randomColor() {
  return Color(0xFFFFFFFF & Random().nextInt(0xFFFFFFFF));
}

class MJAnimatedContainerPage extends StatefulWidget {
  const MJAnimatedContainerPage({super.key});
  @override
  State<MJAnimatedContainerPage> createState() => _MJAnimatedContainerPageState();
}

class _MJAnimatedContainerPageState extends State<MJAnimatedContainerPage> {
  bool isScale = false;
  late Color color;
  late double borderRadius;
  late double margin;

  @override
  void initState() {
    super.initState();
    color = randomColor();
    borderRadius = randomBorderRadius();
    margin = randomMargin();
  }

  void change() {
    setState(() {
      color = randomColor();
      borderRadius = randomBorderRadius();
      margin = randomMargin();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: <Widget>[
          SizedBox(
            width: 128,
            height: 128,
            child: AnimatedContainer(
              margin: EdgeInsets.all(margin),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              duration: const Duration(milliseconds: 500),
            ),
          ),
          ElevatedButton(
            child: const Text('Change'),
            onPressed: () {
              change();
            },
          ),
        ],
      ),
    );
  }
}

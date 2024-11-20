import 'package:flutter/material.dart';
import 'dart:math';

class MJAnimatedPositionedPage extends StatefulWidget {
  const MJAnimatedPositionedPage({super.key});

  @override
  State<MJAnimatedPositionedPage> createState() => _MJAnimatedPositionedPageState();
}

class _MJAnimatedPositionedPageState extends State<MJAnimatedPositionedPage> {
  EdgeInsets leftPadding = const EdgeInsets.only(left: 0, top: 0);
  bool isTopLeft = true;

  void change() {
    setState(() {
      isTopLeft = !isTopLeft;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('AnimatedPositioned动画'),
        ),
        body: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(seconds: 2),
              top: isTopLeft ? 0 : 200,
              left: 0,
              child: Container(
                width: 100,
                height: 100,
                alignment: Alignment.center,
                color: Colors.blue,
                child: const Text('Hello World!'),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              change();
            }));
  }
}

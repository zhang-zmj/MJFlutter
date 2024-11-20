import 'package:flutter/material.dart';
import 'dart:math';

class MJAnimatedPaddingPage extends StatefulWidget {
  const MJAnimatedPaddingPage({super.key});

  @override
  State<MJAnimatedPaddingPage> createState() => _MJAnimatedPaddingPageState();
}

class _MJAnimatedPaddingPageState extends State<MJAnimatedPaddingPage> {
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
          title: const Text('AnimatedPadding动画'),
        ),
        body: AnimatedPadding(
          padding: EdgeInsets.only(left: isTopLeft ? 100 : 0, top: isTopLeft ? 0 : 200),
          duration: const Duration(seconds: 2),
          child: Container(
            width: 100,
            height: 100,
            alignment: Alignment.center,
            color: Colors.blue,
            child: const Text('Hello World!'),
          ),
        ),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add),
            onPressed: () {
              change();
            }));
  }
}

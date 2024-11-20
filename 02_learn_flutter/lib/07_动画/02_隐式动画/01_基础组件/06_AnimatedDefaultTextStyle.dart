// 通过修改文本的属性，实现文本的动画效果。

import 'package:flutter/material.dart';

class MJAnimationDefaultTextStylePage extends StatefulWidget {
  const MJAnimationDefaultTextStylePage({super.key});

  @override
  State<MJAnimationDefaultTextStylePage> createState() => _MJAnimationDefaultTextStylePageState();
}

class _MJAnimationDefaultTextStylePageState extends State<MJAnimationDefaultTextStylePage> {
  bool flag = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          setState(() {
            flag = !flag;
          });
        },
      ),
      appBar: AppBar(
        title: const Text('AnimatedDefaultTextStyle动画'),
      ),
      body: Center(
        child: AnimatedDefaultTextStyle(
          duration: const Duration(seconds: 1),
          style: TextStyle(
              fontSize: flag ? 10 : 20,
              color: flag ? Colors.teal : Colors.black,
              fontWeight: flag ? FontWeight.bold : FontWeight.normal),
          child: const Text("AnimatedDefaultTextStyle动画"),
        ),
      ),
    );
  }
}

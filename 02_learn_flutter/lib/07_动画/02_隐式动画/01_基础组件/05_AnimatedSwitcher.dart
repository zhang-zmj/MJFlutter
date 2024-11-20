// 当我们切换组件的时候，我们需要为旧的组件和新的Widget设置一个不同的key，动画效果才会生效

import 'package:flutter/material.dart';

class MJAnimationsSwitcherPage extends StatefulWidget {
  const MJAnimationsSwitcherPage({super.key});
  @override
  State<MJAnimationsSwitcherPage> createState() => _MJAnimationsSwitcherPageState();
}

class _MJAnimationsSwitcherPageState extends State<MJAnimationsSwitcherPage> {
  bool isCompleted = false;
  int keyValue = 0;
  Widget completedWidget() {
    return GestureDetector(
      key: ValueKey<int>(keyValue),
      child: Container(
        width: 100,
        height: 40,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.black12, borderRadius: BorderRadius.all(Radius.circular(20))),
        child: const Text(
          '点击完成',
          style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
        ),
      ),
      onTap: () {
        setState(() {
          keyValue++;
          isCompleted = !isCompleted;
        });
      },
    );
  }

  Widget normalWidget() {
    return GestureDetector(
      key: ValueKey<int>(keyValue),
      child: Container(
        width: 50,
        height: 50,
        alignment: Alignment.center,
        decoration: const BoxDecoration(color: Colors.green, borderRadius: BorderRadius.all(Radius.circular(25))),
        child: const Icon(Icons.check),
      ),
      onTap: () {
        setState(() {
          keyValue++;
          isCompleted = !isCompleted;
        });
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("AnimationSwitcher动画"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: isCompleted ? completedWidget() : normalWidget(),
            ),
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

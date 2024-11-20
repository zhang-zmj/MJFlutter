import 'package:flutter/material.dart';

class MJTweenAnimationScaleExample extends StatefulWidget {
  const MJTweenAnimationScaleExample({super.key});

  @override
  State<MJTweenAnimationScaleExample> createState() => _MJTweenAnimationScaleExampleState();
}

class _MJTweenAnimationScaleExampleState extends State<MJTweenAnimationScaleExample> {
  bool changeRedToBlue = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('补间动画实现缩放动画效果'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TweenAnimationBuilder<Color?>(
            tween: ColorTween(
                begin: changeRedToBlue ? Colors.yellow : Colors.red, end: changeRedToBlue ? Colors.red : Colors.yellow),
            duration: const Duration(seconds: 1),
            builder: (BuildContext context, Color? color, Widget? child) {
              return ColorFiltered(
                colorFilter: ColorFilter.mode(color!, BlendMode.modulate),
                child: child,
              );
            },
            child: Image.asset(
              'images/avatar.png',
              width: 200,
              height: 200,
            ), // 示例图片路径
          ),
          const SizedBox(
            height: 50,
          ),
          FilledButton(
              onPressed: () {
                setState(() {
                  changeRedToBlue = !changeRedToBlue;
                });
              },
              child: const Text('Toggle Color')),
        ],
      ),
    );
  }
}

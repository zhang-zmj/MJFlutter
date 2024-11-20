import 'package:flutter/material.dart';

class StaggerAnimation extends StatelessWidget {
  StaggerAnimation({super.key, required this.controller}) {
    //高度动画
    height = Tween<double>(begin: 0, end: 300)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.6, curve: Curves.ease)));

    color = ColorTween(begin: Colors.green, end: Colors.red)
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.0, 0.6, curve: Curves.ease)));

    padding = Tween<EdgeInsets>(begin: const EdgeInsets.only(left: .0), end: const EdgeInsets.only(left: 100.0))
        .animate(CurvedAnimation(parent: controller, curve: const Interval(0.6, 1.0, curve: Curves.ease)));
    //间隔，后40%的动画时间
  }

  late final Animation<double> controller;
  late final Animation<double> height;
  late final Animation<EdgeInsets> padding;
  late final Animation<Color?> color;

  Widget _buildAnimation(BuildContext context, child) {
    return Container(
      alignment: Alignment.bottomCenter,
      padding: padding.value,
      child: Container(color: color.value, width: 50, height: height.value),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(animation: controller, builder: _buildAnimation);
  }
}

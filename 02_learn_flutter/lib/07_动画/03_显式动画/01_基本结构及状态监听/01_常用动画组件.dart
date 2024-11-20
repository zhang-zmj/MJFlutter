import 'package:flutter/material.dart';

class MJRotateAnimationDemos extends StatefulWidget {
  const MJRotateAnimationDemos({super.key});

  @override
  State<MJRotateAnimationDemos> createState() => _MJRotateAnimationDemosState();
}

class _MJRotateAnimationDemosState extends State<MJRotateAnimationDemos> with SingleTickerProviderStateMixin {
  // 定义AnimationController
  late AnimationController controller;

  //初始化 AnimationController
  @override
  void initState() {
    super.initState();
    //vsync: 让程序和手机的刷新频率统一
    controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
      lowerBound: 0.1,
      upperBound: 1.0,
    )..repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: RotationTransition(
        turns: controller,
        child: const FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

/*
  RotationTransition主要用来做旋转动画。
  FadeTransition用于制作透明度动画。
  ScaleTransition用于制作缩放动画。
  SlideTransition用于做平移动画。
*/ 
import 'package:flutter/material.dart';

class MJScaleAnimationRoute extends StatefulWidget {
  const MJScaleAnimationRoute({super.key});

  @override
  State<MJScaleAnimationRoute> createState() => _MJScaleAnimationRouteState();
}

class _MJScaleAnimationRouteState extends State<MJScaleAnimationRoute> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);
    //启动动画
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: animation,
      child: Image.asset("images/avatar.png"),
      builder: (BuildContext ctx, child) {
        return Center(
          child: SizedBox(
            height: animation.value,
            width: animation.value,
            child: child,
          ),
        );
      },
    );
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

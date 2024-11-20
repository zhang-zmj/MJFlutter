import 'package:flutter/material.dart';

class MJTransitionAnimationRoute extends StatefulWidget {
  const MJTransitionAnimationRoute({super.key});
  @override
  State<MJTransitionAnimationRoute> createState() => _MJTransitionAnimationRouteState();
}

class _MJTransitionAnimationRouteState extends State<MJTransitionAnimationRoute> with SingleTickerProviderStateMixin {
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
    return GrowTransition(animation: animation, child: Image.asset("images/avatar.png"));
  }

  @override
  dispose() {
    //路由销毁时需要释放动画资源
    controller.dispose();
    super.dispose();
  }
}

class GrowTransition extends StatelessWidget {
  const GrowTransition({super.key, this.child, required this.animation});

  final Widget? child;
  final Animation<double> animation;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return SizedBox(height: animation.value, width: animation.value, child: child);
        },
        child: child,
      ),
    );
  }
}

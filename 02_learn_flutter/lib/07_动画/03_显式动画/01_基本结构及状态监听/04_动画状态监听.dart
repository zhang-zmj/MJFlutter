import 'package:flutter/material.dart';

class MJStatusAnimationRoute extends StatefulWidget {
  const MJStatusAnimationRoute({super.key});
  @override
  State<MJStatusAnimationRoute> createState() => _MJStatusAnimationRouteState();
}

class _MJStatusAnimationRouteState extends State<MJStatusAnimationRoute> with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  initState() {
    super.initState();
    controller = AnimationController(duration: const Duration(seconds: 2), vsync: this);
    //图片宽高从0变到300
    animation = Tween(begin: 0.0, end: 300.0).animate(controller);

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        //动画执行结束时反向执行动画
        controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        //动画恢复到初始状态时执行动画（正向）
        controller.forward();
      }
    });

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

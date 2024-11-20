import 'package:flutter/material.dart';
import 'dart:math';

class MJComplexAnimationExample extends StatefulWidget {
  const MJComplexAnimationExample({super.key});
  @override
  State<MJComplexAnimationExample> createState() => _MJComplexAnimationExampleState();
}

class _MJComplexAnimationExampleState extends State<MJComplexAnimationExample> {
  bool _isAnimated = false;

  void _toggleAnimation() {
    setState(() {
      _isAnimated = !_isAnimated;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: _toggleAnimation,
        child: TweenAnimationBuilder(
          duration: const Duration(seconds: 2),
          tween: Tween<double>(begin: 0, end: _isAnimated ? 2 * pi : 0),
          builder: (context, double rotation, child) {
            return Transform.rotate(
              angle: rotation,
              child: TweenAnimationBuilder(
                duration: const Duration(seconds: 2),
                tween: ColorTween(begin: Colors.purple, end: _isAnimated ? Colors.orange : Colors.purple),
                builder: (context, Color? color, child) {
                  return TweenAnimationBuilder(
                    duration: const Duration(seconds: 2),
                    tween: BorderRadiusTween(
                        begin: BorderRadius.circular(10), end: BorderRadius.circular(_isAnimated ? 75 : 10)),
                    builder: (context, BorderRadius? borderRadius, child) {
                      return TweenAnimationBuilder(
                        duration: const Duration(seconds: 2),
                        tween: Tween<double>(begin: 100, end: _isAnimated ? 200 : 100),
                        builder: (context, double size, child) {
                          return Container(
                            width: size,
                            height: size,
                            decoration: BoxDecoration(
                              color: color,
                              borderRadius: borderRadius,
                            ),
                            child: child,
                          );
                        },
                        child: const Center(
                          child: Text(
                            '点击看动画!',
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

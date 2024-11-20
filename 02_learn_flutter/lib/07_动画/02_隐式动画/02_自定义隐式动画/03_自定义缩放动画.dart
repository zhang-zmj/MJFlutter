import 'package:flutter/material.dart';

class MJCustomScaleAnimationScaleExample extends StatefulWidget {
  const MJCustomScaleAnimationScaleExample({super.key});

  @override
  State<MJCustomScaleAnimationScaleExample> createState() => _MJCustomScaleAnimationScaleExampleState();
}

class _MJCustomScaleAnimationScaleExampleState extends State<MJCustomScaleAnimationScaleExample> {
  bool changeRedToBlue = false;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TweenAnimationBuilder<double>(
        tween: Tween<double>(begin: 0.0, end: 1.0),
        duration: const Duration(seconds: 2),
        builder: (BuildContext context, double value, Widget? child) {
          return Transform.scale(
            // Transform.rotate、Transform.translate、
            scale: value,
            child: child,
          );
        },
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: const Center(
            child: Text(
              'Scale Me!',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

class MJNumberTransitionExample extends StatefulWidget {
  const MJNumberTransitionExample({super.key});

  @override
  State<MJNumberTransitionExample> createState() => _MJNumberTransitionExampleState();
}

class _MJNumberTransitionExampleState extends State<MJNumberTransitionExample> {
  bool _isAnimating = false;

  void _toggleAnimation() {
    setState(() {
      _isAnimating = !_isAnimating;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        child: TweenAnimationBuilder(
          tween: IntTween(begin: 1000, end: _isAnimating ? 2000 : 1000),
          duration: const Duration(seconds: 3),
          onEnd: () => debugPrint("Animation Complete"),
          builder: (context, int value, child) {
            return Text(
              '$value',
              style: const TextStyle(fontSize: 48, fontWeight: FontWeight.bold),
            );
          },
        ),
        onTap: () {
          _toggleAnimation();
        },
      ),
    );
  }
}

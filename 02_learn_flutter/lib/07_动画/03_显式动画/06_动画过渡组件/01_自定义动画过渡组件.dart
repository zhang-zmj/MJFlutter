import 'package:flutter/material.dart';

class DecoratedWidget extends StatefulWidget {
  const DecoratedWidget({super.key});
  @override
  State<DecoratedWidget> createState() => _DecoratedWidgetState();
}

class _DecoratedWidgetState extends State<DecoratedWidget> {
  Color _decorationColor = Colors.blue;
  var duration = const Duration(seconds: 1);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: AnimatedDecoratedBox(
        duration: duration,
        decoration: BoxDecoration(color: _decorationColor),
        child: TextButton(
          onPressed: () {
            setState(() {
              _decorationColor = Colors.red;
            });
          },
          child: const Text(
            "AnimatedDecoratedBox",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}

class AnimatedDecoratedBox extends StatefulWidget {
  const AnimatedDecoratedBox(
      {super.key,
      required this.decoration,
      required this.child,
      required this.duration,
      this.curve = Curves.linear,
      this.reverseDuration});

  final BoxDecoration decoration;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Duration? reverseDuration;

  @override
  State<AnimatedDecoratedBox> createState() => _AnimatedDecoratedBoxState();
}

class _AnimatedDecoratedBoxState extends State<AnimatedDecoratedBox> with SingleTickerProviderStateMixin {
  @protected
  AnimationController get controller => _controller;
  late AnimationController _controller;

  Animation<double> get animation => _animation;
  late Animation<double> _animation;
  late DecorationTween _tween;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return DecoratedBox(
          decoration: _tween.animate(_animation).value,
          child: child,
        );
      },
      child: widget.child,
    );
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: widget.duration,
      reverseDuration: widget.reverseDuration,
      vsync: this,
    );
    _tween = DecorationTween(begin: widget.decoration);
    _updateCurve();
  }

  void _updateCurve() {
    _animation = CurvedAnimation(parent: _controller, curve: widget.curve);
  }

  @override
  void didUpdateWidget(AnimatedDecoratedBox oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.curve != oldWidget.curve) _updateCurve();
    _controller.duration = widget.duration;
    _controller.reverseDuration = widget.reverseDuration;
    //正在执行过渡动画
    if (widget.decoration != (_tween.end ?? _tween.begin)) {
      _tween
        ..begin = _tween.evaluate(_animation)
        ..end = widget.decoration;

      _controller
        ..value = 0.0
        ..forward();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}

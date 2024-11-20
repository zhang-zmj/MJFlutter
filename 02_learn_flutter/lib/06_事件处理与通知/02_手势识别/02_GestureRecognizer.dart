import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';

/*
  ‌Flutter中的GestureRecognizer有多种类型，主要包括以下几种‌：
    * ‌TapGestureRecognizer‌：用于检测轻触手势。
    * ‌DoubleTapGestureRecognizer‌：用于检测双击手势。
    * ‌LongPressGestureRecognizer‌：用于检测长按手势。
    * ‌VerticalDragGestureRecognizer‌：用于检测垂直拖动手势。
    * ‌HorizontalDragGestureRecognizer‌：用于检测水平拖动手势。
    * ‌PanGestureRecognizer‌：用于检测移动拖动手势。
    * ScaleGestureRecognizer‌：用于检测缩放手势。
    * ‌ForcePressGestureRecognizer‌：用于检测压力手势。
    * ‌MultiTapGestureRecognizer‌：用于检测多次点击手势。
    * ‌MultiDragGestureRecognizer‌：用于检测多指拖拽手势，包括水平、垂直、延迟、立即等多种变体。
*/

class GestureRecognizerWidget extends StatefulWidget {
  const GestureRecognizerWidget({
    super.key,
  });

  @override
  State<GestureRecognizerWidget> createState() => _GestureRecognizerWidgetState();
}

class _GestureRecognizerWidgetState extends State<GestureRecognizerWidget> {
  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关

  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        const TextSpan(text: "你好世界"),
        TextSpan(
            text: "点我变色",
            style: TextStyle(
              fontSize: 30.0,
              color: _toggle ? Colors.blue : Colors.red,
            ),
            recognizer: _tapGestureRecognizer
              ..onTap = () {
                setState(() {
                  _toggle = !_toggle;
                });
              }),
        const TextSpan(text: "你好世界"),
      ])),
    );
  }
}

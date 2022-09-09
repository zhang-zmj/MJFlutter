import 'package:flutter/material.dart';

/*
原始指针(pointer)事件：它描述了屏幕上指针（例如，触摸、鼠标和触控笔）的位置和移动(很少用到pointer)
 * onPointerDown    手指按下
 * onPointerMove    手指移动
 * onPointerUp      手指抬起
 * onPointerCancel   触摸事件取消
 * behavior

参数：
  * position：相对于全局坐标的偏移
  * localPosition: 相对于组件自身偏移
  * delta：  两次指针移动事件的距离
  * pressure：按压力度
  * orientation：指针移动方向，是一个角度值
 */

class PointerMoveIndicator extends StatefulWidget {
  const PointerMoveIndicator({
    Key? key,
  }) : super(key: key);

  @override
  State<PointerMoveIndicator> createState() => _PointerMoveIndicatorState();
}

class _PointerMoveIndicatorState extends State<PointerMoveIndicator> {
  PointerEvent? _event;

  @override
  Widget build(BuildContext context) {
    return Listener(
      child: Center(
        child: Container(
          width: 200,
          height: 200,
          color: Colors.red,
          child: Text( '${_event?.localPosition ?? ''}', style: TextStyle(color: Colors.white) ),
        ),
      ),
      onPointerDown: (PointerDownEvent event) => setState(() => _event = event),
      onPointerMove: (PointerMoveEvent event) => setState(() => _event = event),
      onPointerUp: (PointerUpEvent event) => setState(() => _event = event),
    );
  }
}





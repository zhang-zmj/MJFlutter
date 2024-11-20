import 'package:flutter/material.dart';

//4、缩放
class ScaleWidget extends StatefulWidget {
  const ScaleWidget({
    super.key,
  });
  @override
  State<ScaleWidget> createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget> {
  double width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          child: Image(
            width: width,
            image: const NetworkImage("https://q2.itc.cn/q_70/images01/20240304/689c3259171141b98b614f14179e7975.jpeg"),
          ),
          onScaleUpdate: (ScaleUpdateDetails details) {
            setState(() {
              //缩放倍数在0.8到10倍之间
              width = 200 * details.scale.clamp(2, 10.0);
              debugPrint('The value is: ${width.toString()}');
            });
          }),
    );
  }
}

class $ {}

//3、单一方向拖动
class _DragVertical extends StatefulWidget {
  const _DragVertical();

  @override
  State<_DragVertical> createState() => _DragVerticalState();
}

class _DragVerticalState extends State<_DragVertical> {
  double _top = 0.0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            child: GestureDetector(
              child: const CircleAvatar(child: Text("A")),
              //垂直防线拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details) {
                setState(() {
                  _top += details.delta.dy;
                });
              },
            ))
      ],
    );
  }
}

//2、手势的拖动、滑动
class _Drag extends StatefulWidget {
  const _Drag();

  @override
  State<_Drag> createState() => _DragState();
}

class _DragState extends State<_Drag> {
  double _top = 0.0; //距顶部的偏移
  double _left = 0.0; //距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: const CircleAvatar(child: Text("A")),
              onPanDown: (DragDownDetails e) {
                debugPrint("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e) {
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                debugPrint(e.velocity as String?);
              },
            ))
      ],
    );
  }
}

//1、手势的点击，双击，长按
class SingleGestureDemo extends StatefulWidget {
  const SingleGestureDemo({
    super.key,
  });
  @override
  State<SingleGestureDemo> createState() => _SingleGestureDemoState();
}

class _SingleGestureDemoState extends State<SingleGestureDemo> {
  String _operation = "No Gesture detected!"; //保存事件名

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        width: 200,
        height: 200,
        color: Colors.orange,
        child: Text(
          _operation,
          style: const TextStyle(color: Colors.white),
        ),
      ),
      onTapDown: (details) {
        debugPrint("手指按下");
        debugPrint(details.globalPosition as String?);
        debugPrint(details.localPosition as String?);
      },
      onTapUp: (details) {
        debugPrint("手指抬起");
      },
      onPanCancel: () {
        debugPrint("手势取消");
      },
      onTap: () {
        updateText("手势点击"); //点击
      },
      onDoubleTap: () {
        //双击时点击不触发，他们之间有时间间隔
        debugPrint("手指双击");
      },
      onLongPress: () {
        debugPrint("长按手势");
      },
    );
  }

  void updateText(String text) {
    //更新显示的事件名
    setState(() {
      _operation = text;
    });
  }
}

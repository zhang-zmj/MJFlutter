import 'package:flutter/material.dart';


/*
如果对一个组件同时监听水平和垂直方向的拖动手势，当我们斜着拖动时哪个方向的拖动手势回调会被触发？
   实际上取决于第一次移动时两个轴上的位移分量，哪个轴的大，哪个轴在本次滑动事件竞争中就胜出
*/
class BothDirectionWidget extends StatefulWidget {
  const BothDirectionWidget({Key? key}) : super(key: key);
  @override
  State<BothDirectionWidget> createState() => _BothDirectionWidgetState();
}

class _BothDirectionWidgetState extends State<BothDirectionWidget> {

  double _top = 0.0;
  double _left = 0.0;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              //垂直方向拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _top += details.delta.dy;
                });
              },
              onHorizontalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _left += details.delta.dx;
                });
              },
            )
        )
      ],
    );
  }
}






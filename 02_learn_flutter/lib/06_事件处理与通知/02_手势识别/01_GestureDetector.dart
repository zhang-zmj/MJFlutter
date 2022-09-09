import 'package:flutter/material.dart';


//4、缩放
class ScaleWidget extends StatefulWidget {
  const ScaleWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<ScaleWidget> createState() => _ScaleWidgetState();
}

class _ScaleWidgetState extends State<ScaleWidget> {

  double _width = 200.0; //通过修改图片宽度来达到缩放效果
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
          child: Image(
            width: _width,
            image:  NetworkImage( "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1115%2F101021113337%2F211010113337-6-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1645711130&t=00ef68feba2a74febf3ec69d2dfd79bc"),
          ),
          onScaleUpdate: (ScaleUpdateDetails details){
            setState(() {
              //缩放倍数在0.8到10倍之间
              _width = 200*details.scale.clamp(2, 10.0);
              print(_width);
            });
          }
      ),
    );
  }
}





//3、单一方向拖动
class _DragVertical extends StatefulWidget {
  const _DragVertical({
    Key? key,
  }) : super(key: key);

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
              child: CircleAvatar(child: Text("A")),
              //垂直防线拖动事件
              onVerticalDragUpdate: (DragUpdateDetails details){
                setState(() {
                  _top += details.delta.dy;
                });
              },
            )
        )
      ],
    );
  }
}



//2、手势的拖动、滑动
class _Drag extends StatefulWidget {
  const _Drag({
    Key? key,
  }) : super(key: key);

  @override
  State<_Drag> createState() => _DragState();
}

class _DragState extends State<_Drag> {

  double _top = 0.0; //距顶部的偏移
  double _left = 0.0;//距左边的偏移
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
            top: _top,
            left: _left,
            child: GestureDetector(
              child: CircleAvatar(child: Text("A")),
              onPanDown: (DragDownDetails e){
                print("用户手指按下：${e.globalPosition}");
              },
              onPanUpdate: (DragUpdateDetails e){
                //用户手指滑动时，更新偏移，重新构建
                setState(() {
                  _left += e.delta.dx;
                  _top += e.delta.dy;
                });
              },
              onPanEnd: (DragEndDetails e) {
                print(e.velocity);
              },

            )
        )
      ],
    );
  }
}







//1、手势的点击，双击，长按
class SingleGestureDemo extends StatefulWidget {
  const SingleGestureDemo({
    Key? key,
  }) : super(key: key);
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
          style: TextStyle(color: Colors.white),
        ),
      ),

      onTapDown: (details) {
        print("手指按下");
        print(details.globalPosition);
        print(details.localPosition);
      },
      onTapUp: (details){
        print("手指抬起");
      },
      onPanCancel: (){
        print("手势取消");
      },
      onTap: (){
        updateText("手势点击"); //点击
      },
      onDoubleTap: (){
        //双击时点击不触发，他们之间有时间间隔
        print("手指双击");
      },
      onLongPress: (){
        print("长按手势");
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


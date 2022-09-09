import 'package:flutter/material.dart';
import 'dart:math' as math;

class TransformWidget extends StatefulWidget {
  const TransformWidget({Key? key}) : super(key: key);

  @override
  State<TransformWidget> createState() => _TransformWidgetState();
}

class _TransformWidgetState extends State<TransformWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
          children: [
            SizedBox(height: 25),
            //1、平移
            DecoratedBox(
              decoration: BoxDecoration(color: Colors.red),
              child: Transform.translate(
                offset: Offset(-20, -5),
                child: Text("Hello World"),
              ),
            ),

            SizedBox(height: 55),
            //2、旋转
            DecoratedBox(decoration: BoxDecoration(color: Colors.red),
            child: Transform.rotate(
                //旋转90度
                angle: math.pi/2,
                child: Text("Hello World"),
            )),

            SizedBox(height: 55),
            //3、缩放
            DecoratedBox(decoration: BoxDecoration(color: Colors.red),
              child: Transform.scale(
                scale: 1.5,
                child: Text("Hello world")
              ),
            ),

            SizedBox(height: 55),

            //4、RotatedBox的变换是在layout阶段，会影响在子组件的位置和大小
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DecoratedBox(decoration: BoxDecoration(color: Colors.red),
                child: RotatedBox(
                    quarterTurns: 1,
                  child: Text("Hello world"),
                )),
                Text("你好啊", style: TextStyle(color: Colors.green, fontSize: 18))
              ],
            )
          ],
     )
    );
  }
}

/*
  * 变换是应用在绘制阶段，而并不是应用在布局(layout)阶段，所以无论对子组件应用何种变化，
    其占用空间的大小和在屏幕上的位置都是固定不变的，因为这些是在布局阶段就确定的

  * 由于矩阵变化只会作用在绘制阶段，所以在某些场景下，在UI需要变化时，
    可以直接通过矩阵变化来达到视觉上的UI改变，而不需要去重新触发build流程，
    这样会节省layout的开销，所以性能会比较好

*/





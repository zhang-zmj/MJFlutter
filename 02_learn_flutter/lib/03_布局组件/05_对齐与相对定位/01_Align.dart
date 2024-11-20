import 'package:flutter/material.dart';

/*
Align：
 * widthFactor和heightFactor：它们是两个缩放因子，会分别乘以子元素的宽、高，最终的结果就是Align 组件的宽高
   为null时组件的宽高将会占用尽可能多的空间
 *  Alignment Widget会以矩形的中心点作为坐标原点，即Alignment(0.0, 0.0)
    x、y的值从-1到1分别代表矩形左边到右边的距离和顶部到底边的距离

 * FractionalOffset 继承自 Alignment，它和 Alignment唯一的区别就是坐标原点不同！
    FractionalOffset 的坐标原点为矩形的左侧顶点
    实际偏移 = (FractionalOffse.x * childWidth, FractionalOffse.y * childHeight)

  Align和Stack对比
    * 定位参考系统不同；Stack/Positioned定位的的参考系可以是父容器矩形的四个顶点；
      而Align则需要先通过alignment 参数来确定坐标原点，不同的alignment会对应不同原点，
      最终的偏移是需要通过alignment的转换公式来计算出
    * Stack可以有多个子元素，并且子元素可以堆叠，而Align只能有一个子元素，不存在堆叠

*/
class MJAlignWidget extends StatefulWidget {
  const MJAlignWidget({super.key});

  @override
  State<MJAlignWidget> createState() => _MJAlignWidgetState();
}

class _MJAlignWidgetState extends State<MJAlignWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 120,
      // width: 120,
      color: Colors.red.shade50,
      child: const Align(
        widthFactor: 2,
        heightFactor: 2,
        alignment: FractionalOffset(-0.2, 0.6),
        child: FlutterLogo(
          size: 60,
        ),
      ),
    );
  }
}

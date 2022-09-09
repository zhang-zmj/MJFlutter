import 'package:flutter/material.dart';

/*
Stack：允许子组件堆叠
    fit：此参数用于确定没有定位的子组件如何去适应Stack的大小
    clipBehavior：此属性决定对超出Stack显示空间的部分如何剪裁

Positioned： 根据Stack的四个角来确定子组件的位置
     * left、top 、right、 bottom分别代表离Stack左、上、右、底四边的距离
     * 在水平方向时，你只能指定left、right、width三个属性中的两个，
       如指定left和width后，right会自动算出(left+width)，如果同时指定三个属性则会报错，垂直方向同理

后布局 遮住 先布局的

*/
class StackAndPositioned extends StatefulWidget {
  const StackAndPositioned({Key? key}) : super(key: key);

  @override
  State<StackAndPositioned> createState() => _StackAndPositionedState();
}

class _StackAndPositionedState extends State<StackAndPositioned> {
  @override
  Widget build(BuildContext context) {
    //通过ConstrainedBox来确保Stack占满屏幕
    return ConstrainedBox(
        constraints: BoxConstraints.expand(),
      child: Stack(
        alignment: Alignment.center,
        fit: StackFit.expand, //未定位widget占满Stack整个空间
        children: [
          Positioned(
            left: 18,
            child: Container(child: Text("I am Jack"),color: Colors.green),
          ),
          Container(
            child: Text("Hello world", style: TextStyle(color: Colors.white)),
            color: Colors.red,
          ),
          Positioned(
              top: 18,
              child: Text("Your friend")
          )
        ],
      ),
    );
  }
}














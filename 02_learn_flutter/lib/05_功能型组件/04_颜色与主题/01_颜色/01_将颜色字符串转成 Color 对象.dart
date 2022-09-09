import 'package:flutter/material.dart';

class ColorTransformWidget extends StatefulWidget {
  const ColorTransformWidget({Key? key}) : super(key: key);

  @override
  State<ColorTransformWidget> createState() => _ColorTransformWidgetState();
}

class _ColorTransformWidgetState extends State<ColorTransformWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(

    );
  }


   _getColor() {

      Color(0xffdc380d); //如果颜色固定可以直接使用整数值
      //颜色是一个字符串变量
      var c = "dc380d";
      Color(int.parse(c,radix:16)|0xFF000000); //通过位运算符将Alpha设置为FF
      Color(int.parse(c,radix:16)).withAlpha(255);  //通过方法将Alpha设置为FF

  }

}


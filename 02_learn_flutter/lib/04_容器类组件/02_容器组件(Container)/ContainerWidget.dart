import 'package:flutter/material.dart';

class MJContainerWidget extends StatefulWidget {
  const MJContainerWidget({super.key});
  @override
  State<MJContainerWidget> createState() => _MJContainerWidgetState();
}

class _MJContainerWidgetState extends State<MJContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 50, left: 120),
          //容器大小的限制条件
          constraints: const BoxConstraints.tightFor(width: 100, height: 100),
          decoration: const BoxDecoration(
              gradient: RadialGradient(colors: [Colors.red, Colors.orange], center: Alignment.topLeft, radius: .98),
              boxShadow: [
                //卡片阴影
                BoxShadow(color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)
              ]),
          transform: Matrix4.rotationZ(.2), //卡片倾斜变换
          child: const Text(
            "5.20",
            style: TextStyle(color: Colors.white, fontSize: 40),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}

/*
Container 
  可以用于设置部件的大小、边距、边框、背景颜色等属性，同时还可以对子部件进行对齐、填充和变换等操作。
  如果你需要一个视图，有一个背景颜色、图像、有固定的尺寸、需要一个边框、圆角等效果，那么就可以使用 Container 组件。
*/ 


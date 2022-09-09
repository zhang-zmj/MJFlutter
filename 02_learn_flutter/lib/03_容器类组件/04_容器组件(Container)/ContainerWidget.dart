import 'package:flutter/material.dart';

class ContainerWidget extends StatefulWidget {
  const ContainerWidget({Key? key}) : super(key: key);

  @override
  State<ContainerWidget> createState() => _ContainerWidgetState();
}

class _ContainerWidgetState extends State<ContainerWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: EdgeInsets.only(top: 50, left: 120),
          //容器大小的限制条件
          constraints: BoxConstraints.tightFor(
            width: 200,
            height: 150
          ),
          decoration: BoxDecoration(
            gradient: RadialGradient(colors: [Colors.red, Colors.orange],
                center: Alignment.topLeft,
                radius: .98
            ),
            boxShadow: [
               //卡片阴影
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(2.0, 2.0),
                  blurRadius: 4.0
                )
            ]
          ),
          transform: Matrix4.rotationZ(.2),//卡片倾斜变换
          child: Text("5.20", style: TextStyle(color: Colors.white, fontSize: 40), textAlign: TextAlign.center,),
        )


      ],
    );
  }
}





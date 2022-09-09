import 'package:flutter/material.dart';

/*
流式布局：
    超出屏幕显示范围会自动折行的布局称
*/
class WrapWidget extends StatefulWidget {
  const WrapWidget({Key? key}) : super(key: key);

  @override
  State<WrapWidget> createState() => _WrapWidgetState();
}

class _WrapWidgetState extends State<WrapWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8.0,    //主轴(水平)方向间距
      runSpacing: 4.0, //纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: [
        Chip(
            avatar: CircleAvatar(backgroundColor: Colors.blue,child: Text("A")),
            label: Text('Hamilton'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('M')),
          label: Text('Lafayette'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: Text('Mulligan'),
        ),
        Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: Text('Laurens'),
        ),
      ],
    );
  }
}

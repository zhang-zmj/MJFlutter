import 'package:flutter/material.dart';

class FlowWidget extends StatefulWidget {
  const FlowWidget({Key? key}) : super(key: key);

  @override
  State<FlowWidget> createState() => _FlowWidgetState();
}

class _FlowWidgetState extends State<FlowWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Flow(delegate: TextFlowDelegate(margin: EdgeInsets.all(10)),
      children: [
        Container(width: 80, height: 80,color: Colors.red),
        Container(width: 80, height: 80,color: Colors.green),
        Container(width: 80, height: 80,color: Colors.blue),
        Container(width: 80, height: 80,color: Colors.yellow),
        Container(width: 80, height: 80,color: Colors.brown),
        Container(width: 80, height: 80,color: Colors.purple)
      ],
      ),
    );
  }
}


class TextFlowDelegate extends FlowDelegate {
  EdgeInsets margin;
  double width = 0;
  double height = 0;
  TextFlowDelegate({this.margin = EdgeInsets.zero});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;
  //  计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var w = context.getChildSize(i)!.width + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      }else{
        x = margin.left;
        y += context.getChildSize(i)!.height + margin.top + margin.bottom;
        // 绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += context.getChildSize(i)! .width + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度尽可能大，但高度指定为200
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }

}




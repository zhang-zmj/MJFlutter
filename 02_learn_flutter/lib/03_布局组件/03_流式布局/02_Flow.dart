import 'package:flutter/material.dart';

class MJFlowWidget extends StatefulWidget {
  const MJFlowWidget({super.key});

  @override
  State<MJFlowWidget> createState() => _MJFlowWidgetState();
}

// Flow可以通过使FlowDelegate完全自定义子组件的布局，这为创建复杂的自定义布局提供了极大的灵活性
// Flow是一个抽象的布局小部件，它不关心子组件的数量或尺寸，而是根据 FlowDelegate 的实现来确定每个子组件的位置。
//这使得 Flow 可以用于实现复杂的布局效果，如复杂的图表、自定义的网格布局等。
class _MJFlowWidgetState extends State<MJFlowWidget> {
  @override
  Widget build(BuildContext context) {
    return Flow(
      delegate: TextFlowDelegate(margin: const EdgeInsets.all(10)),
      children: [
        Container(width: 80, height: 80, color: Colors.red),
        Container(width: 80, height: 80, color: Colors.green),
        Container(width: 80, height: 80, color: Colors.blue),
        Container(width: 80, height: 80, color: Colors.yellow),
        Container(width: 80, height: 80, color: Colors.brown),
        Container(width: 80, height: 80, color: Colors.purple)
      ],
    );
  }
}

class TextFlowDelegate extends FlowDelegate {
  EdgeInsets margin = EdgeInsets.zero;
  double width = 0;
  double height = 0;
  TextFlowDelegate({required this.margin});

  @override
  void paintChildren(FlowPaintingContext context) {
    var x = margin.left;
    var y = margin.top;

    //计算每一个子widget的位置
    for (int i = 0; i < context.childCount; i++) {
      var sizeW = context.getChildSize(i)?.width ?? 0;
      var sizeH = context.getChildSize(i)?.height ?? 0;

      var w = sizeW + x + margin.right;
      if (w < context.size.width) {
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0.0));
        x = w + margin.left;
      } else {
        x = margin.left;
        y += sizeH + margin.top + margin.bottom;
        // 绘制子widget(有优化)
        context.paintChild(i, transform: Matrix4.translationValues(x, y, 0));
        x += sizeW + margin.left + margin.right;
      }
    }
  }

  @override
  Size getSize(BoxConstraints constraints) {
    // 指定Flow的大小，简单起见我们让宽度尽可能大，但高度指定为200
    // 实际开发中我们需要根据子元素所占用的具体宽高来设置Flow大小
    return const Size(double.infinity, 200);
  }

  @override
  bool shouldRepaint(covariant FlowDelegate oldDelegate) {
    return oldDelegate != this;
  }
}

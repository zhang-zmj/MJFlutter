import 'package:flutter/material.dart';

class MJFlexExpandedWidget extends StatefulWidget {
  const MJFlexExpandedWidget({super.key});
  @override
  State<MJFlexExpandedWidget> createState() => _MJFlexExpandedWidgetState();
}

class _MJFlexExpandedWidgetState extends State<MJFlexExpandedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //Flex的两个子widget按1：2来占据水平空间
        Flex(
          direction: Axis.horizontal,
          children: [
            Expanded(
              flex: 1,
              child: Container(
                height: 30,
                color: Colors.red,
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                height: 30,
                color: Colors.green,
              ),
            ),
          ],
        ),

        Padding(
          padding: const EdgeInsets.only(top: 20),
          child: SizedBox(
            height: 100,
            child: Flex(
              direction: Axis.vertical,
              children: [
                Expanded(
                  child: Container(
                    height: 30,
                    color: Colors.red,
                  ),
                ),
                // 创建一个空的、可调整的空间，用于调整 Flex 容器(例如 Column、Row 等)中子 Widget 之间的间距
                const Spacer(flex: 1),
                Expanded(flex: 1, child: Container(height: 30, color: Colors.green))
              ],
            ),
          ),
        )
      ],
    );
  }
}


/*
Row、Column：
    知道主轴方向、并继承自Flex
Flex：
    组件可以沿着水平或垂直方向排列子组件
Expanded：
    只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间
    flex：参数为弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。
          如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间


在以下情况下，使用 Flex 布局是更合适的选择，而不使用 Row 和 Column：
  * 不确定子组件数量或尺寸：当子组件的数量或尺寸在运行时动态变化时，使用Flex布局可以更好地适应变化。通过设置弹性因子，可以根据需要自动调整子组件的尺寸比例。
  * 复杂的布局需求：如果需要更复杂的布局结构，涉及多个层次的嵌套和不同方向的排列，使用Flex布局可以提供更大的灵活性。可以通过嵌套多个Flex组件来实现更复杂的布局结构。
  * 自定义子组件尺寸和位置：使用Flex布局可以更灵活地控制子组件的尺寸和位置。通过设置弹性因子、对齐方式和主轴尺寸等属性，可以自定义子组件在布局中的行为。  


*/

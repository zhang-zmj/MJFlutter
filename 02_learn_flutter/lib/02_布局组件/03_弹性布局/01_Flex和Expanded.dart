import 'package:flutter/material.dart';


/*
Row、Column：
    知道主轴方向、并继承自Flex

Flex：
    组件可以沿着水平或垂直方向排列子组件

Expanded：
    只能作为 Flex 的孩子（否则会报错），它可以按比例“扩伸”Flex子组件所占用的空间

    flex：参数为弹性系数，如果为 0 或null，则child是没有弹性的，即不会被扩伸占用的空间。
          如果大于0，所有的Expanded按照其 flex 的比例来分割主轴的全部空闲空间
*/

class FlexExpandedWidget extends StatefulWidget {
  const FlexExpandedWidget({Key? key}) : super(key: key);
  @override
  State<FlexExpandedWidget> createState() => _FlexExpandedWidgetState();
}

class _FlexExpandedWidgetState extends State<FlexExpandedWidget> {
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
                  )
              ),
              Expanded(child: Container(
                height: 30,
                color: Colors.green,
              ), flex: 2)
            ],
        ),

        Padding(padding: EdgeInsets.only(top: 20), child: SizedBox(
          height: 100,
          child: Flex(
            direction: Axis.vertical,
            children: [
              Expanded(child: Container(
                height: 30,
                color: Colors.red
              )),
              // 创建一个空的、可调整的空间，用于调整 Flex 容器(例如 Column、Row 等)中子 Widget 之间的间距
              Spacer(
                flex: 1
              ),
              Expanded(
                  flex: 1,
                  child: Container(
                    height: 30,
                    color: Colors.green
                  ))
            ],
          ),
        ),)


      ],
    );
  }
}



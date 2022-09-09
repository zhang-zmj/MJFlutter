import 'package:flutter/material.dart';


/*

布局流程如下：
  上层组件向下层组件传递约束（constraints）条件。
  下层组件确定自己的大小，然后告诉上层组件。注意下层组件的大小必须符合父组件的约束。
  上层组件确定下层组件相对于自身的偏移和确定自身的大小（大多数情况下会根据子组件的大小来确定自身的大小）。

* 任何时候子组件都必须先遵守父组件的约束

BoxConstraints：
    盒模型布局过程中父渲染对象传递给子渲染对象的约束信息，包含最大宽高信息，
    子组件大小需要在约束的范围内

ConstrainedBox：
    用于对子组件添加额外的约束

SizedBox：
    用于给子元素指定固定的宽高, 只是ConstrainedBox的一个定制
*/

class ConstraintsWidget extends StatefulWidget {
  const ConstraintsWidget({Key? key}) : super(key: key);
  @override
  State<ConstraintsWidget> createState() => _ConstraintsWidgetState();
}

class _ConstraintsWidgetState extends State<ConstraintsWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: 80,
        height: 80,
        child: Container(
          height: 5.0,
          color: Colors.red,
        )
      ),
    );
  }


  Widget setConstrainedBox() {
    return ConstrainedBox(
      constraints: BoxConstraints(
          minWidth: double.infinity, //宽度尽可能大
          minHeight: 50.0 //最小高度为50像素
      ),
      child: Container(
        height: 5.0,
        color: Colors.red,
      ),
    );
  }



}


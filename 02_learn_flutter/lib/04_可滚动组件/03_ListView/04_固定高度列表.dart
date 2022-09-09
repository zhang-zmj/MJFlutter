import 'package:flutter/material.dart';
import 'package:learn_flutter/02_%E5%B8%83%E5%B1%80%E7%BB%84%E4%BB%B6/07_%20LayoutBuilder%E3%80%81AfterLayout/01_LayoutBuilder.dart';

class FixedHeightWidget extends StatefulWidget {
  const FixedHeightWidget({Key? key}) : super(key: key);
  @override
  State<FixedHeightWidget> createState() => _FixedHeightWidgetState();
}

class _FixedHeightWidgetState extends State<FixedHeightWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        // prototypeItem: ListTile(title: Text("1")),
        itemExtent: 100,
        itemBuilder: (context, index) {
          //LayoutLogPrint是一个自定义组件，在布局时可以打印当前上下文中父组件给子组件的约束信息
          return LayoutLogPrint(
              tag: index,
              child: ListTile(title: Text("------$index")));
        }
    );
  }
}


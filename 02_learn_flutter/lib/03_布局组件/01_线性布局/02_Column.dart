import 'package:flutter/material.dart';

class MJColumnWidget extends StatefulWidget {
  const MJColumnWidget({super.key});
  @override
  State<MJColumnWidget> createState() => _MJColumnWidgetState();
}

class _MJColumnWidgetState extends State<MJColumnWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: double.infinity),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [Text("hi"), Text("world")],
      ),
    );
  }
}

/*
  1、如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，
     里面Row或Column所占用的空间为实际大小
  2、如果要让里面的Column占满外部Column，可以使用Expanded 组件
*/


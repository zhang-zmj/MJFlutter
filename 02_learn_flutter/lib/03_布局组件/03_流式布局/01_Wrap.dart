import 'package:flutter/material.dart';

/*
流式布局：
    超出屏幕显示范围会自动换行的布局

  Chip 是 Flutter 中用于显示紧凑信息的小部件，通常包含一个标签和可选的图标或删除按钮，可以用作交互式元素。
  ActionChip：在Chip基础上多了点击事件，长安提示，取消了删除属性
  ChoiceChip：在ActionChip基础上多了是否选中，取消了点击事件,跟长按事件
  FilterChip：在ChoiceChip多了checkMark等属性
  InputChip：在FilterChip基础上多了是否可用，点击事件，长安提示等属性，保留了取消了删除属性
*/
class MJWrapWidget extends StatefulWidget {
  const MJWrapWidget({super.key});

  @override
  State<MJWrapWidget> createState() => _MJWrapWidgetState();
}

class _MJWrapWidgetState extends State<MJWrapWidget> {
  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8, //主轴(水平)方向间距
      runSpacing: 4.0, //纵轴（垂直）方向间距
      alignment: WrapAlignment.start, //沿主轴方向居中
      children: [
        const Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text("A")),
          label: Text('Hamilton'),
        ),
        ActionChip(
          avatar: const Icon(Icons.account_circle),
          label: const Text('ActionChip'),
          labelStyle: const TextStyle(
            fontSize: 14,
            color: Colors.black,
          ),
          // labelPadding: const EdgeInsets.all(10),
          onPressed: () {
            debugPrint("哈哈好哈哈");
          },
          pressElevation: 20,
          tooltip: 'InputChip',
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          clipBehavior: Clip.antiAlias,
          backgroundColor: Colors.amber,
          padding: const EdgeInsets.all(10),
          elevation: 10,
          shadowColor: Colors.amber,
        ),
        const Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('H')),
          label: Text('Mulligan'),
        ),
        const Chip(
          avatar: CircleAvatar(backgroundColor: Colors.blue, child: Text('J')),
          label: Text('Laurens'),
        ),
      ],
    );
  }
}

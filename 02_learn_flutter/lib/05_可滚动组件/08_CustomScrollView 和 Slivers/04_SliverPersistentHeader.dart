import 'package:flutter/material.dart';
import './05_SliverHeaderDelegate.dart';

/*
1、CustomScrollView 组合 Sliver 的原理是为所有子 Sliver 提供一个共享的 Scrollable，
   然后统一处理指定滑动方向的滑动事件。
2、CustomScrollView 和 ListView、GridView、PageView 一样，
   都是完整的可滚动组件（同时拥有 Scrollable、Viewport、Sliver）。
3、CustomScrollView 只能组合 Sliver，如果有孩子也是一个完整的可滚动组件
  （通过 SliverToBoxAdapter 嵌入）且它们的滑动方向一致时便不能正常工作
*/

class MJSliverPersistentHeaderWidget extends StatefulWidget {
  const MJSliverPersistentHeaderWidget({super.key});

  @override
  State<MJSliverPersistentHeaderWidget> createState() => _MJSliverPersistentHeaderWidgetState();
}

class _MJSliverPersistentHeaderWidgetState extends State<MJSliverPersistentHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        buildSliverList(),
        SliverPersistentHeader(delegate: MJSliverHeaderDelegate(maxHeight: 80, minHeight: 50, child: buildHeader(1))),
        buildSliverList(),
        SliverPersistentHeader(
            pinned: true, delegate: MJSliverHeaderDelegate.fixedHeight(height: 50, child: buildHeader(2))),
        buildSliverList(20)
      ],
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate((context, index) {
        return ListTile(title: Text('$index'));
      }, childCount: count),
    );
  }

  //构建 header
  Widget buildHeader(int i) {
    return Container(
      color: Colors.lightBlue.shade200,
      alignment: Alignment.centerLeft,
      child: Text("PersistentHeader $i"),
    );
  }
}

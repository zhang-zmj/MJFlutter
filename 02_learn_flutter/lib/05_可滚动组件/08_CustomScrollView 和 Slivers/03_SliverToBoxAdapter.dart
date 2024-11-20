import 'package:flutter/material.dart';

/*
SliverToBoxAdapter
    适配器：可以将 RenderBox 适配为 Sliver

  如果 CustomScrollView 有孩子也是一个完整的可滚动组件且它们的滑动方向一致，
    则 CustomScrollView 不能正常工作
*/
class MJSliverToBoxAdapterWidget extends StatefulWidget {
  const MJSliverToBoxAdapterWidget({super.key});
  @override
  State<MJSliverToBoxAdapterWidget> createState() => _MJSliverToBoxAdapterWidgetState();
}

class _MJSliverToBoxAdapterWidgetState extends State<MJSliverToBoxAdapterWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: PageView(children: const [
              Text("哈哈啊哈哈", textScaler: TextScaler.linear(3)),
              Text("吼吼吼吼吼", textScaler: TextScaler.linear(3)),
              Text("哦哦哦哦哦", textScaler: TextScaler.linear(3))
            ]),
          ),
        ),
        SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate((context, index) {
              //创建列表项
              return Container(
                alignment: Alignment.center,
                color: Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            }, childCount: 20))
      ],
    );
  }
}

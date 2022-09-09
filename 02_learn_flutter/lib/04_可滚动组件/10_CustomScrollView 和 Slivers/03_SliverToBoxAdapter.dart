import 'package:flutter/material.dart';


/*
SliverToBoxAdapter
    适配器：可以将 RenderBox 适配为 Slive

  如果 CustomScrollView 有孩子也是一个完整的可滚动组件且它们的滑动方向一致，
    则 CustomScrollView 不能正常工作
*/
class SliverToBoxAdapterWidget extends StatefulWidget {
  const SliverToBoxAdapterWidget({Key? key}) : super(key: key);

  @override
  State<SliverToBoxAdapterWidget> createState() => _SliverToBoxAdapterWidgetState();
}

class _SliverToBoxAdapterWidgetState extends State<SliverToBoxAdapterWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverToBoxAdapter(
          child: SizedBox(
            height: 300,
            child: PageView(
              children: [Text("1", textScaleFactor: 3), Text("2", textScaleFactor: 3)],
            ),
          ),
        ),
        SliverFixedExtentList(
            itemExtent: 50,
            delegate: SliverChildBuilderDelegate( (context, index) {
              //创建列表项
              return Container(
                alignment: Alignment.center,
                color:  Colors.lightBlue[100 * (index % 9)],
                child: Text('list item $index'),
              );
            },
                childCount: 20
            )
        )
      ],
    );
  }
}

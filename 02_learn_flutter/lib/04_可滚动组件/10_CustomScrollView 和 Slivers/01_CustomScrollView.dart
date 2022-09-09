import 'package:flutter/material.dart';

/*
ListView、GridView、PageView
    完整的可滚动组件，所谓完整是指它们都包括Scrollable 、 Viewport 和 Sliver

 我们想要在一个页面中，同时包含多个可滚动组件，且使它们的滑动效果能统一起来
*/
class CustomScrollViewWidget extends StatefulWidget {
  const CustomScrollViewWidget({Key? key}) : super(key: key);

  @override
  State<CustomScrollViewWidget> createState() => _CustomScrollViewWidgetState();
}

class _CustomScrollViewWidgetState extends State<CustomScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    return buildTwoSliverList();
  }
  
  Widget buildTwoSliverList() {
    // SliverFixedExtentList 是一个 Sliver，它可以生成高度相同的列表项。
    // 再次提醒，如果列表项高度相同，我们应该优先使用SliverFixedExtentList
    // 和 SliverPrototypeExtentList，如果不同，使用 SliverList.

    var listView = SliverFixedExtentList(
      itemExtent: 56,
      delegate: SliverChildBuilderDelegate(
              (_, index) => ListTile(title: Text("$index")),
          childCount: 10
      ),
    );

    return CustomScrollView(
        slivers: [
          listView,
          listView
        ]
    );
  }
  
}

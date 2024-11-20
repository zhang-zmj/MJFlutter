import 'package:flutter/material.dart';

class MJSliverWidget extends StatefulWidget {
  const MJSliverWidget({super.key});

  @override
  State<MJSliverWidget> createState() => _MJSliverWidgetState();
}

class _MJSliverWidgetState extends State<MJSliverWidget> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: CustomScrollView(
        slivers: [
          // AppBar包含一个导航栏
          SliverAppBar(
            // pinned: true, // 滑动到顶端时会固定住
            backgroundColor: Colors.red, // 导航栏的背景颜色
            expandedHeight: 100, // 导航栏的高度
            flexibleSpace: FlexibleSpaceBar(
              // 导航栏的内容
              title: const Text(
                "FlexibleSpaceBar",
                style: TextStyle(fontSize: 12),
              ),
              background: Image.asset(
                "images/avatar.png",
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverPadding(
            padding: const EdgeInsets.all(8),
            sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, //Grid按两列显示
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    childAspectRatio: 4.0),
                delegate: SliverChildBuilderDelegate((context, index) {
                  //创建子widget
                  return Container(
                    alignment: Alignment.center,
                    color: Colors.cyan[100 * (index % 9)],
                    child: Text('grid item $index'),
                  );
                }, childCount: 20)),
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
      ),
    );
  }
}

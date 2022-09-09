import 'package:flutter/material.dart';
import '02_CustomSliverOne.dart';

class SliverFlexibleHeaderWidget extends StatefulWidget {
  const SliverFlexibleHeaderWidget({Key? key}) : super(key: key);
  @override
  State<SliverFlexibleHeaderWidget> createState() => _SliverFlexibleHeaderWidgetState();
}

class _SliverFlexibleHeaderWidgetState extends State<SliverFlexibleHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      //为了能使CustomScrollView拉到顶部时还能继续往下拉，必须让 physics 支持弹性效果
        physics: const BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
        slivers: [
        //我们需要实现的 SliverFlexibleHeader 组件
        SliverFlexibleHeader(
        visibleExtent: 200, // 初始状态在列表中占用的布局高度
        // 为了能根据下拉状态变化来定制显示的布局，我们通过一个 builder 来动态构建布局。
        builder: (context, availableHeight) {
            return GestureDetector(
              onTap: () => print('tap'), //测试是否可以响应事件
              child: Image(
                image: AssetImage("imgs/avatar.png"),
                width: 50.0,
                height: availableHeight,
                alignment: Alignment.bottomCenter,
                fit: BoxFit.cover,
              ),
            );
      },
    ),
    // 构建一个list
      buildSliverList(30),
    ],
    );
  }

  // 构建固定高度的SliverList，count为列表项属相
  Widget buildSliverList ([int count = 5]) {
    return SliverFixedExtentList(
      itemExtent: 50,
      delegate: SliverChildBuilderDelegate((context, index) {
        return ListTile(title: Text('$index'));
      },
          childCount: count
      ),
    );
  }
}


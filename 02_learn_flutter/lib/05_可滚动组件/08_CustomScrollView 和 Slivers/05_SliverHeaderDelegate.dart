import 'package:flutter/material.dart';

typedef MJSliverHeaderBuilder = Widget Function(BuildContext context, double shrinkOffset, bool overlapsContent);

/*
SliverPersistentHeader：
  可以将一个 Widget 固定在 CustomScrollView 顶部
  可以将一个 Widget 固定在 CustomScrollView 底部
  可以将一个 Widget 固定在 CustomScrollView 中间
  可以将一个 Widget 固定在 CustomScrollView 顶部和底部之间
  可以将一个 Widget 固定在 CustomScrollView 顶部和底部之间的某个位置
*/

class MJSliverHeaderDelegate extends SliverPersistentHeaderDelegate {
  final double maxHeight;
  final double minHeight;
  final MJSliverHeaderBuilder builder;

  // child 为 header
  MJSliverHeaderDelegate({
    required this.maxHeight,
    this.minHeight = 0,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        assert(minHeight <= maxHeight && minHeight >= 0);

  //最大和最小高度相同
  MJSliverHeaderDelegate.fixedHeight({
    required double height,
    required Widget child,
  })  : builder = ((a, b, c) => child),
        maxHeight = height,
        minHeight = height;

  //需要自定义builder时使用
  MJSliverHeaderDelegate.builder({required this.maxHeight, this.minHeight = 0, required this.builder});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    Widget child = builder(context, shrinkOffset, overlapsContent);
    //测试代码：如果在调试模式，且子组件设置了key，则打印日志
    assert(() {
      if (child.key != null) {
        debugPrint('${child.key}: shrink: $shrinkOffset，overlaps:$overlapsContent');
      }
      return true;
    }());
    // 让 header 尽可能充满限制的空间；宽度为 Viewport 宽度，
    // 高度随着用户滑动在[minHeight,maxHeight]之间变化。
    return SizedBox.expand(child: child);
  }

  @override
  double get maxExtent => maxHeight;

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(MJSliverHeaderDelegate oldDelegate) {
    return oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
  }
}

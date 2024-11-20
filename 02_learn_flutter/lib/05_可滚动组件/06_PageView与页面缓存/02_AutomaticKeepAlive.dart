/*
加载区域：
    表组件的 Viewport区域 + cacheExtent（预渲染区域）

AutomaticKeepAlive：
    主要作用是将列表项的根 RenderObject 的 keepAlive 按需自动标记 为 true 或 false

    * 当 keepAlive 标记为 false 时，如果列表项滑出加载区域时，列表组件将会被销毁。
    * 当 keepAlive 标记为 true 时，当列表项滑出加载区域后，Viewport 会将列表组件缓存起来；
      当列表项进入加载区域时，Viewport 从先从缓存中查找是否已经缓存，如果有则直接复用，
        如果没有则重新创建列表项
*/

import 'package:flutter/material.dart';

class MJAutomaticKeepAliveWidget extends StatefulWidget {
  const MJAutomaticKeepAliveWidget({super.key});

  @override
  State<MJAutomaticKeepAliveWidget> createState() => _MJAutomaticKeepAliveWidgetState();
}

class _MJAutomaticKeepAliveWidgetState extends State<MJAutomaticKeepAliveWidget> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; ++i) {
      children.add(Page(text: '$i'));
    }
    return PageView(allowImplicitScrolling: true, scrollDirection: Axis.horizontal, children: children);
  }
}

// Tab 页面

class Page extends StatefulWidget {
  final String text;
  const Page({super.key, required this.text});

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    debugPrint("build ${widget.text}");

    super.build(context); // 必须调用

    return Center(child: Text("$widget.text", textScaler: const TextScaler.linear(5.0)));
  }

  @override
  bool get wantKeepAlive => true; // 是否需要缓存
}

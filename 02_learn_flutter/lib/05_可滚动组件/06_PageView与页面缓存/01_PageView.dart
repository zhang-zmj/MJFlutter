import 'package:flutter/material.dart';
import 'package:learn_flutter/05_%E5%8F%AF%E6%BB%9A%E5%8A%A8%E7%BB%84%E4%BB%B6/06_PageView%E4%B8%8E%E9%A1%B5%E9%9D%A2%E7%BC%93%E5%AD%98/KeepAliveWrapper.dart';

class MJPageViewWidget extends StatefulWidget {
  const MJPageViewWidget({super.key});

  @override
  State<MJPageViewWidget> createState() => _MJPageViewWidgetState();
}

class _MJPageViewWidgetState extends State<MJPageViewWidget> {
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
  const Page({super.key, required this.text});

  final String text;

  @override
  State<Page> createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    debugPrint("build ${widget.text}");
    return KeepAliveWrapper(child: Center(child: Text("$widget.text", textScaler: const TextScaler.linear(5.0))));
  }
}



/*
页面缓存：
     allowImplicitScrolling： cacheExtent 为 1.0，则代表前后各缓存一个页面宽度，即前后各一页
     看到这可能国内的很多开发者要说我们的 App 不用考虑辅助功能，既然如此，那问题很好解决，将 PageView 的源码拷贝一份，然后透传 cacheExtent 即可

滚动组件提供了一种通用的缓存子项的解决方案
*/



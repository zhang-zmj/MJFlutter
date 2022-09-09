import 'package:flutter/material.dart';


/*
页面缓存：
     allowImplicitScrolling： cacheExtent 为 1.0，则代表前后各缓存一个页面宽度，即前后各一页
     看到这可能国内的很多开发者要说我们的 App 不用考虑辅助功能，既然如此，那问题很好解决，将 PageView 的源码拷贝一份，然后透传 cacheExtent 即可

滚动组件提供了一种通用的缓存子项的解决方案
*/

class PageViewWidget extends StatefulWidget {

  const PageViewWidget({Key? key}) : super(key: key);
  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {
  @override
  Widget build(BuildContext context) {
    var children = <Widget>[];
    for (int i = 0; i < 6; ++i) {
      children.add(Page(text: '$i'));
    }
    return PageView(
      allowImplicitScrolling: true,
      scrollDirection: Axis.vertical,
      children: children
    );
  }
}



// Tab 页面
class Page extends StatefulWidget {
  const Page({
    Key? key,
    required this.text
  }) : super(key: key);

  final String text;

  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  @override
  Widget build(BuildContext context) {
    print("build ${widget.text}");
    return Center(child: Text("${widget.text}", textScaleFactor: 5));
  }
}

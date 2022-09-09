import 'package:flutter/material.dart';
import 'package:flukit/flukit.dart';

/*
TabBarView：
  1、TabBarView 封装了 PageView
  2、TabController 用于监听和控制 TabBarView 的页面切换，通常和 TabBar 联动
     如果没有指定，则会在组件树中向上查找并使用最近的一个 DefaultTabController
  3、TabBar 为 TabBarView 的导航标题
  4、text 和 child 是互斥的，不能同时制定
*/
class TabBarViewWidget extends StatefulWidget {
  const TabBarViewWidget({Key? key}) : super(key: key);
  @override
  State<TabBarViewWidget> createState() => _TabBarViewWidgetState();
}

// 通过mixin SingleTickerProviderStateMixin里面实现的createTicker可以通过传入一个回调方法获得一个Ticker，
// Ticker就是一个帧定时器，在执行start之后会一直在指定时间内执行回调
class _TabBarViewWidgetState extends State<TabBarViewWidget> with SingleTickerProviderStateMixin {

 late TabController _tabController;
  List tabs = ["新闻", "历史", "图片"];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: Text("APP Name"),
        bottom: TabBar(
            controller: _tabController,
            tabs: tabs.map((e) => Tab(text: e)).toList()
        ),
      ),
      body: TabBarView( // 构建
          controller: _tabController,
          children: tabs.map((e) {
            return KeepAliveWrapper(child: Container(
              alignment: Alignment.center,
              child: Text(e, textScaleFactor: 3),
            ));
          }).toList(),
      ),
    );
  }

   @override
   void dispose() {
     // 释放资源
     _tabController.dispose();
     super.dispose();
   }


}

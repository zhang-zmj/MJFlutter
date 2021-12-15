import 'package:flutter/material.dart';
import 'bottom_bar_item.dart';
import '../home/home.dart';
import '../subject/subject.dart';


List<ZMJBottomBarItem> items = [
  ZMJBottomBarItem("home", "首页"),
  ZMJBottomBarItem("subject", "书影音"),
  ZMJBottomBarItem("group", "小组"),
  ZMJBottomBarItem("mall", "市集"),
  ZMJBottomBarItem("profile", "我的"),
];

List<Widget> pages = [
  ZMJHomePage(),
  ZMJSubjectPage(),
  ZMJSubjectPage(),
  ZMJSubjectPage(),
  ZMJSubjectPage()
];



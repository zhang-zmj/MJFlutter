import 'package:flutter/material.dart';
import '../utils/view_util.dart';

//可自定义样式的沉浸式导航栏
class TopNavigationBar extends StatelessWidget {
  final StatusStyle statusStyle;
  final Color color;
  final double height;
  final Widget? child;

  const TopNavigationBar({Key? key,
    this.statusStyle = StatusStyle.DARK_CONTENT,
     this.color  = Colors.white,
     this.height = 46,
    this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    _statusBarInit();

    //状态栏高度
    var top = MediaQuery.of(context).padding.top;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: top + height,
      padding: EdgeInsets.only(top: top),
      decoration: BoxDecoration(color: color),
      child: child,
    );
  }

  void _statusBarInit() {
    //沉浸式状态栏
    changeStatusBar(color: color, statusStyle: statusStyle);
  }

}







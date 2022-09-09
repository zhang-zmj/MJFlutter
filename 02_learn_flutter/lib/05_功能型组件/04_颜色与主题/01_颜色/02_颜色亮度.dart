import 'package:flutter/material.dart';

class NavBarWidget extends StatefulWidget {
  const NavBarWidget({Key? key}) : super(key: key);

  @override
  State<NavBarWidget> createState() => _NavBarWidgetState();
}

class _NavBarWidgetState extends State<NavBarWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          //背景为蓝色，则title自动为白色
          NavBar(color: Colors.blue, title: "标题"),
          //背景为白色，则title自动为黑色
          NavBar(color: Colors.white, title: "标题"),
        ],
      ),
    );
  }
}



class NavBar extends StatelessWidget {
  const NavBar({Key? key, required this.title, required this.color}) : super(key: key);
  final String title;
  final Color color; //背景颜色

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 52,
        minWidth: double.infinity
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          //阴影
          BoxShadow(
            color: Colors.black26,
            offset: Offset(0, 3),
            blurRadius: 3
          )
        ]
      ),
      child: Text(
        title,
        // computeLuminance()方法，它可以返回一个[0-1]的一个值，数字越大颜色就越浅
        style: TextStyle(
          fontWeight: FontWeight.bold,
          //根据背景色亮度来确定Title颜色
          color: color.computeLuminance() < 0.5 ? Colors.white : Colors.black
        ),
      ),
      alignment: Alignment.center,
    );
  }
}



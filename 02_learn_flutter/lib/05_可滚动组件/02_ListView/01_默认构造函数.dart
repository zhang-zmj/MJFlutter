import 'package:flutter/material.dart';

class MJListViewWidget extends StatefulWidget {
  const MJListViewWidget({super.key});

  @override
  State<MJListViewWidget> createState() => _MJListViewWidgetState();
}

class _MJListViewWidgetState extends State<MJListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true, //它用于确定是否根据子 widget 的实际总高度来设置 ListView 的高度
      padding: const EdgeInsets.all(20),
      children: const [
        Text('I\'m dedicating every day to you', style: TextStyle(color: Colors.red)),
        SizedBox(height: 30),
        Text('Domestic life was never quite my style', style: TextStyle(color: Colors.green)),
        SizedBox(height: 30),
        Text('When you smile, you knock me out, I fall apart', style: TextStyle(color: Colors.yellow)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink)),
        SizedBox(height: 30),
        Text('And I thought I was so smart', style: TextStyle(color: Colors.pink))
      ],
    );
  }
}

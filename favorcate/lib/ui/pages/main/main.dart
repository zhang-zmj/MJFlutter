import 'package:favorcate/ui/pages/main/initialize_items.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/ui/pages/home/home_drawer.dart';


class ZMJMainScreen extends StatefulWidget {
  static const String routeName = "/";
  @override
  _ZMJMainScreenState createState() => _ZMJMainScreenState();
}

class _ZMJMainScreenState extends State<ZMJMainScreen> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: ZMJHomeDrawer(),
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
          selectedFontSize: 14,
          unselectedFontSize: 14,
          items: items,
          onTap: (index){
           setState(() {
             _currentIndex = index;
           });
          },
      ),
    );
  }
}


























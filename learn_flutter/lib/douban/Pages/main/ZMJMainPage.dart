import 'package:flutter/material.dart';
import 'package:learn_flutter/douban/Pages/main/initialize_items.dart';
import 'bottom_bar_item.dart';
import 'initialize_items.dart';


class ZMJMainPage extends StatefulWidget {
  @override
  _ZMJMainPageState createState() => _ZMJMainPageState();
}

class _ZMJMainPageState extends State<ZMJMainPage> {

  int _cuttentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _cuttentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
          selectedFontSize: 14,
          unselectedFontSize: 14,
          selectedItemColor: Colors.red,
          unselectedItemColor: Colors.blue,
          currentIndex:  _cuttentIndex,
          type: BottomNavigationBarType.fixed,
          items: items,
          onTap: (index){
            setState(() {
              _cuttentIndex = index;
            });
          },
      ),
    );
  }

}







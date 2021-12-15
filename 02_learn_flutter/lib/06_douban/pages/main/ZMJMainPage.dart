import 'package:flutter/material.dart';
import 'initialize_items.dart';


class ZMJMainPage extends StatefulWidget {
  const ZMJMainPage({Key? key}) : super(key: key);
  @override
  _ZMJMainPageState createState() => _ZMJMainPageState();
}

class _ZMJMainPageState extends State<ZMJMainPage> {

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        selectedFontSize: 14,
        unselectedFontSize: 14,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
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





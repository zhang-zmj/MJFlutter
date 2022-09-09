import 'package:flutter/material.dart';
import 'package:flutter_bili/navigator/hi_navigator.dart';
import 'package:flutter_bili/pages/favorite_page.dart';
import 'package:flutter_bili/pages/home_page.dart';
import 'package:flutter_bili/pages/mine_page.dart';
import 'package:flutter_bili/utils/color.dart';

//底部导航
class BottomNavigator extends StatefulWidget {
  const BottomNavigator({Key? key}) : super(key: key);
  @override
  State<BottomNavigator> createState() => _BottomNavigatorState();
}

class _BottomNavigatorState extends State<BottomNavigator> {
  final _defaultColor = Colors.grey;
  final _activeColor = primary;
  int _currrentIndex = 0;
  static int initialPage = 0;
  final PageController _controller = PageController(initialPage: initialPage);
  late List<Widget> _pages;
  bool _hasBuild = false;

  @override
  Widget build(BuildContext context) {

    _pages =  [HomePage(onJumpTo: (index) => _onJumpTo(index)), const FavoritePage(), const MinePage()];
    if (!_hasBuild) {
      // 页面第一次打开时通知打开的是哪个tab
      HiNavigator.getInstance()?.onBottomTabChange(initialPage, _pages[initialPage]);
      _hasBuild = true;
    }

    return Scaffold(
      body: PageView(
        controller: _controller,
        onPageChanged:  (index) => _onJumpTo(index, pageChange: true),
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currrentIndex,
        onTap: (index) => _onJumpTo(index),
        selectedItemColor: _activeColor,
        type: BottomNavigationBarType.fixed,
        items: [
          _bottomItem("首页", Icons.home, 0),
          _bottomItem("收藏", Icons.favorite, 1),
          _bottomItem("我的", Icons.live_tv, 2),
        ],
        selectedFontSize: 12,
        unselectedFontSize: 12,
      ),
    );
  }

  _bottomItem(String title, IconData icon, int index) {
    return BottomNavigationBarItem(
        icon: Icon(icon, color: _defaultColor),
        activeIcon:  Icon(icon, color: _activeColor),
        label: title
    );
  }

  void _onJumpTo(int index, { pageChange = false}) {
        if (!pageChange) {
          // 让PageView展示对应的tab
          _controller.jumpToPage(index);
        }else{
          HiNavigator.getInstance()?.onBottomTabChange(index, _pages[index]);
        }
        setState(() {
          _currrentIndex = index;
        });
  }

}



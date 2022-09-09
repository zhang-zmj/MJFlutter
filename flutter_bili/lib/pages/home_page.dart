import 'package:flutter/material.dart';
import 'package:flutter_bili/navigator/hi_navigator.dart';
import 'package:flutter_bili/pages/home_topbar_page.dart';
import 'package:flutter_bili/utils/color.dart';
import 'package:flutter_bili/model/menu_model.dart';
import 'package:flutter_bili/http/dao/menu_dao.dart';
import 'package:flutter_bili/state/hi_state.dart';
import 'package:flutter_bili/utils/view_util.dart';
import 'package:flutter_bili/widget/navigation_bar.dart';
import 'package:flutter_bili/pages/video_List_page.dart';

import 'package:flukit/flukit.dart';

class HomePage extends StatefulWidget {

  final ValueChanged<int>? onJumpTo;
  const HomePage({Key? key,  this.onJumpTo}) : super(key: key);
  @override
  State<HomePage> createState() => _HomePageState();
  
}

class _HomePageState extends HiState<HomePage> with TickerProviderStateMixin {

  late TabController _controller;
  var tabs = [];


  dynamic listener;



  late List<MenuModel> menuArray;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: tabs.length, vsync: this);
    HiNavigator.getInstance()?.addListener( listener = (current, pre) {
      if (widget == current.page || current.page is HomePage) {
        print("打开了首页: onResume");
      }else if (widget == pre?.page || pre?.page is HomePage)  {
        print("首页: onPause");
      }
    });
    loadData();
  }

  @override
  void dispose() {
    HiNavigator.getInstance()?.removeListener(listener);
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        body: Column(
          children: [
            TopNavigationBar(
              height: 50,
              child: _appBar(),
              color: Colors.white,
              statusStyle: StatusStyle.DARK_CONTENT,
            ),

            Container(
              color: Colors.white,
              padding: const EdgeInsets.only(top: 10),
              child: _tabBar(),
            ),
           Flexible(
                child: TabBarView(
                      controller: _controller,
                      children: tabs.map((value) {
                         int index = tabs.indexOf(value);
                         if (index == 0) {
                            return getContentPage(HomeTopBarPage(index), true);
                         }else if(index == 1){
                           return getContentPage(const VideoListPage(), true);
                        }else{
                           return Container();
                        }
                      }).toList()
                      )
           )
          ],
        ),
    );
  }

  _tabBar() {
      return TabBar(
          controller: _controller,
          isScrollable: true,
          labelColor: Colors.black,
          indicator: const UnderlineTabIndicator(
            borderSide: BorderSide(color: primary, width: 3),
            insets: EdgeInsets.only(left: 15, right: 15)
          ),
          tabs: tabs.map<Tab>((tab) {
            return Tab(child: Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Text(tab)));
          }).toList()
      );
  }

  void loadData() async {

    try {
       MenuModel menuModel = await MenuDao.getMenuListData();
       List<String> titleArray = [];
       final sub = menuModel.data?.sub;

       if (sub != null) {
         _controller = TabController(length: sub.length, vsync: this);
         for (var sub in sub) {
            titleArray.add(sub.name ?? "");
         }
       }
       setState(() {
         tabs = titleArray;
       });
    }catch (e){
      print("-----错误----$e");
    }

  }

  _appBar(){
    return  Padding(
        padding: const EdgeInsets.only(left: 15,right: 15),
        child: Row(
          children: [
            InkWell(
              onTap: (){
                if (widget.onJumpTo != null) {
                  widget.onJumpTo!(2);
                }
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(23),
                child: const Image(
                    image: AssetImage("images/avatar.png"),
                    height: 46,
                    width: 46,
                ),
              ),
            ),
          Expanded(child: Padding(
                 padding: const EdgeInsets.only(left: 15, right: 15),
                 child: ClipRRect(
                   borderRadius: BorderRadius.circular(16),
                   child: Container(
                    padding: const EdgeInsets.only(left: 10),
                    height: 32,
                    alignment: Alignment.centerLeft,
                    decoration: BoxDecoration(color: Colors.grey[100]),
                    child: const Icon(Icons.search, color: Colors.grey),
                   )))),
            const Icon(
             Icons.explore_outlined,
             color: Colors.grey,
            ),
            const Padding(padding: EdgeInsets.only(left: 12),
            child: Icon(
              Icons.mail_outline,
              color: Colors.grey,
            ))
          ],
        ),
    );
  }


  Widget getContentPage(Widget child, [keepAlive = false ]) {
    return  KeepAliveWrapper(
      keepAlive: keepAlive,
      child: child,
    );
  }



}



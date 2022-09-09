
import 'package:flutter/material.dart';
import 'detail.dart';
import 'about.dart';
import './router/router.dart';


main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Flutter Demo",
        theme: ThemeData(
            primarySwatch: Colors.blue,
            splashColor: Colors.transparent
        ),
        routes: ZMJRouter.routes,
        initialRoute: ZMJRouter.initialRoute,
        onGenerateRoute: ZMJRouter.generateRoute,
        onUnknownRoute: ZMJRouter.unknownRoute
    );
  }

}


class ZMJHomePage extends StatefulWidget {
  static const String routeName = "/";
  @override
  State<ZMJHomePage> createState() => _ZMJHomePageState();
}

class _ZMJHomePageState extends State<ZMJHomePage> {
  String _homeMessage = "default message";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("首页"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(_homeMessage, style: TextStyle(fontSize: 20, color: Colors.red)),
              ElevatedButton(onPressed: () => _jumpToDetail(context), child: Text("跳转到详情")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => _jumpToAbout(context), child: Text("跳转到关于")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => _jumpToDetail2(context), child: Text("跳转到详情")),
              SizedBox(height: 10),
              ElevatedButton(onPressed: () => _jumpToSettings(context), child: Text("跳转到设置")),
            ],
          ),
        )
    );
  }


  void _jumpToDetail(BuildContext context){
    // 1.普通的跳转方式
    // 传递参数: 通过构造器直接传递即可
    Future result =  Navigator.of(context).push( MaterialPageRoute(builder: (ctx) {
          return ZMJDetailPage("from home message");
      }));
    
    result.then((value) => {
      setState(() {
        _homeMessage = value;
      })
    });

  }


  void _jumpToAbout(BuildContext context) {
    Navigator.of(context).pushNamed(ZMJAboutPage.routeName, arguments: "from home message");
  }

  void _jumpToDetail2(BuildContext context) {
    Navigator.of(context).pushNamed(ZMJDetailPage.routeName, arguments: "from home detail2 message");
  }

  void _jumpToSettings(BuildContext context) {
      Navigator.of(context).pushNamed("/aaaa");
  }

}

/**
 * 1、MaterialPageRoute
 *   表示占有整个屏幕空间的一个模态路由页面，它还定义了路由构建及切换时过渡动画的相关接口及属性
 * 2、Navigator
 *   是一个路由管理的组件，它提供了打开和退出路由页方法
 * 3、路由传值
 * 4、命名路由
 *  给路由起一个名字，然后就可以通过路由名字直接打开新的路由了
 * 5、路由生成钩子
 *
 *
 *
 *
 **/











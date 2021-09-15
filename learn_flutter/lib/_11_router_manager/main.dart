import 'package:flutter/material.dart';
import 'package:learn_flutter/_11_router_manager/detail.dart';
import 'package:learn_flutter/_11_router_manager/about.dart';
import 'package:learn_flutter/_11_router_manager/router/router.dart';
import 'package:learn_flutter/_11_router_manager/unknown.dart';

main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          splashColor: Colors.transparent
        ),
        routes: ZMJRouter.routes,
        initialRoute: ZMJRouter.initialRoute,
        onGenerateRoute: ZMJRouter.generateRoute,
        onUnknownRoute: ZMJRouter.unknownRoute,
    );
  }

}

class ZMJHomePage extends StatefulWidget {

  static const String routeName = "/";

  @override
  _ZMJHomePageState createState() => _ZMJHomePageState();
}

class _ZMJHomePageState extends State<ZMJHomePage> {
  String _homeMessage = "default message";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(_homeMessage, style: TextStyle(fontSize: 20, color: Colors.red)),
            RaisedButton(
                child: Text("跳转到详情"),
                onPressed: () => _jumpToDetail(context)
            ),
            RaisedButton(
                child: Text("跳转到关于"),
                onPressed: () => _jumpToAbout(context)
            ),
            RaisedButton(
                child: Text("跳转到详情"),
                onPressed: () => _jumpToDetail2(context)
            ),
            RaisedButton(
                child: Text("跳转到设置"),
                onPressed: () => _jumpToSetting(context)
            )
          ],
        ),
      ),
     );
  }

  void _jumpToDetail(BuildContext context){

   Future result = Navigator.of(context).push(
      MaterialPageRoute(
          builder:(ctx){
            return ZMJDetailPage("a home message");
          })
    );

    result.then((value) {
      setState(() {
        _homeMessage = value;
      });
    });

  }

  void _jumpToAbout(BuildContext context){

    Future result =  Navigator.of(context).pushNamed(ZMJAboutPage.routeName, arguments: "a home message");
    result.then((value) {
      print("---------$value---------");
    });

  }

  void _jumpToDetail2(BuildContext context){
      Navigator.of(context).pushNamed(ZMJDetailPage.routeName, arguments: "a detail2 message");
  }

  void _jumpToSetting(BuildContext context){
    Navigator.of(context).pushNamed("settings");
  }

}



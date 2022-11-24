import 'dart:async';
import 'package:flutter/material.dart';
import 'package:learn_flutter/11_%E8%B7%AF%E7%94%B1%E7%AE%A1%E7%90%86/main.dart';
import 'package:learn_flutter/11_%E8%B7%AF%E7%94%B1%E7%AE%A1%E7%90%86/second_page.dart';

/*
RouterDelegate
  1、setNewRoutePath
  2、build
  3、currentConfiguration 的 getter 方法
  4、setInitialRoutePath

PopNavigatorRouterDelegateMixin：
  1、响应 Android 设备的回退按钮

ChangeNotifier
  1、做事件通知
*/
class PageRouter extends RouterDelegate<List<RouteSettings>> with ChangeNotifier, PopNavigatorRouterDelegateMixin<List<RouteSettings>>{

  static const String mainPage = "/main";
  static const String secondPage = "/second";

  static const String key = "key";
  static const String value = "value";

  final List<Page> _pages =[];
  late Completer<Object?> _boolResultCompleter;

  //PopNavigatorRouterDelegateMixin的方法实现
  @override
  GlobalKey<NavigatorState> get navigatorKey => GlobalKey<NavigatorState>();

  //RouterDelegate的相关方法
  @override
  Future<void> setNewRoutePath(List<RouteSettings> configuration) async { }

  @override
  Widget build(BuildContext context) {
    return Navigator(key: navigatorKey, pages: List.of(_pages) ,onPopPage: _onPopPage);
  }

  PageRouter() {
    _pages.add(_createPage(RouteSettings(name: mainPage, arguments: [])));
  }

  @override
  Future<bool> popRoute({Object? params}) {
    if (params != null){
      _boolResultCompleter.complete(params);
    }
    if (_canPop()) {
      _pages.removeLast();
      notifyListeners();
      return Future.value(true);
    }
    return _confirmExit();
  }

  bool _onPopPage(Route route, dynamic result) {
    if (!route.didPop(result)) return false;
    if (_canPop()) {
      _pages.removeLast();
      return true;
    }else{
      return false;
    }
  }

  //判断page栈长度，为空则即将退出APP，返回true表明页面关闭
  bool _canPop() {
    return _pages.length > 1;
  }

  void replace({required String name, dynamic arguments}){
    if (_pages.isNotEmpty) {
      _pages.removeLast();
    }
    push(name: name, arguments: arguments);
  }

  Future<Object?> push({required String name, dynamic arguments}) async {
      _boolResultCompleter = Completer<Object?>();
      _pages.add(_createPage(RouteSettings(name: name, arguments: arguments)));
      notifyListeners();
      return _boolResultCompleter.future;
  }

  MaterialPage _createPage(RouteSettings routeSettings){
    Widget page;
    switch (routeSettings.name ) {
      case mainPage:
        page = const MyHomePage(title: "My Home Page");
        break;
      case secondPage:
        page = SecondPage(params: routeSettings.arguments.toString());
        break;
      default:
        page = const Scaffold();
    }
    return MaterialPage(
        child: page,
        key: Key(routeSettings.name!) as LocalKey,
        name: routeSettings.name,
        arguments: routeSettings.arguments
    );
  }

  Future<bool> _confirmExit() async {
    final result = await showDialog<bool>(
        context: navigatorKey.currentContext!,
        builder: (context) {
          return AlertDialog(
              content: Text("确认退出吗？"),
              actions: [
                TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: Text("取消")
                ),
                TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: Text("确定")
                ),
              ]
          );
        }
    );
    return result ?? true;
  }


}
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:favorcate/ui/pages/main/main.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/ui/pages/detail/detail.dart';
import 'package:favorcate/ui/pages/filter/filter.dart';

class ZMJRouter {

  static final String initialRoute = ZMJMainScreen.routeName;

  static final Map<String, WidgetBuilder> routes = {
    ZMJMainScreen.routeName: (ctx) => ZMJMainScreen(),
    ZMJMealScreen.routeName: (ctx) => ZMJMealScreen(),
    ZMJDetailScreen.routeName: (ctx) => ZMJDetailScreen()
  };

  // 自己扩展
  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ZMJFilterScreen.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return ZMJFilterScreen();
          },
          fullscreenDialog: true
      );
    }

    return null;
  };

  static final RouteFactory unknownRoute = (settings) {
    return null;
  };

}
import 'package:flutter/material.dart';

import '../main.dart';
import '../about.dart';
import '../detail.dart';
import '../unknown.dart';

class ZMJRouter {


  static final Map<String, WidgetBuilder> routes = {
    ZMJHomePage.routeName: (ctx) => ZMJHomePage(),
    ZMJAboutPage.routeName: (ctx) => ZMJAboutPage()
  };


  static final String initialRoute = ZMJHomePage.routeName;


  static final RouteFactory generateRoute = (settings) {
    if (settings.name == ZMJDetailPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx) {
            return ZMJDetailPage(settings.arguments);
          }
      );
    }
    return null;
  };


  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
        builder: (ctx) {
          return ZMJUnknownPage();
        }
    );
  };


}




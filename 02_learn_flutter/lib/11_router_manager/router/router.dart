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

  static const String initialRoute = ZMJHomePage.routeName;

  // ignore: prefer_function_declarations_over_variables
  // static final RouteFactory generateRoute = (settings) {
  //   if (settings.name == ZMJDetailPage.routeName) {
  //       return MaterialPageRoute(
  //         builder: (ctx){
  //           return ZMJDetailPage(settings.arguments as String);
  //         }
  //       );
  //   }
  //   return null;
  // };


  static Route? generate  (RouteSettings settings) {
    if (settings.name == ZMJDetailPage.routeName) {
      return MaterialPageRoute(
          builder: (ctx){
            return ZMJDetailPage(settings.arguments as String);
          }
      );
    }
    return null;
  }

  static  RouteFactory generateRoute =  ZMJRouter.generate;

  // ignore: prefer_function_declarations_over_variables
  static final RouteFactory unknownRoute = (settings) {
    return MaterialPageRoute(
          builder: (ctx) {
            return ZMJUnkownPage();
          }
        );
  };




}



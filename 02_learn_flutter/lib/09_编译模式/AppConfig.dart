import 'package:flutter/foundation.dart';

class AppConfig {
  //1、接口域名： 3种运行模式，包括 Debug、Release 和 Profile
  static String get apiBaseUrl {
    if (kReleaseMode) {
      return "";
    } else if (kProfileMode) {
      return "";
    } else {
      return "";
    }
  }
}

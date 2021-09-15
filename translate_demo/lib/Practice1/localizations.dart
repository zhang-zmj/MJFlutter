import 'package:flutter/cupertino.dart';

class ZMJLocalizations {

  final Locale locale;
  ZMJLocalizations(this.locale);

  static ZMJLocalizations of(BuildContext context) {
    return Localizations.of(context, ZMJLocalizations);
  }

  static Map<String, Map<String, String>> _localizeValues = {

    "en": {
      "title": "Home",
      "hello": "Hello~",
      "pickTime": "Pick a Time~",
      "message": "Hello World"
    },

    "zh": {
      "title": "首页",
      "hello": "你好~",
      "pickTime": "选择一个时间~",
      "message": "你好 世界"
    }

  };


  String get title {
    return _localizeValues[locale.languageCode]["title"];
  }

  String get hello {
    return _localizeValues[locale.languageCode]["hello"];
  }

  String get pickTime {
    return _localizeValues[locale.languageCode]["pickTime"];
  }
}



import 'dart:convert';
import 'package:crypto/crypto.dart';



export '../../hi_cache/LocalStorage.dart';
export '../core/hi_net.dart';
export '../core/base_request.dart';
export '../request/login_request.dart';
export '../request/register_request.dart';
export '../request/video_List_request.dart';
export '../request/news_List_request.dart';
export '../request/menu_request.dart';
export '../request/collection_request.dart';






  Map<String, dynamic> getParamsMd5WithSort(Map<String, dynamic> value) {

    const pointsMD5Key = "9df4100e6728473d92363d8ab6095426";
    var sortedKeys = value.keys.toList()..sort();
    String millis =  (DateTime.now().millisecondsSinceEpoch).toString();
    var str = pointsMD5Key + millis;
    for (var element in sortedKeys) {
      str += value[element].toString();
    }

    Map<String, dynamic> result = value;
    result["ts"] = millis;
    var content =  utf8.encode(str);
    var digest = md5.convert(content);
    result["md5"] = digest.toString();
    return result;
  }

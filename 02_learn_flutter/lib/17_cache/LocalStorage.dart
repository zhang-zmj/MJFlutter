import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {


  SharedPreferences? prefs;

  LocalStorage._() {
    init();
  }

  static LocalStorage? _instance;
  LocalStorage._pre(this.prefs);

  ///预初始化，防止在使用get时，prefs还未完成初始化
  static Future<LocalStorage> preInit() async {
    if (_instance == null) {
      var prefs = await SharedPreferences.getInstance();
      _instance = LocalStorage._pre(prefs);
    }
    return _instance!;
  }

  static LocalStorage getInstance() {
    _instance ??= LocalStorage._();
    return _instance!;
  }

  void init() async {
    prefs ??= await SharedPreferences.getInstance();
  }

  // 通用设置持久化数据
   setLocalStorage<T>(String key, T value) async  {
    String type = value.runtimeType.toString();
    switch (type) {
      case "String":
        prefs?.setString(key, value as String);
        break;
      case "int":
        prefs?.setInt(key, value as int);
        break;
      case "bool":
         prefs?.setBool(key, value as bool);
        break;
      case "double":
        prefs?.setDouble(key, value as double);
        break;
      case "List<String>":
        prefs?.setStringList(key, value as List<String>);
        break;
      case "_InternalLinkedHashMap<String, String>":
        prefs?.setString(key, json.encode(value));
        break;
      case "_InternalLinkedHashMap<String, dynamic>":
        prefs?.setString(key, json.encode(value));
        break;
    }
  }


  // 获取持久化数据
    T getLocalStorage<T>(String key)  {
    dynamic value = prefs?.get(key);
    if (value.runtimeType.toString() == "String") {
      if (_isJson(value)) {
        return jsonToMap(value);
      }
    }
    return value;
  }

  // 移除单个
    remove(String key)  {
     prefs?.remove(key);
   }

  // 清空所有
   clear() async {
       prefs?.clear();
    }

  // 获取持久化数据中所有存入的key
   Set<String>? getKeys() {
    return prefs?.getKeys();
  }

  // 获取持久化数据中是否包含某个key
   bool? containsKey(String key)  {
    return prefs?.containsKey(key);
  }

  // 判断是否是json字符串
  static _isJson(String value) {
    try {
      dynamic json = jsonToMap(value);
      String type = json.runtimeType.toString();
      if (type == "_JsonMap") {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  // JSON的解码
  static dynamic jsonToMap(String value) {
    return json.decode(value);
  }

  // JSON的编码
  static String mapToJson(dynamic value) {
    return json.encode(value);
  }


}
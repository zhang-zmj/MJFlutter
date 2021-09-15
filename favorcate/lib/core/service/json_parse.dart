import 'dart:convert';
import 'package:favorcate/core/model/category_model.dart';
import 'package:flutter/services.dart';

class ZMJsonParse {

  static Future<List<ZMJCategoryModel>> getCategoryData() async {
    // 1.加载json文件
    final jsonString = await rootBundle.loadString("assets/json/category.json");

    // 2.将jsonString转成Map/List
    final result =  json.decode(jsonString);

    // 3.将Map中的内容转成一个个对象
    final resultList = result["category"];
    List<ZMJCategoryModel> categories = [];
    for (var json in resultList) {
      categories.add(ZMJCategoryModel.fromJson(json));
    }

    return categories;
  }

}
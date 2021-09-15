import 'package:favorcate/core/model/meal_model.dart';
import 'http_request.dart';

class ZMJMealRequest {
  static Future<List<ZMJMealModel>> getMealData() async {
    // 1.发送网络请求
    final url = "/meal";
    final result = await HttpRequest.request(url);

    // 2.json转modal
    final mealArray = result["meal"];
    List<ZMJMealModel> meals = [];
    for (var json in mealArray) {
      meals.add(ZMJMealModel.fromJson(json));
    }
    return meals;
  }
}
import 'package:favorcate/core/service/meal_request.dart';
import 'base_view_model.dart';

class ZMJMealViewModel extends BaseMealViewModel {

   ZMJMealViewModel() {
    ZMJMealRequest.getMealData().then((res) {
      meals= res;
      notifyListeners();
    });
  }

}
import 'package:favorcate/core/model/meal_model.dart';
import 'base_view_model.dart';

class ZMJFavorViewModel extends BaseMealViewModel{

  void addMeal(ZMJMealModel meal){
     originMeals.add(meal);
     notifyListeners();
  }

  void removeMeal(ZMJMealModel meal){
    originMeals.remove(meal);
      notifyListeners();
  }

  bool isFavor(ZMJMealModel meal){
     return originMeals.contains(meal);
  }

  void handleMeal(ZMJMealModel meal){
    if (isFavor(meal)){
      removeMeal(meal);
    }else{
      addMeal(meal);
    }
  }
}





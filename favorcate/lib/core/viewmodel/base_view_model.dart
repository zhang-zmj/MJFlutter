import 'package:flutter/cupertino.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'filter_view_model.dart';

class BaseMealViewModel extends ChangeNotifier {

  List<ZMJMealModel> _meals = [];

  ZMJFilterViewModel _filterVM;

  void updateFilters(ZMJFilterViewModel filterVM) {
    _filterVM = filterVM;
  }

  List<ZMJMealModel> get meals {
    return _meals.where((meal) {
      if (_filterVM.isGlutenFree && !meal.isGlutenFree) return false;
      if (_filterVM.isLactoseFree && !meal.isLactoseFree) return false;
      if (_filterVM.isVegetarian && !meal.isVegetarian) return false;
      if (_filterVM.isVegan && !meal.isVegan) return false;
      return true;
    }).toList();
  }

  List<ZMJMealModel> get originMeals {
    return _meals;
  }

  set meals(List<ZMJMealModel> value) {
    _meals = value;
    notifyListeners();
  }


}



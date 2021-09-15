import 'package:favorcate/core/viewmodel/meal_view_model.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:provider/provider.dart';
import 'package:collection/collection.dart';
import 'package:favorcate/ui/widges/meal_item.dart';



class ZMJMealContent extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    //始终获取的是栈顶的数据
    final category = ModalRoute.of(context).settings.arguments as ZMJCategoryModel;

    return Selector<ZMJMealViewModel, List<ZMJMealModel>>(
        shouldRebuild: (pre, next) => !ListEquality().equals(pre, next),
        builder: (ctx, meals, child){
          return ListView.builder(
              itemCount: meals.length,
              itemBuilder: (ctx, index){
                return ZMJMealItem(meals[index]);
              }
          );
        },
        selector: (ctx, mealVM){
          return mealVM.meals.where((meal) {
            return meal.categories.contains(category.id);
          }).toList();
        }
    );


  }
}








// class ZMJMealContent extends StatelessWidget {
//   @override
//   Widget build(BuildContext context){
//     //始终获取的是栈顶的数据
//     final category = ModalRoute.of(context).settings.arguments as ZMJCategoryModel;
//     return Consumer<ZMJMealViewModel>(
//       builder: (ctx, mealVM, child){
//         final meals = mealVM.meals.where((meal) => meal.categories.contains(category.id)).toList();
//         return ListView.builder(
//             itemCount: meals.length,
//             itemBuilder: (ctx, index){
//               return ListTile(title: Text(meals[index].title));
//             });
//         print(mealVM.meals);
//         return Text("${mealVM.meals.length}");
//       },
//     );
//   }
// }






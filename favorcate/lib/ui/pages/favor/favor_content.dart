import 'package:favorcate/ui/widges/meal_item.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:provider/provider.dart';


class ZMJFavorContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<ZMJFavorViewModel>(
        builder: (ctx, favorVM, child){

          if (favorVM.meals.length == 0) {
            return Center(
              child: Text("未收藏美食"),
            );
          }
          return ListView.builder(
              itemCount: favorVM.meals.length,
              itemBuilder: (itemCtx, index){
                return ZMJMealItem(favorVM.meals[index]);
              }
          );
        }

    );
  }
}












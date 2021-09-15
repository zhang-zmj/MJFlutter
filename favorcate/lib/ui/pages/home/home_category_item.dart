import 'package:favorcate/core/model/category_model.dart';
import 'package:favorcate/ui/pages/meal/meal.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';

class ZMJHomeCategoryItem extends StatelessWidget {
  final ZMJCategoryModel _category;
  ZMJHomeCategoryItem(this._category);

  @override
  Widget build(BuildContext context) {
    final bgColor = _category.cColor;

    return GestureDetector(
      child: Container(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(12.px),
          gradient: LinearGradient(
            colors: [
              bgColor.withOpacity(.5),
              bgColor
            ]
          )
        ),
        alignment: Alignment.center,
        child: Text(
          _category.title,
          style: Theme.of(context).textTheme.headline3.copyWith(
              fontWeight: FontWeight.bold
          ),
        )
      ),
      onTap: () {
        Navigator.of(context).pushNamed(ZMJMealScreen.routeName, arguments: _category);
      },
    );
  }
}







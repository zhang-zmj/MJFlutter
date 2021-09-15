import 'package:favorcate/core/viewmodel/favor_view_model.dart';
import 'package:flutter/material.dart';
import "package:favorcate/ui/pages/detail/detail.dart";
import 'package:favorcate/ui/widges/operation_item.dart';
import 'package:favorcate/core/model/meal_model.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:provider/provider.dart';

final cardRadius = 12.px;

class ZMJMealItem extends StatelessWidget {
  final ZMJMealModel _meal;
  ZMJMealItem(this._meal);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:  Card(
        margin: EdgeInsets.all(10.px),
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(cardRadius)),
        child: Column(
          children: <Widget>[
            buildBasicInfo(context),
            buildOperationInfo()
          ],
        ),
      ),
      onTap: (){
        Navigator.of(context).pushNamed(ZMJDetailScreen.routeName, arguments: _meal);
      },
    );
  }

  Widget buildBasicInfo(BuildContext context){
    return Stack(
      children: <Widget>[
        ClipRRect(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(cardRadius),
              topRight: Radius.circular(cardRadius)
          ),
          child: Image.network(_meal.imageUrl, width: double.infinity,height: 250.px, fit: BoxFit.cover),
        ),
        Positioned(
            right: 10.px,
            bottom: 10.px,
            child: Container(
              width: 300.px,
              padding: EdgeInsets.symmetric(horizontal: 10.px, vertical: 5.px),
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(6.px)
              ),
              child: Text(_meal.title, style: Theme.of(context).textTheme.headline2.copyWith(color: Colors.white)),
            )
        )
      ],
    );
  }

  Widget buildOperationInfo(){
    return Padding(
        padding: EdgeInsets.all(16.px),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            ZMJOperationItem(Icon(Icons.schedule), "${_meal.duration}分钟"),
            ZMJOperationItem(Icon(Icons.restaurant), "${_meal.complexStr}"),
            buildFavorItem(),
          ],
        ),
    );
  }


  Widget buildFavorItem(){

    return Consumer<ZMJFavorViewModel>(
        builder: (ctx, favorVM, child){
          final iconData = favorVM.isFavor(_meal) ?  Icons.favorite : Icons.favorite_border;
          final iconColor = favorVM.isFavor(_meal) ? Colors.red : Colors.black;
          final title = favorVM.isFavor(_meal) ? "收藏" : "未收藏" ;
          return GestureDetector(
            child: ZMJOperationItem(
                 Icon(iconData, color: iconColor),
                 title,
                 textColor: iconColor,
                ),
                 onTap: (){
                      favorVM.handleMeal(_meal);
                 },
           );
         },
    );
  }


}












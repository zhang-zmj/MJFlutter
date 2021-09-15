import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:favorcate/core/viewmodel/filter_view_model.dart';
import 'package:provider/provider.dart';

class ZMJFilterContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        buildChoiceTitle(context),
        buildChoiceSelect()
      ],
    );
  }


  Widget buildChoiceTitle(BuildContext context){
    return Container(
      padding: EdgeInsets.all(20.px),
      alignment: Alignment.center,
      child: Text("展示你的选择", style: Theme.of(context).textTheme.headline2),
    );
  }



  Widget buildChoiceSelect() {
    return Expanded(
      child: Consumer<ZMJFilterViewModel>(
        builder: (ctx, filterVM, child) {
          return ListView(
            children: <Widget>[
              buildListTile("无谷蛋白", "无谷蛋白", filterVM.isGlutenFree, (value) {
                filterVM.isGlutenFree = value;
              }),
              buildListTile("不含乳糖", "不含乳糖", filterVM.isLactoseFree, (value) {
                filterVM.isLactoseFree = value;
              }),
              buildListTile("素食主义", "素食主义", filterVM.isVegetarian, (value) {
                filterVM.isVegetarian = value;
              }),
              buildListTile("严格素食主义", "严格素食主义", filterVM.isVegan, (value) {
                filterVM.isVegan = value;
              }),
            ],
          );
        },
      ),
    );
  }

  Widget buildListTile(String title, String subTitle,bool value, Function onChange){
    return ListTile(
      title: Text(title),
      subtitle: Text(subTitle),
      trailing: Switch(value: value, onChanged: onChange)
    );
  }


}







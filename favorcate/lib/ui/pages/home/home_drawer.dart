import 'package:favorcate/ui/pages/filter/filter.dart';
import 'package:flutter/cupertino.dart';
import 'package:favorcate/core/extension/int_extension.dart';
import 'package:flutter/material.dart';

class ZMJHomeDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250.px,
      child: Drawer(
        child: Column(
          children: <Widget>[
            buildHeaderView(context),
            buildListTitle(context, Icon(Icons.restaurant), "进餐", (){
                Navigator.of(context).pop();
            }),
            buildListTitle(context, Icon(Icons.settings), "过滤", (){
                Navigator.of(context).pushNamed(ZMJFilterScreen.routeName);
            }),
          ],
        ),
      ),
    );
  }


  Widget buildHeaderView(BuildContext context){
    return Container(
       width: double.infinity,
       height: 120.px,
       color: Colors.orange,
       margin: EdgeInsets.only(bottom: 20.px),
       alignment: Alignment(0, 0.5),
       child: Text("开始动手", style: Theme.of(context).textTheme.headline3),
    );
  }

  Widget buildListTitle(BuildContext context, Widget icon, String title, Function handler){
    return ListTile(
      leading: icon,
      title: Text(title, style: Theme.of(context).textTheme.headline3),
      onTap: handler,
    );
  }




}





import 'package:flutter/material.dart';


class SeparatedWidget extends StatefulWidget {
  const SeparatedWidget({Key? key}) : super(key: key);

  @override
  State<SeparatedWidget> createState() => _SeparatedWidgetState();
}

class _SeparatedWidgetState extends State<SeparatedWidget> {
  @override
  Widget build(BuildContext context) {
    //下划线widget预定以供复用
    Widget divider1 = Divider(color: Colors.blue);
    Widget divider2 = Divider(color: Colors.green);
    return ListView.separated(
        itemCount: 100,
        //列表项构造器
        itemBuilder: (BuildContext context, int index){
          return ListTile(title: Text("--------$index"));
        },
        separatorBuilder: (BuildContext context, int index){
          return index % 2 == 0 ? divider1 : divider2;
        },

    );
  }
}




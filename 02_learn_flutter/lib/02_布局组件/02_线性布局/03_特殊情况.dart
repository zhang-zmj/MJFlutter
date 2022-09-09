import 'package:flutter/material.dart';

class SpecialWidget extends StatefulWidget {
  const SpecialWidget({Key? key}) : super(key: key);

  @override
  State<SpecialWidget> createState() => _SpecialWidgetState();
}

class _SpecialWidgetState extends State<SpecialWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Expanded(
          child: Container(
              color: Colors.red,
              child: Column(
                //无效，内层Colum高度为实际高度
                mainAxisSize: MainAxisSize.max,
                children: [Text("hello world"), Text("I anm jack")],
              ),
          )
        ),
      ),
    );
  }


  Widget _firstWidget() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      //有效，外层Colum高度为整个屏幕
      mainAxisSize: MainAxisSize.max,
      children: [
        Container(
          color: Colors.red,
          child: Column(
            //无效，内层Colum高度为实际高度
            mainAxisSize: MainAxisSize.max,
            children: [Text("hello world"), Text("I anm jack")],
          ),
        )
      ],
    );
  }

}

/*
  1、如果Row里面嵌套Row，或者Column里面再嵌套Column，那么只有最外面的Row或Column会占用尽可能大的空间，
    里面Row或Column所占用的空间为实际大小
  2、如果要让里面的Column占满外部Column，可以使用Expanded 组件
*/



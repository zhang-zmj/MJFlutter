import 'package:flutter/material.dart';
import '02_DoneWidget.dart';

class SelectDoneWidget extends StatefulWidget {
  const SelectDoneWidget({Key? key}) : super(key: key);

  @override
  State<SelectDoneWidget> createState() => _SelectDoneWidgetState();
}

class _SelectDoneWidgetState extends State<SelectDoneWidget> {

  bool isSelect = false;

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _getSelectWidget(2, Colors.blue, true),
          Text("操作成功"),
          _getSelectWidget(2, Colors.green, false),
        ]
      ),
    );
  }





  Widget _getSelectWidget(double strokeWidth, Color color, bool outline) {

    return DoneWidget(
      strokeWidth: strokeWidth,
      color: color,
      outline:  outline,
    );

  }

}



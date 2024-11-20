import 'package:flutter/material.dart';

class MJRadioWidget extends StatefulWidget {
  const MJRadioWidget({super.key});

  @override
  State<MJRadioWidget> createState() => _MJRadioWidgetState();
}

class _MJRadioWidgetState extends State<MJRadioWidget> {
  bool _switchSelected = true; //维护单选开关状态
  bool _checkboxSelected = true; //维护复选框状态
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Switch(
          value: _switchSelected, //当前状态
          onChanged: (value) {
            //重新构建页面
            setState(() {
              _switchSelected = value;
            });
          },
          activeColor: Colors.red,
        ),
        Checkbox(
            activeColor: Colors.red,
            value: _checkboxSelected,
            onChanged: (value) {
              setState(() {
                _checkboxSelected = value!;
              });
            }),
      ],
    );
  }
}




/*
它们都有一个activeColor属性，用于设置激活态的颜色。至于大小，到目前为止，
Checkbox的大小是固定的，无法自定义，而Switch只能定义宽度，高度也是固定的。
值得一提的是Checkbox有一个属性tristate ，表示是否为三态，其默认值为false ，
这时 Checkbox 有两种状态即“选中”和“不选中”，对应的 value 值为true和false ；
如果tristate值为true时，value 的值会增加一个状态null
*/






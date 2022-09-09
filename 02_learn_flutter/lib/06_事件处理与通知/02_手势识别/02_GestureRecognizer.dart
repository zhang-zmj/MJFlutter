import 'package:flutter/material.dart';
import 'package:flutter/gestures.dart';


/*
*  GestureDetector内部是使用一个或多个GestureRecognizer来识别各种手势的
*  GestureRecognizer是一个抽象类，一种手势的识别器对应一个GestureRecognizer的子类
*/

class GestureRecognizerWidget extends StatefulWidget {
  const GestureRecognizerWidget({
    Key? key,
  }) : super(key: key);

  @override
  State<GestureRecognizerWidget> createState() => _GestureRecognizerWidgetState();
}

class _GestureRecognizerWidgetState extends State<GestureRecognizerWidget> {

  final TapGestureRecognizer _tapGestureRecognizer = TapGestureRecognizer();
  bool _toggle = false; //变色开关


  @override
  void dispose() {
    //用到GestureRecognizer的话一定要调用其dispose方法释放资源
    _tapGestureRecognizer.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(
          TextSpan(
              children: [
                TextSpan(text: "你好世界"),
                TextSpan(
                    text: "点我变色",
                    style: TextStyle(
                      fontSize: 30.0,
                      color: _toggle ? Colors.blue : Colors.red,
                    ),
                    recognizer: _tapGestureRecognizer
                      ..onTap = () {
                        setState(() {
                          _toggle = !_toggle;
                        });
                      }
                ),
                TextSpan(text: "你好世界"),
              ]
          )
      ),
    );
  }
}

import 'package:flutter/material.dart';

/*
  1、B 组件中在布局 C 时不约束C（可以为无限大）。
  2、C 根据自身真实的空间占用来确定自身的大小。
  3、B 在遵守 A 的约束前提下结合子组件的大小确定自身大小

  * 如果UnconstrainedBox 的大小超过它父组件约束时，也会导致溢出报错
  * 请牢记，任何时候子组件都必须遵守其父组件的约束，所以在此提示读者，在定义一个通用的组件时，
    如果要对子组件指定约束，那么一定要注意，因为一旦指定约束条件，子组件自身就不能违反约束
*/

class UnconstrainedBoxWidget extends StatefulWidget {
  const UnconstrainedBoxWidget({Key? key}) : super(key: key);
  @override
  State<UnconstrainedBoxWidget> createState() => _UnconstrainedBoxWidgetState();
}

class _UnconstrainedBoxWidgetState extends State<UnconstrainedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("去除父组件约束"),
        actions: <Widget>[
          UnconstrainedBox(
            child: SizedBox(
              width: 20,
              height: 20,
              child: CircularProgressIndicator(
                strokeWidth: 3,
                valueColor: AlwaysStoppedAnimation(Colors.white70),
              ),
            ),
          )
        ],
      )
    );
  }
}




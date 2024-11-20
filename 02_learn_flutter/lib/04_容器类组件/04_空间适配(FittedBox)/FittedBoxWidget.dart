import 'package:flutter/material.dart';

class MJFittedBoxWidget extends StatefulWidget {
  const MJFittedBoxWidget({super.key});
  @override
  State<MJFittedBoxWidget> createState() => _MJFittedBoxWidgetState();
}

class _MJFittedBoxWidgetState extends State<MJFittedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          // 1、
          wContainer(BoxFit.none),
          const Text('Wendux', style: TextStyle(color: Colors.green)),
          const SizedBox(height: 20),
          wContainer(BoxFit.contain),
          const Text('Flutter中国'),

          // 2、
          wRow('90000000000000000'),
          SingleLineFittedBox(child: wRow('90000000000000000')),
          wRow('800'),
          SingleLineFittedBox(child: wRow('800'))
        ]
            .map((e) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: e,
                ))
            .toList(),
      ),
    );
  }
}

//1、适配原理
Widget wContainer(BoxFit boxFit) {
  return Container(
    width: 50,
    height: 50,
    color: Colors.blue,
    child: FittedBox(
      fit: boxFit,
      child: Container(width: 30, height: 30, color: Colors.red),
    ),
  );
}

//2、直接使用Row
Widget wRow(String text) {
  Widget child = Text(text);
  child = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [child, child, child],
  );
  return child;
}

//3、溢出处理
class SingleLineFittedBox extends StatelessWidget {
  final Widget? child;
  const SingleLineFittedBox({super.key, this.child});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (_, constraints) {
        return FittedBox(
            child: ConstrainedBox(
                constraints: constraints.copyWith(
                  minWidth: constraints.maxWidth,
                  maxWidth: double.infinity,
                  // maxWidth: constraints.maxWidth,
                ),
                child: child));
      },
    );
  }
}



/*
1、FittedBox 在布局子组件时会忽略其父组件传递的约束，可以允许子组件无限大，
    即FittedBox 传递给子组件的约束为（0<=width<=double.infinity, 0<= height <=double.infinity）。
2、FittedBox 对子组件布局结束后就可以获得子组件真实的大小。
3、FittedBox 知道子组件的真实大小也知道他父组件的约束，那么FittedBox
    就可以通过指定的适配方式（BoxFit 枚举中指定），让起子组件在 FittedBox
    父组件的约束范围内按照指定的方式显示。
*/
 

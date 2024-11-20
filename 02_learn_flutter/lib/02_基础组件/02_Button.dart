import 'package:flutter/material.dart';

class MJButtonDemo extends StatefulWidget {
  const MJButtonDemo({super.key});

  @override
  State<MJButtonDemo> createState() => _MJButtonDemoState();
}

class _MJButtonDemoState extends State<MJButtonDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1.ElevatedButton：即"漂浮"按钮，它默认带有阴影和灰色背景
        ElevatedButton(
          onPressed: () {
            debugPrint("ElevatedButton Click");
          },
          style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
          child: const Text("ElevatedButton"),
        ),

        // 2.TextButton：文本按钮，它默认没有阴影和背景
        TextButton(
            onPressed: () {
              debugPrint("TextButton Click");
            },
            autofocus: true, //设置按钮是否自动获取焦点
            // WidgetStateProperty、WidgetStatePropertyAll 与 ButtonStyle 结合设置按钮的样式
            style: ButtonStyle(
              textStyle: const WidgetStatePropertyAll(TextStyle(fontSize: 18, color: Colors.red)),
              // 按钮的前景色，即按钮上的文本颜色
              foregroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.focused) && !states.contains(WidgetState.pressed)) {
                  //获取焦点时的颜色
                  return Colors.blue;
                } else if (states.contains(WidgetState.pressed)) {
                  //按下时的颜色
                  return Colors.deepPurple;
                }
                //默认状态使用灰色
                return Colors.grey;
              }),
              //背景颜色
              backgroundColor: WidgetStateProperty.resolveWith((states) {
                if (states.contains(WidgetState.pressed)) {
                  //获取焦点时的颜色
                  return Colors.blue[200];
                }
                //默认不使用背景颜色
                return null;
              }),
              //设置水波纹颜色
              overlayColor: WidgetStateProperty.all(Colors.yellow),
              //设置阴影  不适用于这里的TextButton
              elevation: WidgetStateProperty.all(0),
              //设置按钮内边距
              padding: WidgetStateProperty.all(const EdgeInsets.all(10)),
              //设置按钮的大小
              minimumSize: WidgetStateProperty.all(const Size(200, 100)),
              //设置边框
              side: WidgetStateProperty.all(const BorderSide(color: Colors.red, width: 5)),
              //外边框装饰 会覆盖 side 配置的样式
              shape: WidgetStateProperty.all(const StadiumBorder()),
            ),
            child: const Text("TextButton按钮"))
      ],
    );
  }
}

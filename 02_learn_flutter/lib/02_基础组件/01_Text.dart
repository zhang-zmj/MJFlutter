import 'package:flutter/material.dart';

class MJTextDemo extends StatefulWidget {
  const MJTextDemo({super.key});

  @override
  State<MJTextDemo> createState() => _MJTextDemoState();
}

class _MJTextDemoState extends State<MJTextDemo> {
  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        //1、控制文本显示样式的一些属性
        Text("Hello world! I'm Jack. ",
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            textScaler: TextScaler.linear(1.5)),

        //2、用于指定文本显示的样式如颜色、字体、粗细、背景等
        Text("Hello Flutter",
            style: TextStyle(
              color: Colors.red,
              fontSize: 20,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic,
              decoration: TextDecoration.underline,
              decorationColor: Colors.blue,
              decorationStyle: TextDecorationStyle.dashed,
              decorationThickness: 2,
            )),

        //3、对一个 Text 内容的不同部分按照不同的样式显示
        Text.rich(TextSpan(
          text: "zhangmj",
          style: TextStyle(color: Colors.red, fontSize: 20),
          children: [
            TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
            TextSpan(text: "Hello flutter", style: TextStyle(color: Colors.green)),
            WidgetSpan(
                child: Icon(
              Icons.favorite,
              color: Colors.red,
            )),
            TextSpan(text: "Hello dart", style: TextStyle(color: Colors.blue)),
          ],
        )),
        //4、在 Widget 树中，文本的样式默认是可以被继承的
        DefaultTextStyle(
          //1.设置文本默认样式
          style: TextStyle(
            color: Colors.red,
            fontSize: 20.0,
          ),
          textAlign: TextAlign.start,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("hello world"),
              Text("I am Jack"),
              Text(
                "I am Jack",
                style: TextStyle(
                    inherit: false, //2.不继承默认样式
                    color: Colors.grey),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

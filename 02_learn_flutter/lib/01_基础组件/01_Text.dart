import 'package:flutter/material.dart';

class TextDemo extends StatefulWidget {
  const TextDemo({Key? key}) : super(key: key);
  @override
  State<TextDemo> createState() => _TextDemoState();
}

class _TextDemoState extends State<TextDemo> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //1、控制文本显示样式的一些属性
            Text("Hello world! I'm Jack. "*4,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textScaleFactor: 1.5,
              textAlign: TextAlign.left,
          ),
       //2、用于指定文本显示的样式如颜色、字体、粗细、背景等
            Text("Hello world",
                   style: TextStyle(
                        color: Colors.blue,
                        fontSize: 18.0,
                        height: 1.2,
                        // 由于不同平台默认支持的字体集不同，所以在手动指定字体时一定要先在不同平台测试一下
                        fontFamily: "Courier",
                        background: Paint()..color=Colors.yellow,
                        decoration:TextDecoration.underline,
                        decorationStyle: TextDecorationStyle.dashed
                   ),
             ),
        //3、对一个 Text 内容的不同部分按照不同的样式显示
            Text.rich(
                TextSpan(
                // text: "Hello World",
                // style: TextStyle(color: Colors.red, fontSize: 20)
                  children: [
                      TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
                      TextSpan(text: "Hello flutter", style: TextStyle(color: Colors.green)),
                      WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
                      TextSpan(text: "Hello dart", style: TextStyle(color: Colors.blue)),
                  ]
                )
            ),
        //4、在 Widget 树中，文本的样式默认是可以被继承的
            DefaultTextStyle(
              //1.设置文本默认样式
              style: TextStyle(
                color:Colors.red,
                fontSize: 20.0,
              ),
              textAlign: TextAlign.start,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                      Text("hello world"),
                      Text("I am Jack"),
                      Text("I am Jack",
                      style: TextStyle(
                          inherit: false, //2.不继承默认样式
                          color: Colors.grey
                      ),
                      ),
                  ],
              ),
            ),

        //5、在 Flutter 应用程序中使用不同的字体
            




      ],
    );
  }
}



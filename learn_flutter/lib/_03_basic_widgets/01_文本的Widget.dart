import 'package:flutter/material.dart';

class TextRichDemo extends StatelessWidget {
  const TextRichDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text.rich(
        TextSpan(
//        text: "Hello World",
//        style: TextStyle(color: Colors.red, fontSize: 20)
            children: [
              TextSpan(text: "Hello World", style: TextStyle(color: Colors.red)),
              TextSpan(text: "Hello flutter", style: TextStyle(color: Colors.green)),
              WidgetSpan(child: Icon(Icons.favorite, color: Colors.red,)),
              TextSpan(text: "Hello dart", style: TextStyle(color: Colors.blue)),
            ]
        )
    );
  }
}


// Text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      textAlign: TextAlign.center,
      maxLines: 3,
      overflow: TextOverflow.ellipsis,
//      textScaleFactor: 1.5,
      style: TextStyle(
          fontSize: 20,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
    );
  }
}
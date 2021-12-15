import 'package:flutter/material.dart';

class ZMJHomeDemo extends StatefulWidget {
  @override
  _ZMJHomeDemoState createState() => _ZMJHomeDemoState();
}

class _ZMJHomeDemoState extends State<ZMJHomeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("基础Widget"),
        ),
        body:ZMJHomeContent()
    );
  }
}

// StatefulWidget的生命周期
class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  @override
  Widget build(BuildContext context) {
    return Text.rich(
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
    );
  }

}






// Text Widget
class TextDemo extends StatelessWidget {
  const TextDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "《定风波》 苏轼 莫听穿林打叶声，何妨吟啸且徐行。竹杖芒鞋轻胜马，谁怕？一蓑烟雨任平生。",
      style: TextStyle(
          fontSize: 15,
          color: Colors.red,
          fontWeight: FontWeight.bold
      ),
      textAlign: TextAlign.center,
      maxLines: 2,
      overflow: TextOverflow.ellipsis,
      textScaleFactor: 1.5,
    );
  }
}



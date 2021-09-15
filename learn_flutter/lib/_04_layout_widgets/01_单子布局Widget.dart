import 'package:flutter/material.dart';

main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        debugShowCheckedModeBanner: false,
        home: ZMJHomePage()
    );
  }

}

class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Text组件"),
      ),
      body: ZMJHomeContent(),
    );
  }
}


class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 200,
      height: 200,
      // color: Colors.red,
      alignment: Alignment(-1,-1),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(10),
      child: Icon(Icons.pets, color: Colors.white, size: 50),
      // transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
          color: Colors.red,
          // border: Border.all(
          //   width: 5,
          //   color: Colors.purple,
          // ),
          // borderRadius: BorderRadius.circular(100),
          boxShadow: [
            BoxShadow(
                color: Colors.orange,
                offset: Offset(10, 10),
                spreadRadius: 5,
                blurRadius: 10
            ),
            BoxShadow(
                color: Colors.blue,
                offset: Offset(-10, 10),
                spreadRadius: 5,
                blurRadius: 10
            ),
          ]
      ),
    );

  }

}









class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
          padding: EdgeInsets.symmetric(vertical: 5),
          child: Text("你好啊，李银河",style: TextStyle(fontSize: 30, backgroundColor: Colors.blue)),
        ),
        Text("你好啊，李银河",style: TextStyle(fontSize: 30, backgroundColor: Colors.blue)),
        Text("你好啊，李银河",style: TextStyle(fontSize: 30, backgroundColor: Colors.blue)),
      ],
    );
  }
}




class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: Align(
        //左上角(-1,-1)  右上角(1,-1)  左下角(-1,1) 右下角(1,1)
        alignment: Alignment(1,1),
        widthFactor: 10,
        heightFactor: 10,
        child: Icon(Icons.pets, size: 50),
      ),
    );
  }
}

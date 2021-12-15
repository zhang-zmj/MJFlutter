import 'package:flutter/material.dart';


// StatefulWidget的生命周期
class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  @override
  Widget build(BuildContext context) {
    // ignore: avoid_unnecessary_containers
    return Container(
      width: 200,
      height: 200,
      alignment: Alignment(0,0),
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(30),
      child: Text("Hello World"),
      // transform: Matrix4.rotationZ(50),
      decoration: BoxDecoration(
          color: Colors.red,
          border: Border.all(
              width: 5,
              color: Colors.purple
          ),
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(color: Colors.blue, offset: Offset(-10,10), spreadRadius:5, blurRadius: 10),
            BoxShadow(color: Colors.orange, offset: Offset(-10,-10), spreadRadius:5, blurRadius: 10),
            BoxShadow(color: Colors.green, offset: Offset(10,-10), spreadRadius:5, blurRadius: 10),
            BoxShadow(color: Colors.purple, offset: Offset(10,10), spreadRadius:5, blurRadius: 10)
          ],
          image: DecorationImage(
            image: NetworkImage("https://tva1.sinaimg.cn/large/006y8mN6gy1g7aa03bmfpj3069069mx8.jpg"),
          )
      ),
    );
  }

}


//2、Padding布局方式
class PaddingDemo extends StatelessWidget {
  const PaddingDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      // const EdgeInsets.all(8.0)
      // const EdgeInsets.only(top: 10, left: 20),
      padding: const EdgeInsets.fromLTRB(30, 30, 0, 0),
      child: Text("你好啊，张明军", style: TextStyle(fontSize: 30, backgroundColor: Colors.red)),
    );
  }

}


//1、Align对齐方式
class AlignDemo extends StatelessWidget {
  const AlignDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        //如果非空，则将其宽/搞度设置为子元素的宽度乘以该因子，可以大于或小于1.0，但必须是正数。
        widthFactor: 10,
        heightFactor: 5,
        child: Icon(Icons.pets, size: 30, color: Colors.red)
    );
  }
}


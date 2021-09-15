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

    return Dmeo4();

  }
}


class Dmeo4 extends StatelessWidget {
  const Dmeo4({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/juren.jpeg");
  }
}



class Demo3 extends StatelessWidget {
  const Demo3({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image(
        image: AssetImage("assets/images/juren.jpeg")
    );
  }
}



class Demo2 extends StatelessWidget {
  const Demo2({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image.network(imageURL);
  }
}



class Demo1 extends StatelessWidget {
  const Demo1({
    Key key,
    @required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Image(
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      fit: BoxFit.fitWidth,
      // alignment: Alignment.bottomCenter,
      //范围：-1，1
      alignment: Alignment(0, 0),
      color: Colors.red,
      colorBlendMode: BlendMode.colorDodge,
      repeat: ImageRepeat.repeatX,

    );
  }
}
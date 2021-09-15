
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
        title: Text("商品列表"),
      ),
      body: ZMJHomeContent(),
    );
  }
}


class ZMJHomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        ZMJHomeProductItem("Apple1","MackBook1","https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=254227833,2895364564&fm=11&gp=0.jpg"),
        SizedBox(height: 8),
        ZMJHomeProductItem("Apple2","MackBook2","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606314833349&di=f1059756bcf3156d6f4f4c83b6077bbe&imgtype=0&src=http%3A%2F%2Fpic1.zhimg.com%2F50%2Fv2-167e554cf8ef71b62c23a7463a21e70f_hd.jpg%3Fsource%3D1940ef5c"),
        SizedBox(height: 8),
        ZMJHomeProductItem("Apple3","MackBook3","https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1606314833348&di=f8c113852e6edf637502c472552c4397&imgtype=0&src=http%3A%2F%2F01.minipic.eastday.com%2F20170421%2F20170421201450_3432d64c35d5e3195c67918b745342b2_8.jpeg"),
      ],
    );
  }
}

class ZMJHomeProductItem extends StatelessWidget {

  final String title;
  final String desc;
  final String imageURL;
  final style1 =  TextStyle(fontSize: 25, color: Colors.orange);
  final style2 =  TextStyle(fontSize: 20, color: Colors.blue);

  ZMJHomeProductItem(this.title,this.desc,this.imageURL);

  @override
  Widget build(BuildContext context) {


    return Container(
      padding: EdgeInsets.all(8),

      decoration: BoxDecoration(
          border: Border.all(
              width: 5,
              color: Colors.purple
          )
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(title, style: style1),
          SizedBox(height: 8),
          Text(desc, style: style2),
          SizedBox(height: 8),
          Image.network(imageURL)
        ],
      ),
    );
  }

}








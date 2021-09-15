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

class ZMJHomePage extends StatefulWidget {
  @override
  _ZMJHomePageState createState() => _ZMJHomePageState();
}

class _ZMJHomePageState extends State<ZMJHomePage> {

  ScrollController _controller = ScrollController(initialScrollOffset: 100);
  bool _isShowFloatBtn = true;



  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller.addListener(() {
      print("监听到滚动: -------- ${_controller.offset}");
      setState(() {
        _isShowFloatBtn = _controller.offset >= 100;
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("滚动的监听"),
      ),
      body: NotificationListener(
        onNotification: (ScrollNotification notification){

          if (notification is ScrollStartNotification){
            print("开始监听滚动。。。。。。。");
          }else if (notification is ScrollEndNotification){
            print("结束监听滚动。。。。。。。");
          }if (notification is ScrollUpdateNotification){
            print("正听滚动。。。。。。。总滚动距离：${notification.metrics.maxScrollExtent}       当前滚动的位置：${notification.metrics.pixels}");
          }




          return true;
        },
        child: ListView.builder(
          controller: _controller,
          itemBuilder: (BuildContext ctx, int index){
            return ListTile(
              leading: Icon(Icons.people),
              title: Text("联系人：$index"),
            );
          },
          itemCount: 100,
        ),
      ),
      floatingActionButton: _isShowFloatBtn ? FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: (){
            // controller.jumpTo(0);
            _controller.animateTo(0, duration: Duration(seconds: 2), curve: Curves.easeIn);
          }
      ) : null,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

}





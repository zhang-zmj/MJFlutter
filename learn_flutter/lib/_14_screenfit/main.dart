import 'package:flutter/material.dart';
import 'shared/size_fit.dart';
import './extension/double_extension.dart';
import './extension/int_extension.dart';

main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    ZMJSizeFit.initialize();

    return  MaterialApp(
      debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue, splashColor: Colors.transparent),
        home: ZMJHomePage()
    );
  }


}


class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    //手机屏幕的大小
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    final statusHeight = MediaQuery.of(context).padding.top;
    print("屏幕宽高： $width * $height");
    print("状态栏的高度： $statusHeight");


    return Scaffold(
      appBar:  AppBar(
        title: Text("首页"),
      ),
      body: Center(
          child: Container(
              width: 200.px,
              height: 200.0.px,
              color: Colors.red,
              alignment: Alignment.center,
              child: Text("data", style: TextStyle(fontSize: 40 * ZMJSizeFit.rpx ),)
          )
      ),
     );
  }
}













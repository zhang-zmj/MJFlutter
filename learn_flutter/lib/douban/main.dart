import 'package:flutter/material.dart';
import 'Pages/main/ZMJMainPage.dart';

main() => runApp(MyApp());

//2、代码抽取
class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
        theme: ThemeData(
          primaryColor: Colors.green,
          splashColor: Colors.transparent,
          highlightColor: Colors.transparent
        ),
        home: ZMJMainPage()
    );
  }

}




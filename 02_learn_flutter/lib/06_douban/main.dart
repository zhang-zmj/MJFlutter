import 'package:flutter/material.dart';
import 'pages/main/ZMJMainPage.dart';

main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.green,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent
      ),
      home: ZMJMainPage(),
    );
  }
}





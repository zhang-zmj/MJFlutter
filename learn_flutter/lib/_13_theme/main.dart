import 'package:flutter/material.dart';
import 'package:learn_flutter/_13_theme/shared/app_theme.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: HYAppTheme.norTheme,
      darkTheme: HYAppTheme.darkTheme,
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("首页"),
      ),
      body: Center(
        child: Text("Hello World"),
      ),
    );
  }
}
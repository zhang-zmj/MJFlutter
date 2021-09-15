import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class UserInfo {
  String name;
  int age;
}

class HYCounterWidget extends InheritedWidget {
  // 1.共享的数据
  final int counter;

  // 2.定义构造方法
  HYCounterWidget({this.counter, Widget child}): super(child: child);

  // 3.获取组件最近的当前InheritedWidget
  static HYCounterWidget of(BuildContext context) {
    // 沿着Element树, 去找到最近的HYCounterElement, 从Element中取出Widget对象
    return context.dependOnInheritedWidgetOfExactType();
  }

  // 4.绝对要不要回调State中的didChangeDependencies
  // 如果返回true: 执行依赖当期的InheritedWidget的State中的didChangeDependencies
  @override
  bool updateShouldNotify(HYCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.blue, splashColor: Colors.transparent),
      home: HYHomePage(),
    );
  }
}

class HYHomePage extends StatefulWidget {
  @override
  _HYHomePageState createState() => _HYHomePageState();
}

class _HYHomePageState extends State<HYHomePage> {
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("InheritedWidget"),
      ),
      body: HYCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              HYShowData01(),
              HYShowData02()
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          setState(() {
            _counter++;
          });
        },
      ),
    );
  }
}


class HYShowData01 extends StatefulWidget {
  @override
  _HYShowData01State createState() => _HYShowData01State();
}

class _HYShowData01State extends State<HYShowData01> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了_HYShowData01State中的didChangeDependencies");
  }

  @override
  Widget build(BuildContext context) {
    int counter = HYCounterWidget.of(context).counter;

    return Card(
      color: Colors.red,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
    );
  }

}

class HYShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = HYCounterWidget.of(context).counter;

    return Container(
      color: Colors.blue,
      child: Text("当前计数: $counter", style: TextStyle(fontSize: 30),),
    );
  }
}




















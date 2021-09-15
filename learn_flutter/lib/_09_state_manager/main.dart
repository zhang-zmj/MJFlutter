import 'package:flutter/material.dart';
import 'package:learn_flutter/_09_state_manager/viewModel/counter_view_model.dart';
import 'package:learn_flutter/douban/model/home_model.dart';
import 'package:provider/provider.dart';


void main() {

  runApp(
    ChangeNotifierProvider(
        child: MyApp(),
        create: (ctx) => HYCounterViewModel()
    )
  );

}


class ZMJCounterWidget extends InheritedWidget {

  //1、共享的数据
  final int counter;
  ZMJCounterWidget({this.counter, Widget child}): super(child: child);

  static  ZMJCounterWidget of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType();
  }

  @override
  bool updateShouldNotify(ZMJCounterWidget oldWidget) {
    return oldWidget.counter != counter;
  }

}








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
  int _counter = 100;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("InheritedWidget"),
      ),
      body: ZMJCounterWidget(
        counter: _counter,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ZMJShowData01(),
              ZMJShowData02()
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            setState(() {
              _counter++;
            });
          }),
     );
  }
}





class ZMJShowData01 extends StatefulWidget {
  @override
  _ZMJShowData01State createState() => _ZMJShowData01State();
}

class _ZMJShowData01State extends State<ZMJShowData01> {

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    print("执行了__ZMJShowData01State中的didChangeDependencies方法");
  }


  @override
  Widget build(BuildContext context) {

    int counter = ZMJCounterWidget.of(context).counter;


    return Card(
      color: Colors.red,
      child: Text("当前计数：$counter",style: TextStyle(fontSize: 30)),
    );
  }
}


class ZMJShowData02 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    int counter = ZMJCounterWidget.of(context).counter;


    return Container(
      color: Colors.blue,
      child:Text("当前计数：$counter",style: TextStyle(fontSize: 30)),
    );
  }
}








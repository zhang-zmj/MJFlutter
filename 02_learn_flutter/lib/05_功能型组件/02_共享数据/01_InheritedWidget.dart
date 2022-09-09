import 'package:flutter/material.dart';


class InheritedExampleWidget extends StatefulWidget {
  const InheritedExampleWidget({Key? key}) : super(key: key);
  @override
  State<InheritedExampleWidget> createState() => _InheritedExampleWidgetState();
}

class _InheritedExampleWidgetState extends State<InheritedExampleWidget> {
  int count = 0;


  @override
  Widget build(BuildContext context) {
    return Center(
      child: ShareDataWidget(
          data: count, 
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: _TestWidget(), //子widget中依赖ShareDataWidget
              ),
              ElevatedButton(
                  onPressed: () => setState(() => ++count),
                  child: Text("Increment"))
            ],

          )
      ),
    );
  }


  @override //下文会详细介绍。
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");

  }

}



class ShareDataWidget extends InheritedWidget {

  //需要在子树中共享的数据，保存点击次数
  final int data;

  ShareDataWidget({
    Key? key,
    required this.data,
    required Widget child}) : super(child: child);

   //定义一个便捷方法，方便子树中的widget获取共享数据
  static ShareDataWidget? of(BuildContext context){
    return context.dependOnInheritedWidgetOfExactType<ShareDataWidget>();
  }

  //该回调决定当data发生变化时，是否通知子树中依赖data的Widget重新build
  @override
  bool updateShouldNotify( ShareDataWidget oldWidget) {
    return oldWidget.data != data;
  }
}


class _TestWidget extends StatefulWidget {
  @override
  __TestWidgetState createState() => __TestWidgetState();
}

class __TestWidgetState extends State<_TestWidget> {
  @override
  Widget build(BuildContext context) {
    //使用InheritedWidget中的共享数据
    return Text(ShareDataWidget.of(context)!.data.toString());
  }

  @override //下文会详细介绍。
  void didChangeDependencies() {
    super.didChangeDependencies();
    //父或祖先widget中的InheritedWidget改变(updateShouldNotify返回true)时会被调用。
    //如果build中没有依赖InheritedWidget，则此回调不会被调用。
    print("Dependencies change");
  }
}

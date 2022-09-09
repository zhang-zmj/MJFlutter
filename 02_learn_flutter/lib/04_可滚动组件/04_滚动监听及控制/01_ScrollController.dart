import 'package:flutter/material.dart';

class ScrollControllerWidget extends StatefulWidget {
  const ScrollControllerWidget({Key? key}) : super(key: key);
  @override
  State<ScrollControllerWidget> createState() => _ScrollControllerWidgetState();
}

class _ScrollControllerWidgetState extends State<ScrollControllerWidget> {

  final ScrollController? _controller = ScrollController();
  bool showToTopBtn  = false; //  是否显示“返回到顶部”按钮

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller?.addListener(() {
      // print("----------${_controller?.offset}-"); //打印滚动位置
      if (_controller!.offset <  1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      }else if (_controller!.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("滚动控制")),
      body: Scrollbar(
          controller: _controller,
          child: ListView.builder(
          itemCount: 100,
          itemExtent: 50,
          controller: _controller,
          itemBuilder: (context, index) {
            return ListTile(title: Text("$index"));
          }
       )),
      floatingActionButton: !showToTopBtn ? null : FloatingActionButton(
          child: Icon(Icons.arrow_upward),
          onPressed: () {
            // 返回到顶部时执行动画
            _controller?.animateTo(
                .0,
                duration: Duration(milliseconds: 200),
                curve: Curves.ease
            );
          })
    );
  }
}

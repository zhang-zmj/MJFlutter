import 'package:flutter/material.dart';

class MJScrollControllerWidget extends StatefulWidget {
  const MJScrollControllerWidget({super.key});

  @override
  State<MJScrollControllerWidget> createState() => _MJScrollControllerWidgetState();
}

class _MJScrollControllerWidgetState extends State<MJScrollControllerWidget> {
  final ScrollController _controller = ScrollController();
  bool showToTopBtn = false;

  @override
  void initState() {
    super.initState();
    //监听滚动事件，打印滚动位置
    _controller.addListener(() {
      // print("----------${_controller?.offset}-"); //打印滚动位置
      if (_controller.offset < 1000 && showToTopBtn) {
        setState(() {
          showToTopBtn = false;
        });
      } else if (_controller.offset >= 1000 && showToTopBtn == false) {
        setState(() {
          showToTopBtn = true;
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scrollbar(
            controller: _controller,
            child: ListView.builder(
                itemCount: 100,
                itemExtent: 50,
                controller: _controller,
                itemBuilder: (context, index) {
                  return ListTile(title: Text("$index"));
                })),
        Positioned(
          bottom: 20,
          right: 20,
          child: Visibility(
            visible: showToTopBtn,
            child: ElevatedButton(
                onPressed: () {
                  // 返回到顶部时执行动画
                  _controller.animateTo(.0, duration: const Duration(milliseconds: 200), curve: Curves.ease);
                },
                child: const Icon(Icons.arrow_upward, size: 30)),
          ),
        )
      ],
    );
  }

  @override
  void dispose() {
    //为了避免内存泄露，需要调用_controller.dispose
    _controller.dispose();
    super.dispose();
  }
}

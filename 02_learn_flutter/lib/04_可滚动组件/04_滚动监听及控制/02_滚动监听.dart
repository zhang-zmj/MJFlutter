import 'package:flutter/material.dart';


class ScrollListerWidget extends StatefulWidget {
  const ScrollListerWidget({Key? key}) : super(key: key);

  @override
  State<ScrollListerWidget> createState() => _ScrollListerWidgetState();
}

class _ScrollListerWidgetState extends State<ScrollListerWidget> {
  String _progress = "0%"; //保存进度百分比


  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      //进度条：  监听滚动通知
        child: NotificationListener<ScrollNotification>(
          onNotification: (ScrollNotification notification) {
            double progress = notification.metrics.pixels / notification.metrics.maxScrollExtent;
            //重新构建
            setState(() {
              _progress = "${(progress * 100).toInt()}%";
            });
            print("BottomEdge: ${notification.metrics.extentAfter == 0}");
            return false;
            //return true; //放开此行注释后，进度条将失效
            },
          child: Stack(
            alignment: Alignment.center,
            children: [
              ListView.builder(
                  itemCount: 100,
                  itemExtent: 50,
                  itemBuilder: (context, index) => ListTile(title: Text("$index"))
              ),
              CircleAvatar(
                //显示进度百分比
                radius: 30,
                child: Text(_progress),
                backgroundColor: Colors.black54,
              )
            ],
          ),
        )
    );
  }
}






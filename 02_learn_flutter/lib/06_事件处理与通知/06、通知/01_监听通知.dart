import 'package:flutter/material.dart';


// 通知冒泡可以中止，但用户触摸事件不行
class ScrollNotificationWidget extends StatelessWidget {
  const ScrollNotificationWidget({
    Key? key,
    required this.runtimeType,
  }) : super(key: key);

  @override
  final Type runtimeType;

  @override
  Widget build(BuildContext context) {
    return Center(

      // 指定一个模板参数,该模板参数类型必须是继承自Notification, 便只会接收该参数类型的通知
      child: NotificationListener<ScrollEndNotification>(
        onNotification: (notification) {
          switch(notification.runtimeType) {
            case ScrollStartNotification:  print("开始滚动"); break;
            case ScrollUpdateNotification: print("正在滚动"); break;
            case ScrollEndNotification: print("滚动停止"); break;
            case OverscrollNotification: print("滑动位置未改变通知,滚动到边界"); break;
            case UserScrollNotification: print("有滑动开始后以及滑动结束后回调"); break;
          }
          // true 不再向上一级传递通知， false 向上一级传递通知
          return false;
        },
        child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index){
              return ListTile(title: Text("$index"));
            }
        ),
      ),
    );
  }
}





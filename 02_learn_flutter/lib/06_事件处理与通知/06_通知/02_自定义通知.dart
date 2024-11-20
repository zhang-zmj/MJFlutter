import 'package:flutter/material.dart';

/*
1、Builder：继承自StatelessWidget, 可以传递BuildContext， 可以使用BuildContext来创建一个Widget。
2、LayoutBuilder：  可以提供父widget的大小, 可以使用父widget的大小来创建一个Widget。
3、StatefulBuilder： 继承自StatefulWidget, 可以传递StateSetter， 可以使用StateSetter来更新State。
*/

class MJNotificationRoute extends StatefulWidget {
  const MJNotificationRoute({super.key});
  @override
  State<MJNotificationRoute> createState() => _MJNotificationRouteState();
}

class _MJNotificationRouteState extends State<MJNotificationRoute> {
  String _msg = "";

  @override
  Widget build(BuildContext context) {
    return NotificationListener<MJCustomNotification>(
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Builder(
                builder: (context) {
                  return ElevatedButton(
                    //按钮点击时分发通知
                    onPressed: () => MJCustomNotification("Hi").dispatch(context),
                    child: const Text("Send Notification"),
                  );
                },
              ),
              Text(_msg)
            ],
          ),
        ),
        onNotification: (notification) {
          setState(() {
            _msg += notification.msg;
          });
          return true;
        });
  }
}

class MJCustomNotification extends Notification {
  MJCustomNotification(this.msg);
  final String msg;
}

import 'package:flutter/material.dart';
import './02_自定义通知.dart';

class NotificationRoute extends StatefulWidget {
  @override
  NotificationRouteState createState() {
    return NotificationRouteState();
  }
}

class NotificationRouteState extends State<NotificationRoute> {
  String _msg = "";
  @override
  Widget build(BuildContext context) {
    //监听通知
    return NotificationListener<CustomNotification>(
        onNotification: (notification) {
          debugPrint("---------${notification.msg}------"); //打印通知
          return false;
        },
        child: NotificationListener<CustomNotification>(
          onNotification: (notification) {
            setState(() {
              _msg += notification.msg;
            });
            return false;
          },
          child: Center(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Builder(
                  builder: (context) {
                    return ElevatedButton(
                      //按钮点击时分发通知
                      onPressed: () => CustomNotification("Hi").dispatch(context),
                      child: const Text("Send Notification"),
                    );
                  },
                ),
                Text(_msg)
              ],
            ),
          ),
        ));
  }
}

class CustomNotification extends Notification {
  CustomNotification(this.msg);
  final String msg;
}

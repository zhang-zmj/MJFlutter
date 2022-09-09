import 'package:flutter/material.dart';
import 'custom_event_bus.dart';


class EventBusSend extends StatelessWidget {
  const EventBusSend({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ZMJButton(),
          SizedBox(height: 26),
          ZMJText()
        ],
      ),
    );
  }
}


class ZMJButton extends StatelessWidget {
  const ZMJButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text("按钮"),
      onPressed: () {
        //   2、发出事件
        bus.emit("login", {"name":"zhangmj", "age": 18});
      },
    );
  }
}


class ZMJText extends StatefulWidget {
  const ZMJText({
    Key? key,
  }) : super(key: key);

  @override
  State<ZMJText> createState() => _ZMJTextState();
}

class _ZMJTextState extends State<ZMJText> {
  String _message = "Hello World";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bus.on("login", (arg) {
        setState(() {
          _message = arg["name"];
        });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: TextStyle(fontSize: 20));
  }
}


import 'package:flutter/material.dart';
import './02_custom_event_bus.dart';

class EventBusSend extends StatelessWidget {
  const EventBusSend({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [ZMJButton(), SizedBox(height: 26), ZMJText()],
      ),
    );
  }
}

class ZMJButton extends StatelessWidget {
  const ZMJButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: const Text("按钮"),
      onPressed: () {
        //   2、发出事件
        bus.emit("login", {"name": "zhangmj", "age": 18});
      },
    );
  }
}

class ZMJText extends StatefulWidget {
  const ZMJText({
    super.key,
  });
  @override
  State<ZMJText> createState() => _ZMJTextState();
}

class _ZMJTextState extends State<ZMJText> {
  String _message = "Hello World";

  @override
  void initState() {
    super.initState();
    bus.on("login", (arg) {
      setState(() {
        _message = arg["name"];
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text(_message, style: const TextStyle(fontSize: 20));
  }
}

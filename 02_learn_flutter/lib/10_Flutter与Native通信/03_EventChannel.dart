import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class EventChannelPage extends StatefulWidget {
  const EventChannelPage({super.key});
  @override
  State<EventChannelPage> createState() => _EventChannelPageState();
}

class _EventChannelPageState extends State<EventChannelPage> {
  final eventChannel = const EventChannel('com.example.learnFlutter');
  var _data = "";

  @override
  void initState() {
    super.initState();
    eventChannel.receiveBroadcastStream().listen(_onData);
  }

  _onData(event) {
    if (mounted) {
      setState(() {
        final Map args = event as Map;
        _data = "${args['count']}";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Center(child: Text('倒计时：$_data')));
  }
}

import 'package:flutter/material.dart';


class ZMJHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ZMJContentBody();

  }
}

class ZMJContentBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Hello World",
        textDirection: TextDirection.ltr,
        style: TextStyle(
            color: Colors.orange,
            fontSize: 30
        ),
      ),
    );
  }
}



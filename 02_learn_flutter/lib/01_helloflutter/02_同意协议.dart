import 'package:flutter/material.dart';


class ZMJHomePage extends StatefulWidget {
  const ZMJHomePage({
    Key? key,
  }) : super(key: key);
  @override
  State<ZMJHomePage> createState() => _ZMJHomePageState();
}

class _ZMJHomePageState extends State<ZMJHomePage> {
  var flag = true;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Checkbox(value: flag, onChanged: (value) {
            setState(() {
              flag = value!;
            });
          }),
          Text("同意协议", style: TextStyle(fontSize: 20),)
        ],
      ),
    );
  }
}



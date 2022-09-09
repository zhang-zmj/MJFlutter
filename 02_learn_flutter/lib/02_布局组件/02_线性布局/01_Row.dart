import 'package:flutter/material.dart';


class RowWidget extends StatefulWidget {
  const RowWidget({Key? key}) : super(key: key);

  @override
  State<RowWidget> createState() => _RowWidgetState();
}

class _RowWidgetState extends State<RowWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello world"),
              Text("I am Jack")
            ],
          ),

          Row(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("hello world"),
              Text("I am Jack")
            ],
          ),

         Row(
          mainAxisAlignment: MainAxisAlignment.end,
          textDirection: TextDirection.rtl,
          children: [
            Text("hello world"),
            Text("I am Jack")
          ],
        ),

        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          verticalDirection: VerticalDirection.up,
          children: [
            Text("hello world", style: TextStyle(fontSize: 30)),
            Text("I am Jack")
          ],
        ),



      ],
    );
  }
}


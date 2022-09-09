import 'package:flutter/material.dart';

class FixedHeaderWidget extends StatefulWidget {
  const FixedHeaderWidget({Key? key}) : super(key: key);
  @override
  State<FixedHeaderWidget> createState() => _FixedHeaderWidgetState();
}

class _FixedHeaderWidgetState extends State<FixedHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(title: Text("商品列表")),
        Expanded(
          child: ListView.builder(itemBuilder: (BuildContext  context, int index) {
              return ListTile(title: Text("$index"));
          }),
        )
      ],
    );
  }
}


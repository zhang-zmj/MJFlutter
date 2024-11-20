import 'package:flutter/material.dart';

class MJFixedHeaderWidget extends StatefulWidget {
  const MJFixedHeaderWidget({super.key});

  @override
  State<MJFixedHeaderWidget> createState() => _MJFixedHeaderWidgetState();
}

class _MJFixedHeaderWidgetState extends State<MJFixedHeaderWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ListTile(title: Text("商品列表")),
        Expanded(
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Scrollbar(child: ListTile(title: Text("商品$index")));
            },
          ),
        )
      ],
    );
  }
}

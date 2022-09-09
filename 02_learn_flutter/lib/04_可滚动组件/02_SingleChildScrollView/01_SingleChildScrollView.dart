import 'package:flutter/material.dart';

class SingleChildScrollViewWidget extends StatefulWidget {
  const SingleChildScrollViewWidget({Key? key}) : super(key: key);

  @override
  State<SingleChildScrollViewWidget> createState() => _SingleChildScrollViewWidgetState();
}

class _SingleChildScrollViewWidgetState extends State<SingleChildScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUV";
    return Scrollbar(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(16),
          child: Center(
            child: Column(
              // 动态创建一个List<Widget>
              children: str.split("")
                // 每一个字母都用一个Text显示，字体为原来的两倍
                .map((e) => Text(e, textScaleFactor: 2)).toList(),
            ),
          ),
        )
    );
  }
}













import 'package:flutter/material.dart';

class MJSingleChildScrollViewWidget extends StatefulWidget {
  const MJSingleChildScrollViewWidget({super.key});

  @override
  State<MJSingleChildScrollViewWidget> createState() => _MJSingleChildScrollViewWidgetState();
}

class _MJSingleChildScrollViewWidgetState extends State<MJSingleChildScrollViewWidget> {
  @override
  Widget build(BuildContext context) {
    String str = "ABCDEFGHIJKLMNOPQRSTUVHHHOOOBBBBCCCCKKKHHHHFFFFFF";
    return Scrollbar(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Center(
          child: Column(
            // 动态创建一个List<Widget>
            children: str
                .split("")
                .map((e) => Text(
                      "Hello World! $e",
                      textScaler: const TextScaler.linear(2),
                    ))
                .toList(),
          ),
        ),
      ),
    );
  }
}


/*

return Scrollbar(
        child: SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Center(
        child: Column(
          // 动态创建一个List<Widget>
          children: str
              .split("")
              .map((e) => Text(
                    "Hello World! $e",
                    textScaler: const TextScaler.linear(2),
                  ))
              .toList(),
        ),
      ),
    ));

*/ 
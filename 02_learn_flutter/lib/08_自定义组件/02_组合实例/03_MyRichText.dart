import 'package:flutter/material.dart';

class MyRichText extends StatefulWidget {
  const MyRichText({
    Key? key,
    this.text,
    this.linkStyle
  }) : super(key: key);

  final String? text;
  final TextStyle? linkStyle;

  @override
  State<MyRichText> createState() => _MyRichTextState();
}

class _MyRichTextState extends State<MyRichText> {

  late TextSpan _textSpan;

  @override
  Widget build(BuildContext context) {
    return RichText(
        text: _textSpan
    );
  }

  TextSpan parsedText(String? text) {
    // 耗时操作：解析文本字符串，构建出TextSpan。
    // 省略具体实现。

    return TextSpan();

  }

  @override
  void initState() {
    _textSpan = parsedText(widget.text);
    super.initState();
  }

  @override
  void didUpdateWidget(MyRichText oldWidget) {
    if (widget.text != oldWidget.text) {
      _textSpan = parsedText(widget.text);
    }
    super.didUpdateWidget(oldWidget);
  }



}

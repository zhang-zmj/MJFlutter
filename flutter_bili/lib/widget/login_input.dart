import 'package:flutter/material.dart';
import '../utils/color.dart';

// 登录输入框，自定义widget
class LoginInput extends StatefulWidget {
  final String? title;
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;
  final bool? lineStretch;
  final bool? obscureText;
  final TextInputType? keboardType;

  const LoginInput(this.title, this.hint,
      {Key? key,
      this.onChanged,
      this.focusChanged,
      this.lineStretch = false,
      this.obscureText = false,
      this.keboardType})
      : super(key: key);

  @override
  State<LoginInput> createState() => _LoginInputState();
}

class _LoginInputState extends State<LoginInput> {
  final _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // 是否获取光标监听
    _focusNode.addListener(() {
      print("Has focus：${_focusNode.hasFocus}");
      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title ?? "",
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _input()
          ],
        ),
        Padding(padding: EdgeInsets.only(left: !(widget.lineStretch ?? false) ? 15 : 0),
          child: const Divider(thickness: 0.5, height: 1),
        )
      ],
    );
  }

  _input() {
    return Expanded(
        child: TextField(
      focusNode: _focusNode,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText ?? false,
      keyboardType: widget.keboardType,
      autofocus: !(widget.obscureText ?? false),
      cursorColor: primary,
      style: const TextStyle(
          fontSize: 16, color: Colors.black, fontWeight: FontWeight.w300),
      // 输入框样式
      decoration: InputDecoration(
          contentPadding: const EdgeInsets.only(left: 20, right: 20),
          border: InputBorder.none,
          hintText: widget.hint ?? "",
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey)),
    ));
  }
}

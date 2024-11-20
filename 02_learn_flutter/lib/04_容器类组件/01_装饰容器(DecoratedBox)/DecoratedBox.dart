import 'package:flutter/material.dart';

class MJDecorateBoxWidget extends StatefulWidget {
  const MJDecorateBoxWidget({super.key});
  @override
  State<MJDecorateBoxWidget> createState() => _MJDecorateBoxWidgetState();
}

class _MJDecorateBoxWidgetState extends State<MJDecorateBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 300,
      height: 300,
      child: DecoratedBox(
        decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Colors.red, Colors.orange]),
            borderRadius: BorderRadius.circular(3),
            boxShadow: const [BoxShadow(color: Colors.black54, offset: Offset(2.0, 2.0), blurRadius: 4.0)]),
        child: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 18),
          child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
      ),
    );
  }
}

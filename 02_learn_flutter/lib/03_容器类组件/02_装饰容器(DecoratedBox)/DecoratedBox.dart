import 'package:flutter/material.dart';


class DecoratedBoxWidget extends StatefulWidget {
  const DecoratedBoxWidget({Key? key}) : super(key: key);

  @override
  State<DecoratedBoxWidget> createState() => _DecoratedBoxWidgetState();
}

class _DecoratedBoxWidgetState extends State<DecoratedBoxWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: DecoratedBox(
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [Colors.red,Colors.orange.shade700]),
          borderRadius: BorderRadius.circular(3),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              offset: Offset(2.0, 2.0),
              blurRadius: 4.0
            )
          ]
        ),
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 80,vertical: 18),
            child: Text("Login", style: TextStyle(color: Colors.white)),
        ),
        
      )
    );
  }
}

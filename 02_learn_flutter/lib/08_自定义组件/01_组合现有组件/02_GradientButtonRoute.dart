import 'package:flutter/material.dart';
import '01_GradientButton.dart';

class GradientButtonRoute extends StatefulWidget {
  const GradientButtonRoute({Key? key}) : super(key: key);
  @override
  State<GradientButtonRoute> createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
       GradientButton(
         colors: [Colors.orange, Colors.red],
         height: 50,
         child: Text("Submit"),
         onPressed: onTap,
       ),
        GradientButton(
          colors: [Colors.lightGreen, Colors.green.shade700],
          height: 50,
          child: Text("Submit"),
          onPressed: onTap,
        ),
        GradientButton(
          borderRadius: const BorderRadius.all(Radius.circular(5)),
          colors: [Colors.lightBlue.shade300, Colors.blueAccent],
          height: 50,
          child: Text("Submit"),
          onPressed: onTap,
        )
      ]
    );
  }
  
  onTap() {
    print("button click");
  }
  
}




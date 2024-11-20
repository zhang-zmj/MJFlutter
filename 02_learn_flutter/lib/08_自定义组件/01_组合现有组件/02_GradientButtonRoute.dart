import 'package:flutter/material.dart';
import '01_GradientButton.dart';

class GradientButtonRoute extends StatefulWidget {
  const GradientButtonRoute({super.key});
  @override
  State<GradientButtonRoute> createState() => _GradientButtonRouteState();
}

class _GradientButtonRouteState extends State<GradientButtonRoute> {
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      GradientButton(
        colors: const [Colors.orange, Colors.red],
        height: 50,
        onPressed: onTap,
        child: const Text("Submit"),
      ),
      GradientButton(
        colors: [Colors.lightGreen, Colors.green.shade700],
        height: 50,
        onPressed: onTap,
        child: const Text("Submit"),
      ),
      GradientButton(
        borderRadius: const BorderRadius.all(Radius.circular(5)),
        colors: [Colors.lightBlue.shade300, Colors.blueAccent],
        height: 50,
        onPressed: onTap,
        child: const Text("Submit"),
      )
    ]);
  }

  onTap() {
    debugPrint("button click");
  }
}

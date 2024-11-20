import 'package:flutter/material.dart';

class MJBaseAnimationWidget extends StatefulWidget {
  const MJBaseAnimationWidget({super.key});

  @override
  State<MJBaseAnimationWidget> createState() => _MJBaseAnimationWidgetState();
}

class _MJBaseAnimationWidgetState extends State<MJBaseAnimationWidget> {
  double opacity = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        TextButton(
            onPressed: () {
              setState(() {
                opacity = 1;
              });
            },
            child: const Text(
              'Show Details',
              style: TextStyle(color: Colors.blueAccent),
            )),
        AnimatedOpacity(
          opacity: opacity,
          duration: const Duration(seconds: 2),
          child: const Column(
            children: [
              Text(
                'Type: Owl',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Age: 39',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              Text(
                'Employment: None',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ],
          ),
        )
      ],
    );
  }
}

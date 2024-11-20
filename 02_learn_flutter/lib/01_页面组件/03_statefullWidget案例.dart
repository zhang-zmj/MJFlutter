import 'package:flutter/material.dart';

class MJStateFullWidget extends StatefulWidget {
  final String message;
  const MJStateFullWidget(this.message, {super.key});

  @override
  State<MJStateFullWidget> createState() => _MJStateFullWidgetState();
}

class _MJStateFullWidgetState extends State<MJStateFullWidget> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter++;
                });
              },
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
              child: const Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  counter--;
                });
              },
              style: const ButtonStyle(backgroundColor: WidgetStatePropertyAll(Colors.red)),
              child: const Text("+", style: TextStyle(fontSize: 20, color: Colors.white)),
            ),
          ],
        ),
        const SizedBox(height: 10),
        Text("当前计数：$counter", style: const TextStyle(fontSize: 20)),
        const SizedBox(height: 10),
        Text("传递的信息，${widget.message}", style: const TextStyle(fontSize: 20))
      ],
    );
  }
}

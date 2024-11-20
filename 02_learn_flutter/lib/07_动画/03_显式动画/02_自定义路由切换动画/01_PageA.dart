import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '02_PageB.dart';
import '03_FadeRoute.dart';

class PageA extends StatefulWidget {
  const PageA({super.key});

  @override
  State<PageA> createState() => _PageAState();
}

class _PageAState extends State<PageA> {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
            child: const Text("跳转详情"),
            onPressed: () {
              // Navigator.push(
              //     context,
              // CupertinoPageRoute(
              //   builder: (context) => const PageB(),
              // ));

              Navigator.push(context, FadeRoute(builder: (context) {
                return const PageB();
              }));
            }));
  }
}

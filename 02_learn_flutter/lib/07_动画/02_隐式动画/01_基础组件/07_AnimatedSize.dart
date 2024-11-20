// 通过修改Widget的size属性实现动画效果

import 'package:flutter/material.dart';

class MJAnimatedSizePage extends StatefulWidget {
  const MJAnimatedSizePage({super.key});

  @override
  State<MJAnimatedSizePage> createState() => _MJAnimatedSizePageState();
}

class _MJAnimatedSizePageState extends State<MJAnimatedSizePage> {
  bool _isLarge = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('AnimatedSize Demo'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            AnimatedSize(
              duration: const Duration(seconds: 1),
              child: Container(
                width: _isLarge ? 200.0 : 100.0,
                height: _isLarge ? 200.0 : 100.0,
                color: Colors.blue,
                child: const Center(
                  child: Text(
                    'Tap me!',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isLarge = !_isLarge;
                });
              },
              child: const Text('Toggle Size'),
            ),
          ],
        ),
      ),
    );
  }
}

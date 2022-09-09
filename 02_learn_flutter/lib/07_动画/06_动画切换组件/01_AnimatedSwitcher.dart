import 'package:flutter/material.dart';

class AnimatedSwitcherCounterWidget extends StatefulWidget {
  const AnimatedSwitcherCounterWidget({Key? key}) : super(key: key);
  @override
  State<AnimatedSwitcherCounterWidget> createState() => _AnimatedSwitcherCounterWidgetState();
}

class _AnimatedSwitcherCounterWidgetState extends State<AnimatedSwitcherCounterWidget> {

  int _count = 0;
  
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedSwitcher(duration: Duration(milliseconds: 500),
            transitionBuilder: (Widget child, Animation<double> animation){
              //执行缩放动画
              return ScaleTransition(scale: animation, child: child);
            },
            child: Text(
              '$_count',
              //显示指定key，不同的key会被认为是不同的Text，这样才能执行动画
              key: ValueKey<int>(_count),
              style: Theme.of(context).textTheme.headline4,
            ),
          ),
          ElevatedButton(
              onPressed: (){
                setState(() {
                  _count += 1;
                });
              },
              child: const Text('+1')
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import '04_SlideTransitionX.dart';

class SwitcherWidget extends StatefulWidget {
  const SwitcherWidget({Key? key}) : super(key: key);
  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 200),
            transitionBuilder: (Widget child, Animation<double> animation){
              var tween = Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return SlideTransitionX(
                  direction: AxisDirection.down,
                  position: animation, //上入下出
                  child: child
              );
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









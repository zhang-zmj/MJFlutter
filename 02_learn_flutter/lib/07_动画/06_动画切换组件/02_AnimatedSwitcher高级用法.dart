import 'package:flutter/material.dart';

class AnimatedSwitcherWidget extends StatefulWidget {
  const AnimatedSwitcherWidget({Key? key}) : super(key: key);
  @override
  State<AnimatedSwitcherWidget> createState() => _AnimatedSwitcherWidgetState();
}

class _AnimatedSwitcherWidgetState extends State<AnimatedSwitcherWidget> {

  int _count = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          AnimatedSwitcher(
            duration: Duration(milliseconds: 100),
            transitionBuilder: (Widget child, Animation<double> animation){

              // 1. 页面显示在屏幕时，Offset的dx dy均为0；
              // 2. 如果需要动画页面从屏幕底部弹出，则应该是dy=1 到 dy=0；
              // 3. 如果需要动画页面从右侧推入到屏幕，则应该是dx=1 到 dx=0；
              // 4. 如果需要动画页面从屏幕顶部弹出，则应该是dy=0 到 dy=-1

              var tween=Tween<Offset>(begin: Offset(1, 0), end: Offset(0, 0));
              return MySlideTransition(
                child: child,
                position: tween.animate(animation),
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













class MySlideTransition extends AnimatedWidget {

 const MySlideTransition({
   Key? key,
   required Animation<Offset> position,
   this.transformHitTests = true,
   required this.child}) : super(key: key, listenable: position);

  final bool transformHitTests;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final position = listenable as Animation<Offset>;
    Offset offset = position.value;

    print("-----${position.status}------");

    if (position.status == AnimationStatus.reverse) {
      offset = Offset(-offset.dx, offset.dy);
    }

    return FractionalTranslation(
            translation: offset,
            transformHitTests: transformHitTests,
            child: child
    );

  }

}


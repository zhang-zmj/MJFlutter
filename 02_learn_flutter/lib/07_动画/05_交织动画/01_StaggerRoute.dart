import 'package:flutter/material.dart';
import '02_StaggerAnimation.dart';

/*
交织动画：
   由一个动画序列或重叠的动画组成
*/

class StaggerRoute extends StatefulWidget {
  const StaggerRoute({Key? key}) : super(key: key);

  @override
  State<StaggerRoute> createState() => _StaggerRouteState();
}

class _StaggerRouteState extends State<StaggerRoute>  with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =  AnimationController(vsync: this,
      duration: Duration(milliseconds: 2000)
    );
  }

  _playAnimation() async {
    try{
      //先正向执行动画
      await _controller.forward().orCancel;
      //再反向执行动画
      await _controller.reverse().orCancel;
    } on TickerCanceled {
      // the animation got canceled, probably because we were disposed
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(onPressed: _playAnimation, child: Text("start animation")),
          Container(
            width: 300,
            height: 300,
            decoration: BoxDecoration(
              color: Colors.black.withOpacity(0.1),
              border: Border.all(
                color: Colors.black.withOpacity(0.5)
              )
            ),
            //调用我们定义的交错动画Widget
            child: StaggerAnimation(controller: _controller) ,
          )
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';

/*
* 精确进度通常用于任务进度可以计算和预估的情况，比如文件下载；
* 模糊进度则用户任务进度无法准确获得的情况，如下拉刷新，数据提交等

LinearProgressIndicator：是一个线性、条状的进度条
CircularProgressIndicator：是一个圆形进度条
SingleTickerProviderStateMixin：
  当创建一个 AnimationController 时，需要传递一个vsync参数，
  存在vsync时会防止动画的UI不在当前屏幕时消耗不必要的资源。
  通过混入 SingleTickerProviderStateMixin
*/

class MJIndicatorWidget extends StatefulWidget {
  const MJIndicatorWidget({super.key});
  @override
  State<MJIndicatorWidget> createState() => _MJIndicatorWidgetState();
}

class _MJIndicatorWidgetState extends State<MJIndicatorWidget> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;

  @override
  void initState() {
    // 动画执行时间3秒
    _animationController = AnimationController(value: 0.5, vsync: this, duration: const Duration(seconds: 10));
    // 动画执行完毕后，回到初始状态
    _animationController?.forward();
    _animationController?.addListener(() => setState(() {
          debugPrint("${_animationController?.value}");
        }));
    super.initState();
  }

  @override
  void dispose() {
    _animationController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 30),
        child: Column(
          children: [
            // 1、线性进度条高度指定为3
            SizedBox(
              height: 3,
              child: LinearProgressIndicator(
                backgroundColor: Colors.grey[100],
                valueColor: ColorTween(
                  begin: Colors.red,
                  end: Colors.blue,
                ).animate(_animationController!),
                value: _animationController?.value,
              ),
            ),

            //2、圆形进度条直径指定为100
            const SizedBox(
              height: 100,
              width: 100,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey,
                valueColor: AlwaysStoppedAnimation(Colors.blue),
                value: 0.5,
              ),
            ),
            const SizedBox(height: 30),

            //3、宽高不等
            SizedBox(
              height: 100,
              width: 130,
              child: CircularProgressIndicator(
                backgroundColor: Colors.grey[100],
                valueColor: const AlwaysStoppedAnimation(Colors.blue),
                value: .7,
              ),
            )
          ],
        ));
  }

  //1、基础指示器的使用
  Widget _linearIndicatorWidget() {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: LinearProgressIndicator(
          backgroundColor: Colors.grey[100],
          //  ColorTween 来实现颜色过渡动画效果
          valueColor: ColorTween(
            begin: Colors.red,
            end: Colors.blue,
          ).animate(_animationController!),
          value: _animationController?.value,
        ),
      ),
    ]);
  }

  // 2、基础指示器的使用
  Widget _baseIndicatorWidget() {
    return Column(
      children: [
        //1、模糊进度条（会执行一个动画）
        LinearProgressIndicator(
          backgroundColor: Colors.grey[100],
          valueColor: const AlwaysStoppedAnimation(Colors.blue), // 表示一种始终停留在已知值上的动画,状态一直持续下去
        ),
        const SizedBox(height: 25),
        //2、进度条显示50%
        LinearProgressIndicator(
          backgroundColor: Colors.grey[100],
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          value: 0.5,
        ),
        const SizedBox(height: 25),
        //3、圆形进度条
        CircularProgressIndicator(
          backgroundColor: Colors.grey[100],
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
        ),
        const SizedBox(height: 25),
        //4、进度条显示50%，会显示一个半圆
        CircularProgressIndicator(
          backgroundColor: Colors.grey[100],
          valueColor: const AlwaysStoppedAnimation(Colors.blue),
          value: 0.5,
        ),
      ],
    );
  }
}

import 'package:flutter/material.dart';
import '01_RenderDoneObject.dart';

class DoneWidget extends LeafRenderObjectWidget {

  const DoneWidget({
      super.key,
      this.strokeWidth = 2.0,
      this.color = Colors.green,
      this.outline = false
   });

  //线条宽度
   final double strokeWidth;

  //轮廓颜色或填充色
   final Color color;

  //如果为true，则没有填充色，color代表轮廓的颜色；如果为false，则color为填充色
   final bool outline;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderDoneObject(
        strokeWidth,
        color,
        outline
    )..animationStatus = AnimationStatus.forward; // 创建时执行正向动画
  }

  @override
  void updateRenderObject(context,  RenderDoneObject renderObject) {
    renderObject
        ..strokeWidth = strokeWidth
        ..outline = outline
        ..color = color;
  }

}


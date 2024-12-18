import 'package:flutter/material.dart';
import 'package:learn_flutter/08_%E8%87%AA%E5%AE%9A%E4%B9%89%E7%BB%84%E4%BB%B6/05_%E8%87%AA%E7%BB%98%E7%BB%84%E4%BB%B6%EF%BC%9ACustomCheckbox/02_RenderObjectAnimationMixin.dart';


class RenderDoneObject extends RenderBox with RenderObjectAnimationMixin {
  double strokeWidth;
  Color color;
  bool outline;

  ValueChanged<bool>? onChanged;

  RenderDoneObject(
    this.strokeWidth,
    this.color,
    this.outline
  );

  // 动画执行时间为 300ms
  @override
  Duration get duration => const Duration(milliseconds: 300);

  @override
  void doPaint(PaintingContext context, Offset offset) {
    //可以对动画运用曲线
    Curve curve = Curves.easeIn;
    final _progress = curve.transform(progress);

    Rect rect = offset & size;
    final paint = Paint()
      ..isAntiAlias = true
      ..style = outline ? PaintingStyle.stroke : PaintingStyle.fill //填充
      ..color = color;
      
    if (outline) {
      paint.strokeWidth = strokeWidth;
      rect = rect.deflate(strokeWidth / 2);
    }
    
    //画背景圆
    context.canvas.drawCircle(rect.center, rect.shortestSide / 2, paint);
    
    paint
      ..style = PaintingStyle.stroke
      ..color = outline ? color : Colors.white
      ..strokeWidth = strokeWidth;
    
    final path = Path();
    
    Offset firstOffset = Offset(rect.left + rect.width / 6, rect.top + rect.height / 2.1);
    final secondOffset = Offset(
        rect.left + rect.width / 2.5,
        rect.bottom - rect.height / 3.3
    );

    path.moveTo(firstOffset.dx, firstOffset.dy);

    const adjustProgress = .6;
    //画 "勾"
    if (_progress < adjustProgress) {
      //第一个点到第二个点的连线做动画(第二个点不停的变)
      Offset _secondOffset = Offset.lerp(
          firstOffset,
          secondOffset,
          _progress / adjustProgress
      )!;

      path.lineTo(_secondOffset.dx, _secondOffset.dy);

    }else{
      //链接第一个点和第二个点
      path.lineTo(secondOffset.dx, secondOffset.dy);
      //第三个点位置随着动画变，做动画
      final lastOffset = Offset(
          rect.right - rect.width / 5,
          rect.top + rect.height / 3.5
      );

      final lastOffset0 = Offset.lerp(
          secondOffset,
          lastOffset,
          (progress - adjustProgress) / (1 - adjustProgress)
      )!;

      path.lineTo(lastOffset0.dx, lastOffset0.dy);

    }

    context.canvas.drawPath(path, paint..style = PaintingStyle.stroke);

  }

  @override
  void performLayout() {
    // 如果父组件指定了固定宽高，则使用父组件指定的，否则宽高默认置为 25
    size = constraints.constrain(
      constraints.isTight ? Size.infinite : Size(25, 25)
    );
  }

}


import 'dart:math';
import 'package:flutter/material.dart';


/*
刷新按钮的画布和CustomPaint的画布是同一个，
刷新按钮点击时会执行一个水波动画，水波动画执行过程中画布会不停的刷新，
所以就导致了CustomPaint 不停的重绘

解决：
  给刷新按钮 或 CustomPaint 任意一个添加一个 RepaintBoundary 父组件即可

*/

class CustomPaintRoute extends StatelessWidget {
  const CustomPaintRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child:  Column(
          children: [
            RepaintBoundary(
              child: CustomPaint(
                size: const Size(300, 300),
                painter: MyPainter(),
              )
            ),
            //添加一个刷新button
            ElevatedButton(onPressed: () {}, child: const Text("刷新"))
          ],
        )
      ,
    );
  }
}


class MyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    debugPrint('paint');
    var rect = Offset.zero & size;
    //画棋盘
    drawChessboard(canvas, rect);
    //画棋子
    drawPieces(canvas, rect);
  }

  // 返回false, 后面介绍
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }

  void drawChessboard(Canvas canvas, Rect rect) {
    
    //棋盘背景
    var paint = Paint()
        ..isAntiAlias = true
        ..style = PaintingStyle.fill //填充
        ..color = const Color(0xFFDCC48C);
    canvas.drawRect(rect, paint);

    //画棋盘网格
    paint
      ..style = PaintingStyle.stroke //线
      ..color = Colors.black38
      ..strokeWidth = 1.0;
    
    //画横线
    for (int i = 0; i <= 15; ++i) {
      double dy = rect.top + rect.height / 15 * i;
      canvas.drawLine(Offset(rect.left, dy), Offset(rect.right, dy), paint);
    }

    //画竖线
    for (int i = 0; i <= 15; ++i) {
      double dx = rect.left + rect.width / 15 * i;
      canvas.drawLine(Offset(dx, rect.top), Offset(dx, rect.bottom), paint);
    }

  }

  //画棋子
  void drawPieces(Canvas canvas, Rect rect ){

    double eWidth = rect.width / 15;
    double eHeight = rect.height / 15;

    //画笔
    var paint = Paint()
      ..style = PaintingStyle.fill
      ..color = Colors.black;

    //画一个黑子
    canvas.drawCircle(
        Offset(rect.center.dx - eWidth / 2, rect.center.dy - eHeight / 2),
        min(eWidth / 2, eHeight / 2) - 2,
        paint
    );

    //画一个白子
    paint.color = Colors.white;
    canvas.drawCircle(
      Offset(rect.center.dx + eWidth / 2, rect.center.dy - eHeight / 2),
      min(eWidth / 2, eHeight / 2) - 2,
      paint,
    );

  }

}




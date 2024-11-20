import 'package:flutter/material.dart';
import '01_水印画笔.dart';
import 'dart:ui' as ui;

class WaterMark extends StatefulWidget {
  const WaterMark({super.key, this.repeat = ImageRepeat.repeat, required this.painter});

  //单元水印画笔
  final WaterMarkPainter painter;

  //单元水印的重复方式
  final ImageRepeat repeat;

  @override
  State<WaterMark> createState() => _WaterMarkState();
}

class _WaterMarkState extends State<WaterMark> {
  late Future<MemoryImage> _memoryImageFuture;

  @override
  void initState() {
    // 缓存的是promise
    _memoryImageFuture = _getWaterMarkImage();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // 水印尽可能大
      child: FutureBuilder(
        future: _memoryImageFuture,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState != ConnectionState.done) {
            // 如果单元水印还没有绘制好先返回一个空的Container
            return Container();
          } else {
            // 如果单元水印已经绘制好，则渲染水印
            return DecoratedBox(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: snapshot.data, // 背景图，即我们绘制的单元水印图片
                  repeat: widget.repeat, // 指定重复方式
                  alignment: Alignment.topLeft,
                ),
              ),
            );
          }
        },
      ),
    );
  }

  @override
  void didUpdateWidget(WaterMark oldWidget) {
    // 如果画笔发生了变化（类型或者配置）则重新绘制水印
    if (widget.painter.runtimeType != oldWidget.painter.runtimeType ||
        widget.painter.shouldRepaint(oldWidget.painter)) {
      //先释放之前的缓存
      _memoryImageFuture.then((value) => value.evict());
      //重新绘制并缓存
      _memoryImageFuture = _getWaterMarkImage();
    }
    super.didUpdateWidget(oldWidget);
  }

  // 离屏绘制单元水印并将绘制结果保存为图片缓存起来
  Future<MemoryImage> _getWaterMarkImage() async {
    // 创建一个 Canvas 进行离屏绘制，细节和原理请查看本书后面关于Flutter绘制原理相关章节
    final recorder = ui.PictureRecorder();
    final canvas = Canvas(recorder);
    // 绘制单元水印并获取其大小
    final Size size = widget.painter.paintUnit(canvas, 1);
    final picture = recorder.endRecording();
    //将单元水印导为图片并缓存起来
    final img = await picture.toImage(size.width.ceil(), size.height.ceil());
    final byteData = await img.toByteData(format: ui.ImageByteFormat.png);
    final pngBytes = byteData!.buffer.asUint8List();
    return MemoryImage(pngBytes);
  }

  @override
  void dispose() {
    //释放图片缓存
    _memoryImageFuture.then((value) => value.evict());
    super.dispose();
  }
}

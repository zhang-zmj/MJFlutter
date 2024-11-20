import 'package:flutter/material.dart';

class MJAnimatedListWidget extends StatefulWidget {
  const MJAnimatedListWidget({super.key});

  @override
  State<MJAnimatedListWidget> createState() => _MJAnimatedListWidgetState();
}

class _MJAnimatedListWidgetState extends State<MJAnimatedListWidget> {
  var data = <String>[];
  int counter = 5;
  final globalKey = GlobalKey<AnimatedListState>();

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < counter; i++) {
      data.add("$i");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox(
          height: double.infinity,
          child: AnimatedList(
              key: globalKey,
              initialItemCount: data.length,
              itemBuilder: (context, index, animation) {
                //添加列表项时会执行渐显动画
                return FadeTransition(
                  opacity: animation,
                  child: buildItem(context, index),
                );
              }),
        ),
        buildAddBtn()
      ],
    );
  }

  // 创建一个 " + " 按钮，点击后会向列表中插入一项
  Widget buildAddBtn() {
    return Positioned(
      bottom: 30,
      left: 0,
      right: 0,
      child: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            // 添加一个列表项
            data.add("${++counter}");
            // 告诉列表项有新添加的列表项
            globalKey.currentState!.insertItem(data.length - 1);
            debugPrint("添加 $counter");
          }),
    );
  }

  // 构建列表项
  Widget buildItem(context, index) {
    String char = data[index];
    return ListTile(
      // 数字不会重复，所以作为key
      key: ValueKey(char),
      title: Text(char),
      trailing: IconButton(onPressed: () => onDelete(context, index), icon: const Icon(Icons.delete)),
    );
  }

  void onDelete(context, index) {
    // 待实现
    setState(() {
      globalKey.currentState!.removeItem(index, (context, animation) {
        // 删除过程执行的是反向动画，animation.value 会从1变0
        var item = buildItem(context, index);
        debugPrint('删除 ${data[index]}');
        data.removeAt(index);

        //删除动画是一个合成动画： 渐隐 + 缩小列表项告诉
        return FadeTransition(
          opacity: CurvedAnimation(
              parent: animation,
              //让透明度变化的更快一些
              curve: const Interval(0.5, 1.0)),
          // 不断缩小列表项的高度
          child: SizeTransition(
              // 控制子对象（剪裁）大小的动画
              sizeFactor: animation,
              axisAlignment: 0.0,
              child: item),
        );
      }, duration: const Duration(milliseconds: 200));
    });
  }
}

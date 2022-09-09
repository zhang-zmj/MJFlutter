import 'package:flutter/material.dart';

/*
ValueListenableBuilder：

  * InheritedWidget 提供一种在 widget 树中从上到下共享数据的方式，
    但是也有很多场景数据流向并非从上到下，比如从下到上或者横向等
  * 它的功能是监听一个数据源，如果数据源发生变化，则会重新执行其 builder

  * 尽可能让 ValueListenableBuilder 只构建依赖数据源的widget，
    这样的话可以缩小重新构建的范围，也就是说 ValueListenableBuilder
    的拆分粒度应该尽可能细
*/


class ValueListenableBuilderWidget extends StatefulWidget {
  const ValueListenableBuilderWidget({Key? key}) : super(key: key);

  @override
  State<ValueListenableBuilderWidget> createState() => _ValueListenableBuilderWidgetState();
}

class _ValueListenableBuilderWidgetState extends State<ValueListenableBuilderWidget> {
  // 定义一个ValueNotifier，当数字变化时会通知 ValueListenableBuilder
  final ValueNotifier<int> _counter = ValueNotifier<int>(0);
  static const double textScaleFactor = 1.5;

  @override
  Widget build(BuildContext context) {
    // 添加 + 按钮不会触发整个 ValueListenableRoute 组件的 build
    print('build');
    return Scaffold(
      appBar: AppBar(title: Text('ValueListenableBuilder 测试')),
      body: Center(
        child: ValueListenableBuilder<int>(
          builder: (BuildContext context, int value, Widget? child) {
            // builder 方法只会在 _counter 变化时被调用
            return Row(

              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                child!,
                Text('$value 次',textScaleFactor: textScaleFactor),
              ],
            );
          },
          valueListenable: _counter,
          // 当子组件不依赖变化的数据，且子组件收件开销比较大时，指定 child 属性来缓存子组件非常有用
          child: const Text('点击了 ', textScaleFactor: textScaleFactor),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        // 点击后值 +1，触发 ValueListenableBuilder 重新构建
        onPressed: () => _counter.value += 1,
      ),
    );
  }

}




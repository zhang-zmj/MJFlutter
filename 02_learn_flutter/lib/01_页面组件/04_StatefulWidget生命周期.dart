import 'package:flutter/material.dart';

class MJLifeStateFullWidget extends StatefulWidget {
  MJLifeStateFullWidget({super.key}) {
    debugPrint("1.调用constructor方法");
  }

  @override
  State<MJLifeStateFullWidget> createState() => _MJLifeStateFullWidgetState();
}

class _MJLifeStateFullWidgetState extends State<MJLifeStateFullWidget> {
  int count = 0;

  // 在 State 对象创建时调用，且只调用一次。用于初始化 State 的一些数据
  @override
  void initState() {
    super.initState();
    debugPrint("2.调用initState方法");
  }

  // 在 State 对象的依赖发生变化时调用。首次构建时也会调用一次
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    debugPrint("3.调用didChangeDependencies方法");
  }

/*
  构建组件树。这个方法会在 initState()、
           didChangeDependencies()、
           didUpdateWidget()后调用，且在每次调用 setState() 时调用。
*/
  @override
  Widget build(BuildContext context) {
    debugPrint("4.调用build方法");
    return const Center(
      child: Column(
        children: [Text("哈哈哈哈哈哈")],
      ),
    );
  }

// 在 StatefulWidget 重新构建时（例如父组件发生变化），但保留相同的 State 对象时调用。
  @override
  void didUpdateWidget(covariant MJLifeStateFullWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    debugPrint("5.组件更新的方法didUpdateWidget");
  }

  // 在 State 对象从树中暂时移除时调用。在 State 对象重新插入到树中时调用。
  @override
  void deactivate() {
    super.deactivate();
    debugPrint("6.调用deactivate方法");
  }

  // 在 State 对象从树中永久移除时调用。
  @override
  void dispose() {
    debugPrint("7.调用dispose方法");
    super.dispose();
  }
}

/*
1、createState()
2、initState()
3、didChangeDependencies()
4、build()
5、如果 StatefulWidget 改变：
  * didChangeDependencies()
  * didUpdateWidget()
  * build()
6、如果 StatefulWidget 被从树中暂时移除：
  deactivate()
7、如果 StatefulWidget 被永久性地从树中移除：
  dispose()
*/ 

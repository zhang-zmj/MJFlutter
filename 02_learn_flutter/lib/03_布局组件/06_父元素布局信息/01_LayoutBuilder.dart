import 'package:flutter/material.dart';

class MJLayoutBuilderWidget extends StatefulWidget {
  const MJLayoutBuilderWidget({super.key});

  @override
  State<MJLayoutBuilderWidget> createState() => _MJLayoutBuilderWidgetState();
}

class _MJLayoutBuilderWidgetState extends State<MJLayoutBuilderWidget> {
  @override
  Widget build(BuildContext context) {
    var children = List.filled(
        6,
        const Padding(
          padding: EdgeInsets.only(top: 10, right: 10),
          child: Text(
            "A",
            style: TextStyle(backgroundColor: Colors.red),
          ),
        ));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(width: 190, child: ResponsiveColumn(children: children)),
        ResponsiveColumn(children: children),
        const LayoutLogPrint(child: Text("xx"))
      ],
    );
  }
}

class ResponsiveColumn extends StatelessWidget {
  final List<Widget>? children;
  const ResponsiveColumn({super.key, this.children});

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(builder: (BuildContext context, BoxConstraints constraints) {
      var tempChildren = children ?? [];
      if (constraints.maxWidth < 200) {
        return Column(mainAxisSize: MainAxisSize.min, children: tempChildren);
      } else {
        // 大于200，显示双列
        var children = <Widget>[];
        for (var i = 0; i < tempChildren.length; i += 2) {
          if (i + 1 < tempChildren.length) {
            children.add(Row(children: [tempChildren[i], tempChildren[i + 1]]));
          } else {
            children.add(Row(children: [tempChildren[i]]));
          }
        }
        return Column(mainAxisSize: MainAxisSize.min, children: children);
      }
    });
  }
}

// 为了便于排错，我们封装一个能打印父组件传递给子组件约束的组件
class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    super.key,
    this.tag,
    required this.child,
  });

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        debugPrint('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}

/*
LayoutBuilder：
    可以在布局过程中拿到父组件传递的约束信息，
    然后我们可以根据约束信息动态的构建不同的布局
使用场景：
  1、可以使用 LayoutBuilder 来根据设备的尺寸来实现响应式布局。
  2、LayoutBuilder 可以帮我们高效排查问题。比如我们在遇到布局
    问题或者想调试组件树中某一个节点布局的约束时 LayoutBuilder 就很有用
*/


import 'package:flutter/material.dart';

/*
LayoutBuilder：
    可以在布局过程中拿到父组件传递的约束信息，
    然后我们可以根据约束信息动态的构建不同的布局

使用场景：
  1、可以使用 LayoutBuilder 来根据设备的尺寸来实现响应式布局。
  2、LayoutBuilder 可以帮我们高效排查问题。比如我们在遇到布局
    问题或者想调试组件树中某一个节点布局的约束时 LayoutBuilder 就很有用
*/


// 实现功能是当当前可用的宽度小于 200 时，将子组件显示为一列，否则显示为两列
class LayoutBuilderWidget extends StatelessWidget {
  const LayoutBuilderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _children = List.filled(6, Text("A"));
    // Column在本示例中在水平方向的最大宽度为屏幕的宽度
    return Column(
      children: [
        // 限制宽度为190，小于 200
        SizedBox(width: 190, child: ResponsiveColumn(children: _children),),
        ResponsiveColumn(children: _children),
        LayoutLogPrint(child:Text("xx"))
      ],
    );
  }
}




class ResponsiveColumn extends StatelessWidget {
  const ResponsiveColumn({Key? key, required this.children}) : super(key: key);
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    // 通过 LayoutBuilder 拿到父组件传递的约束，然后判断 maxWidth 是否小于200
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints  constraints){
            if (constraints.maxWidth < 200) {
              // 最大宽度小于200，显示单列
              return Column(children: children, mainAxisSize: MainAxisSize.min);
            }else{
              // 大于200，显示双列
              var _children = <Widget>[];
              for (var i = 0; i < children.length; i += 2) {
                if (i + 1 < children.length){
                    _children.add(Row(
                      children: [children[i], children[i + 1]],
                      mainAxisSize: MainAxisSize.min,
                    ));
                }else{
                  _children.add(children[i]);
                }
              }
              return Column(children: _children, mainAxisSize: MainAxisSize.min);
            }
        }
    );
  }
}



// 为了便于排错，我们封装一个能打印父组件传递给子组件约束的组件
class LayoutLogPrint<T> extends StatelessWidget {
  const LayoutLogPrint({
    Key? key,
    this.tag,
    required this.child,
  }) : super(key: key);

  final Widget child;
  final T? tag; //指定日志tag

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (_, constraints) {
      // assert在编译release版本时会被去除
      assert(() {
        print('${tag ?? key ?? child}: $constraints');
        return true;
      }());
      return child;
    });
  }
}












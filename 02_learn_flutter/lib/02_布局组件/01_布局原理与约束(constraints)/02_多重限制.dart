import 'package:flutter/material.dart';

/*
如果某一个组件有多个父级ConstrainedBox限制，那么最终会是哪个生效？
   * 对于minWidth和minHeight来说，是取父子中相应数值较大的。
   * 实际上，只有这样才能保证父限制与子限制不冲突
*/

class MoreWidget extends StatefulWidget {
  const MoreWidget({Key? key}) : super(key: key);
  @override
  State<MoreWidget> createState() => _MoreWidgetState();
}

class _MoreWidgetState extends State<MoreWidget> {
  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: BoxConstraints( //父
          minWidth: 60,
          minHeight: 60
        ),
        child: ConstrainedBox(
            constraints: BoxConstraints(
              minWidth: 90,
              minHeight: 20
            ),
          child: Container(
            width: 20,
            height: 20,
            color: Colors.red,
          ),
        ),
    );
  }
}


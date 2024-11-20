import 'package:flutter/material.dart';

/*
手势冲突只是手势级别的，也就是说只会在组件树中的多个 GestureDetector 之间才有冲突的场景，
  如果压根就没有使用 GestureDetector 则不存在所谓的冲突，因为每一个节点都能收到事件

解决手势冲突的方法有两种：
  1、使用 Listener。这相当于跳出了手势识别那套规则。
        通过 Listener 解决手势冲突的原因是竞争只是针对手势的，
        而 Listener 是监听原始指针事件，原始指针事件并非语义话的手势，
        所以根本不会走手势竞争的逻辑
  2、自定义手势手势识别器（ Recognizer）。
*/

class ListenerGesture extends StatelessWidget {
  const ListenerGesture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Listener(
        // 将 GestureDetector 换位 Listener 即可
        onPointerUp: (x) => debugPrint("2"),
        child: GestureDetector(
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => debugPrint("1111"),
              child: Container(
                width: 50,
                height: 50,
                color: Colors.grey,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

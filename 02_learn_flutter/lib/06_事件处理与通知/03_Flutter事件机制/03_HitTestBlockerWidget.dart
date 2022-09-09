import 'package:flutter/material.dart';
import '02_HitTestBlocker.dart';

class HitTestBlockerWidget extends StatelessWidget {
  const HitTestBlockerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // IgnorePointer(child: wChild(1, 200)),
        // IgnorePointer(child: wChild(2, 200)),

        HitTestBlocker(child: wChild(1, 200)),
        HitTestBlocker(child: wChild(2, 200))
      ]
    );
  }

/*

 Widget wChild(int index, double size){
    return Listener(
      onPointerDown: (e) => print(index),
      child: Container(
        width: size,
        height: size,
        color: Colors.grey,
      ),
    );
  }

*/

  Widget wChild(int index, double size){
    return GestureDetector(
        onTap: () => print('$index'),
        child: Container(
          width: size,
          height: size,
          color: Colors.grey,
        ),
    );
  }

}

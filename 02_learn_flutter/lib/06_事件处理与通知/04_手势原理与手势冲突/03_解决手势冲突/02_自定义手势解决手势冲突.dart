import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

/*
自定义 Recognizer 解决手势冲突原理：
  当确定手势竞争胜出者时，会调用胜出者的acceptGesture 方法，表示“宣布成功”，
  然后会调用其他手势识别其的rejectGesture 方法，表示“宣布失败”。既然如此，
  我们可以自定义手势识别器（Recognizer），然后去重写它的rejectGesture 方法：
  在里面调用acceptGesture 方法，这就相当于它失败是强制将它也变成竞争的成功者了，
  这样它的回调也就会执行
*/

// 自定义手势
class CustomTapGestureRecognizer extends TapGestureRecognizer {
  @override
  void rejectGesture(int pointer) {
    //不，我不要失败，我要成功
    //super.rejectGesture(pointer);

    //宣布成功
    super.acceptGesture(pointer);
  }
}

//创建一个新的GestureDetector，用我们自定义的 CustomTapGestureRecognizer 替换默认的
RawGestureDetector customGestureDetector({
  GestureTapCallback? onTap,
  GestureTapDownCallback? onTapDown,
  Widget? child,
}) {
  return RawGestureDetector(
    gestures: {
      CustomTapGestureRecognizer: GestureRecognizerFactoryWithHandlers<CustomTapGestureRecognizer>(
        () => CustomTapGestureRecognizer(),
        (detector) {
          detector.onTap = onTap;
        },
      )
    },
    child: child,
  );
}

//2、例子
class ListenerGesture extends StatelessWidget {
  const ListenerGesture({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: customGestureDetector(
        // onTap: () => debugPrint("1111"),
        child: GestureDetector(
          // onTap: () => print("2222"),
          child: Container(
            width: 200,
            height: 200,
            color: Colors.red,
            alignment: Alignment.center,
            child: GestureDetector(
              onTap: () => debugPrint("3333"),
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

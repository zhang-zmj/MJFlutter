import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

// 可以拦截 hitTest 各个过程的 HitTestBlocker 组件
class HitTestBlocker extends SingleChildRenderObjectWidget {
  const HitTestBlocker({super.key, this.up = true, this.down = false, this.self = false, super.child});

  // up 为 true 时 , `hitTest()` 将会一直返回 false.
  final bool up;

  // down 为 true 时, 将不会调用 `hitTestChildren()`
  final bool down;

  // `hitTestSelf` 的返回值
  final bool self;

  @override
  RenderObject createRenderObject(BuildContext context) {
    return RenderHitTestBlocker(up: up, down: down, self: self);
  }

  @override
  void updateRenderObject(BuildContext context, RenderHitTestBlocker renderObject) {
    renderObject
      ..up = up
      ..down = down
      ..self = self;
  }
}

class RenderHitTestBlocker extends RenderProxyBox {
  RenderHitTestBlocker({this.up = true, this.down = true, this.self = true});

  bool up;
  bool down;
  bool self;

  @override
  bool hitTest(BoxHitTestResult result, {required Offset position}) {
    bool hitTestDownResult = false;
    if (!down) {
      hitTestDownResult = hitTestChildren(result, position: position);
    }

    bool pass = hitTestSelf(position) || (hitTestDownResult && size.contains(position));
    if (pass) {
      result.add(BoxHitTestEntry(this, position));
    }

    return !up && pass;
  }

  @override
  bool hitTestSelf(Offset position) => self;
}

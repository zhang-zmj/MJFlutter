/*

用于在一段时间内对特定属性进行动画处理

1、基本属性：
  tween：定义动画的起始值和终止值的Tween对象。
  duration：动画的持续时间。
  builder：用于构建动画效果的回调函数。该函数在每一帧动画期间都会被调用。
  onEnd：动画结束时的回调函数。
  curve：定义动画进展的曲线。
  child：不会随着动画改变的静态子组件，优化性能。

*/ 
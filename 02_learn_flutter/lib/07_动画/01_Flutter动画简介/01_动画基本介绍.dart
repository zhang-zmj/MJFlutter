
/*
一、隐式（全自动）动画
      不用循环播放、不用随时中断、不用多个动画协同，它实现的是一种状态到另一种状态的改变。
1、基本属性：
  * Curve
      linear  线性动画
      easeln  缓慢开始加速的动画
      easeOut 快速开始减速的动画
      easelnOut 缓慢开始加速再减速的动画
      decelerate 減速的动画
      bounceln 动画反弹效果进入
      bounceOut 动画反弹效果退出
      bouncelnOut 动画反弹效果进入和退出
      elasticin 动画弹性效果进入
      elasticOut 动画弹性效果退出
      elasticinOut 动画弹性效果进入和退出
      astOutSlowIn 动画快速进入缓慢退出
      slowMiddle 动画缓慢中间
      ease 缓慢开始和结束，中间速度较快
      easelnCirc 圆形曲线缓慢开始
      easeOutCirc 圆形曲线缓慢结束
      easelnOutCirc 圆形曲线缓慢开始和结束
      easelnCubic 三次曲线缓慢开始
      easeOutCubic 三次曲线缓慢结束
      easelnOutCubic 三次曲线缓慢开始和结束
      easelnExpo 指数曲线缓慢开始
      easeOutExpo 指数曲线缓慢结束
      easelnOutExpo 指数曲线缓慢开始和结束
      easelnQuad 二次曲线缓慢开始
      easeOutQuad 二次曲线缓慢结束
      easelnOutQuad 二次曲线缓慢开始和结束
      easelnQuart 四次曲线缓慢开始
      easeOutQuart 四次曲线缓慢结束
      easelnOutQuart  四次曲线缓慢开始和结束
      easelnQuint 五次曲线缓慢开始
      easeOutQuint 五次曲线缓慢结束
      easelnOutQuint 五次曲线缓慢开始和结束
      easelnSine 正弦曲线缓慢开始
      easeOutSine 正弦曲线缓慢结束
      easelnOutSine 正弦曲线缓慢开始和结束

  * duration  动画时长。
  * onEnd 每次动画完整的时候调用这个方法。这对于触发其他动作（例如另一个动画）很有用。
2、隐式动画组件
    * AnimatedOpacity
    * AnimatedContainer
    * AnimatedPadding
    * AnimatedPositioned
    * AnimatedSwitcher
    * AnimatedAlign
    * AnimatedDefaultTextStyle
    * AnimatedSize

3、自定义隐式动画
    * TweenAnimationBuilder
    * TweenAnimationBuilder例子
        1.颜色渐变动画
        2.自定义缩放动画
        3.数字滚动动画

二、显式（手动控制）动画
      需要自己控制动画过程
1、AnimationController
  * 常用属性
      * value： 当前动画的值。可以是 `double` 类型，表示动画当前的进度。
      * status：当前动画的状态，是AnimationStatus枚举类型，可能的值有dismissed、forward、reverse 和 completed。
      * duration： 动画的时长。
      * upperBound和 lowerBound：动画的范围。

  * 常用方法：用于控制动画的播放、停止、前进、倒退等
      * forward()： 向前播放动画。
      * reverse()： 反向播放动画。
      * repeat()： 重复执行动画，可以指定周期和是否反向。
      * stop()： 停止动画。
      * reset()： 重置动画到初始状态。
      * animateTo()： 动画跳转到指定位置。
      * animateBack()： 动画跳回初始位置。
      * addListener(VoidCallback listener)：  添加监听器，每次动画值改变时调用。
      * removeListener(VoidCallback listener)： 移除监听器。
      * addStatusListener(AnimationStatusListener listener)： 添加状态监听器，动画状态改变时调用。
      * removeStatusListener(AnimationStatusListener listener)： 移除状态监听器。

  Ticker
    * 当创建一个AnimationController时，需要传递一个vsync参数，它接收一个TickerProvider类型的对象
    * Ticker添加屏幕刷新回调，防止屏幕外动画（动画的UI不在当前屏幕时，如锁屏时）消耗不必要的资源

2、Animation
    * 主要的功能是保存动画的插值和状态；其中一个比较常用的Animation类是Animation<double>
    * 在动画的每一帧中，我们可以通过Animation对象的value属性获取动画的当前状态值
    * 在实际做动画的过程中，我们会用到各种各样的Animation。例如我们做缩放动画的时候，Animation的类型为double类型，
      渐变动画的时候，Animation可以表示颜色的动画，平移动画的时候，Animation可以表示平移的大小。
  
  监听通知：
    addListener()；它可以用于给Animation添加帧监听器，在每一帧都会被调用

3、Tween：
    定义动画的开始和结束值。常见的有 Tween<double>、ColorTween 等。

4、Listeners：
    通过 addListener 和 addStatusListener 可以监听动画的每一帧和动画状态的变化。

5、Builders：
    通过 AnimatedBuilder 或 CustomPainter 等将动画值应用到UI上。
    

三、其他动画
1、
2、
3、
4、
5、

*/ 




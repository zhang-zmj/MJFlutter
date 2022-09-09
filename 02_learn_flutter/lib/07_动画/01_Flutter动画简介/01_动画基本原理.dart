
/*
动画基本原理
  1、Animation
      * 主要的功能是保存动画的插值和状态；其中一个比较常用的Animation类是Animation<double>
      * 在动画的每一帧中，我们可以通过Animation对象的value属性获取动画的当前状态值

    动画通知：
      addListener()；它可以用于给Animation添加帧监听器，在每一帧都会被调用
      addStatusListener()；它可以给Animation添加“动画状态改变”监听器

  2、Curve
      动画过程可以是匀速的、匀加速的或者先加速后减速等
        linear	匀速的
        decelerate	匀减速
        ease	开始加速，后面减速
        easeIn	开始慢，后面快
        easeOut	开始快，后面慢
        easeInOut	开始慢，然后加速，最后再减速

  3、Controller
    AnimationController
        用于控制动画，它包含动画的启动forward()、停止stop() 、反向播放 reverse()等方法
        * 在给定的时间段内线性的生成从 0.0 到1.0（默认区间）的数字

    Ticker
      当创建一个AnimationController时，需要传递一个vsync参数，它接收一个TickerProvider类型的对象
        * Ticker添加屏幕刷新回调，防止屏幕外动画（动画的UI不在当前屏幕时，如锁屏时）消耗不必要的资源

  4、Tween： Tween继承自Animatable<T>
      定义从输入范围到输出范围的映射。输入范围通常为[0.0，1.0]

    Tween.animate：
       注意： animate()返回的是一个Animation


  5、线性插值lerp函数
      //a 为起始颜色，b为终止颜色，t为当前动画的进度[0,1]
      Color.lerp(a, b, t);

    lerp 的计算一般遵循： 返回值 = a + (b - a) * t


*/

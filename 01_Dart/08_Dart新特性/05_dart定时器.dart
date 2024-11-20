import 'dart:async';

void main(List<String> args) {
// Timer中的代码都是异步执行的。

//1、延时任务
  // setTimeNumber();

//2、定时器任务:
  // const timeout = const Duration(seconds: 1);
  // Timer timer = Timer.periodic(timeout, (timer) {
  //   print('afterTimer=' + DateTime.now().toString());
  //   timer.cancel();
  // });
  // 定时器的属性
  // timer.isActive; // 定时器是否在运行
  // timer.tick; // 定时器的执行次数 从执行到结束中间的执行次数（又可能卡顿产生）
  // timer.cancel(); // 取消定时器

  Timer.run(() => print('timer run'));
}

// 延时任务是指延迟一段时间之后才执行的任务，定时任务是指每隔一段时间执行一次的任务。
void setTimeNumber() {
  const timeout = const Duration(seconds: 5);
  print('currentTime=' + DateTime.now().toString()); // 当前时间
  Timer(timeout, () {
    //callback function
    print('afterTimer=' + DateTime.now().toString()); // 5s之后
  });
}

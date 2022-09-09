import 'dart:async';

void main(List<String> args) {
// 回调只需要一次
  setTimeNumber();

// 回调多次的定时器:
  const timeout = const Duration(seconds: 1);
  Timer.periodic(timeout, (timer) {
    //callback function
    //1s 回调一次
    print('afterTimer=' + DateTime.now().toString());
    // timer.cancel(); // 取消定时器
  });
}

void setTimeNumber() {
  const timeout = const Duration(seconds: 5);
  print('currentTime=' + DateTime.now().toString()); // 当前时间
  Timer(timeout, () {
    //callback function
    print('afterTimer=' + DateTime.now().toString()); // 5s之后
  });
}

import 'dart:isolate';

void main(List<String> args) {
  print("main start");

//isolate：具有自己的私有内存块和一个运行事件循环的单个线程
  Isolate.spawn(calculate, 100);
  print("main end");
}

void calculate(int count) {
  var total = 0;
  for (var i = 0; i < count; i++) {
    total += i;
  }
  print(total);
}

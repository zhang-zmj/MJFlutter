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

// https://juejin.cn/post/7314640660224213043?from=search-suggest

// https://wsa.jianshu.io/p/8ed9b183ba33

// https://www.cnblogs.com/lxlx1798/p/11047163.html


//  https://blog.csdn.net/Brath/article/details/124631084
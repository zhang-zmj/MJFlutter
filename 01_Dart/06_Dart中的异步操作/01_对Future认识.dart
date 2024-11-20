// import 'dart:io'
void main(List<String> args) {
  //1、 Future的构造方法， 执行的优先级如下： sync > microtask > Future = delayed
  // Future(() => print('Future异步方法'));
  // Future.delayed(Duration(seconds: 3), () => print('delayed异步方法'));
  // Future.microtask(() => print('microtask异步方法'));
  // Future.sync(() => print('sync同步方法'));

  //2、Future的使的简单使用
  var result = getNetworkData();
  result.then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });
}

//发送一个网络请求
Future getNetworkData() {
  // return Future.value('value异步方法');
  return Future.error('error异步方法');
}

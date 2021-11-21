import 'dart:io';

main(List<String> args) {

print("main start");

var result = getNetworkData();
result.then((value){
  print(value);
})
.catchError((error){
    print("执行catchError代码：$error -------");
})
.whenComplete((){
    print("代码执行完成");
});

print("main end");


}

//发送一个网络请求
Future getNetworkData(){

    //1、只要有返回结果，就会执行Futrue对应的then的回调
    //2、如果没有结果返回(有错误信息)，需要在Futrue回调中抛出一个异常
    return Future((){
      sleep(Duration(seconds: 2));
    //  return "hello world";
      throw Exception("我是错误信息");
    });

}








import 'dart:io';

import '01_对Future认识.dart';
import '04_await_async的使用.dart';

main(List<String> args) {
  
  print("main start ");

  getData().then((value){

      print(value); 

  }).catchError((error){

      print(error);

  });

  print("main end ");

}



Future getData() async {

/*

  getNetworkData("argument1").then((value){

    print(value);
    return getNetworkData(value);

  }).then((value){

      print(value);
      return getNetworkData(value);

  }).then((value){

    print(value);

  });

*/

var value1 =  await getNetWorkData("argument1");
print(value1);

var value2 = await getNetWorkData(value1);
print(value2);

var value3 = await getNetWorkData(value2);
print(value3);

return value3;

}


Future getNetWorkData(String arg) async {

  return Future((){
      sleep(Duration(seconds: 3));
      return "hello world";
  });

}









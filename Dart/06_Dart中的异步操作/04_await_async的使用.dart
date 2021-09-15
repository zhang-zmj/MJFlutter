
import 'dart:io';

main(List<String> args) {
  
  print("main start");

  getNetworkData().then((value){
     print(value);
  });
  
  print("main end");

}


Future getNetworkData() async {

    await sleep(Duration(seconds: 3));
    return "hello world";

}










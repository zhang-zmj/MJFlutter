
import 'dart:isolate';

main(List<String> args) {

print("main start");

Isolate.spawn(calculate, 100);

print("main end");


}


void calculate(int count){
  var total = 0;
  for (var i = 0; i < count; i++) {
    total += i;
  }
  print(total);
}





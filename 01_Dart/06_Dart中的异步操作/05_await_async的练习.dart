import 'dart:io';

void main(List<String> args) {
  print("main start ");

  getData().then((value) {
    print(value);
  }).catchError((error) {
    print(error);
  });

  print("main end ");
}

Future getData() async {
  var value1 = await getNetWorkData("argument1");
  print(value1);

  var value2 = await getNetWorkData("hello world");
  print(value2);

  var value3 = await getNetWorkData("zhangmj");
  print(value3);

  return value3;
}

Future getNetWorkData(String arg) async {
  return Future(() {
    sleep(Duration(seconds: 3));
    return arg;
  });
}

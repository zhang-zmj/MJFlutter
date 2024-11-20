void main(List<String> args) {
  // 1、Number 转  String
  // String str1 = "123";
  // var myNum = int.parse(str);

  String str = "123.1";
  var myNum = double.parse(str);
  var isNumber = (myNum is int);
  print(isNumber);

  // 2、String 转 Number
  var num1 = 123;
  var num2 = 123.456;
  var num1Str = num1.toString();
  var num2Str = num2.toString();
  var num2StrD = num2.toStringAsFixed(2); // 保留两位小数
  print('${num1Str} ${num1Str.runtimeType}'); // 123 String
  print('${num2Str} ${num2Str.runtimeType}'); // 123.456 String
  print('${num2StrD} ${num2StrD.runtimeType}'); // 123.46 String
}

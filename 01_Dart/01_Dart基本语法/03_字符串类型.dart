void main(List<String> args) {
  //1、字符串声明
  var str1 = 'this is str';
  String str2 = '你好dart';
  print(str1);
  print(str2);

  //2、多行字符串声明
  var str3 = """
    abc
    cba
    nba
    """;
  print(str3);

  //3、字符串和表示进行拼接： 强调：${变量}, 那么{}可以省略
  var name = "why";
  var age = 19;
  var height = 1.88;
  var message1 = "my name is ${name}, age is ${age}, height is ${height}";
  print(message1);
}

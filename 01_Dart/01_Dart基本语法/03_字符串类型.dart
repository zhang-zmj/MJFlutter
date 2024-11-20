void main(List<String> args) {
  //1、字符串声明
  String str2 = '你好dart';
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

  //4、拼接
  var message2 = "我的名字叫" + name + ", 我的年龄是多大？" + age.toString() + ", 我的身高是多少 " + height.toString();
  print(message2);
}

main(List<String> args) {
  
   //1、定义字符串
   var str1 = "abcabcabc";
   var str2 = "abc";
   var str3 = """
   abc
   cba
   nba
   """;
   
    //2、字符串和表示进行拼接： 强调：${变量}, 那么{}可以省略
    var name = "why";
    var age = 19;
    var height = 1.88;
    var message1 = "my name is ${name}, age is ${age}, height is ${height}";
    var message2 = "name is $name, type is ${name.runtimeType}";

}

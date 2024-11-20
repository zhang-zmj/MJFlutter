/*
自定义方法：
   返回类型 方法名称(参数1，参数2，...){
    方法体
    return 返回值
   }
*/
void main(List<String> args) {
  print(sum(20, 30));
}

//开发中返回值类型不建议省略
int sum(int num1, int num2) {
  return num1 + num2;
}

String printUserInfo() {
  return "this is str";
}

List getList() {
  return ["111", "222", "333"];
}

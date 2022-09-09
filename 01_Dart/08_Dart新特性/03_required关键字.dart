/*
required：内置修饰符
  根据需要标记任何命名参数(函数或类)，使他们不为空，
  因为可选参数中必须有个require
*/
void main(List<String> args) {
  print(getUserInfo("zhangsan", age: 20, sex: "男"));
}

String getUserInfo(String userName, {required int age, required String sex}) {
  if (age != 0) {
    return "姓名：$userName----性别：$sex-----年龄：$age";
  } else {
    return "姓名：$userName----性别：$sex-----年龄保密";
  }
}

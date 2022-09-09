/*
空安全：
  1、避免一些日常开发中很难被发现的错误，并且额外的好处㐊可以改善性能
  2、 ? 可空类型   ！类型断言
*/
void main(List<String> args) {
  String? userName = "张三";
  userName = null;
  print(userName);
  print(getData("https://www.baidu.com"));

  try {
    print(userName!.length);
  } catch (e) {
    print(e);
  }
}

String? getData(apiUrl) {
  if (apiUrl != null) {
    return "年好啊哈";
  }
  return null;
}

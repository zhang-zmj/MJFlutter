// import 'package:intl/intl.dart';
/*
extension：
  * 允许在不修改类本身的情况下为类添加新的方法和功能
  * 为Dart内置类、自定义类甚至第三方库的类添加方法
*/

void main(List<String> args) {
  final String message = "hello world";
  final result1 = message.hy_split(" ");
  print(result1);

  final result2 = "hello world".capitalize();
  print(result2);
}

// 1、扩展内置类
extension StrSplit on String {
  List<String> hy_split(String split) {
    return this.split(split);
  }

  /// 将字符串的首字母大写
  String capitalize() {
    if (isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${substring(1)}';
  }
}

// 2、扩展自定义类
class Rectangle {
  double width;
  double height;

  Rectangle(this.width, this.height);
}

extension RectangleArea on Rectangle {
  double getArea() {
    return width * height;
  }
}

// 3、扩展第三方库的类

extension DateTimeExtension on DateTime {
  /// 格式化日期和时间字符串
  // String format(String pattern) {
  //   final formatter = DateFormat(pattern);
  //   return formatter.format(this);
  // }
}

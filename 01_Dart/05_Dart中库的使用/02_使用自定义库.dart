/**
 * 1.补充一: as关键字给库起别名
 * 2.补充二: 默认情况下载导入一个库时, 导入这个库中所有的内容
 *    * show: 执行要导入的内容
 *    * hide: 隐藏某个要导入的内容, 导入其它内容
 * 3.公共的dart文件的抽取: export
 * 4.下划线是区分公共和私有的
 */

// import 'utils/math_utils.dart' as mUtils;
// import "utils/math_utils.dart" show sum, mul;
// import "utils/math_utils.dart" hide mul;
// import 'utils/date_utils.dart';
import "utils/utils.dart";

main(List<String> args) {
  // print(mUtils.sum(20, 30));

  print(sum(20, 30));
  // print(mul(20, 30));

  print(dateFormat());

  min(20, 30);
}

// void sum(num1, num2) {
//   print(num1 + num2);
// }

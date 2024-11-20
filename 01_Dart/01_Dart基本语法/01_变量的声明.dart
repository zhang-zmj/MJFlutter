void main(List<String> args) {
/*
1、类型推导： var/const/final/late 变量名称 = 赋值;
     var ：声明变量，
     const：声明常量，编译时就要有一个确定的值，只能赋值一次
     final： 声明常量，通过计算/函数获取一个值(运行期间来确定一个值)，只能赋值一次
     late： 声明一个非空的变量，但不初始化、 延迟初始化变量
*/
  var age = 20;
  const name = "zhangmj";
  final height = DateTime.now();
  late String description;
  description = "广州市";

  print(age);
  print(name);
  print(height);
  print(description);

/*
2、一个对象不受限于单一类型的声明
  * dynamic 代表任意类型，但是运行时会存在安全隐患
  * Object  Object 是所有Dart所有对象的根基，只能使用 Object 的属性与方法，编译时会报错
*/
  Object name2 = 'Bob';
  dynamic person = 'LiLi';

  print(name2.runtimeType); // String
  print(person.runtimeType); // int
  // print(name2.substring(1)); // B 这个报错
  print(person.substring(1)); // B

  // 3、明确变量类型
  int lineCount = 0;
  String? name3 = "";
  print(lineCount);
  print(name3);
}





 /*

const 与 final 相同点：
  final 或 const 修饰的变量不能更改

const 与 final 不同点：
const
  1、const 修饰的变量必须初始化
  2、修饰的变量必须是编译时常量
  3、访问类中const修饰的变量需要static修饰
  4、当const修饰类的构造函数时，它要求该类的所有成员都必须是final的。  
final
  1、实例变量可以是 final 但不能是 const。（引用类型、函数、类、方法）
  2、虽然 final 对象不能被修改，但它的字段可能可以被更改
  3、const 对象及其字段不能被更改：它们是 不可变的。
  */


// https://dart.cn/language/built-in-types/


// 1.快速创建widget：在dart文件中输入stf或st1出现提示后按回车即可
// 1.快速修复：command +.
// 1.自动生成构造函数：选中 final 参数，快捷键：command +.
// 1.添加父组件、变为子组件、删除子组件：command +.
// 1.重新打开 关闭的编辑页面：command + shift + T
// 1.通过匹配文本打开文件：command +T
// 1.代码格式化：shift + option +F
// 1.打开console:command + J
// 1.查看源码：将光标放到要查看源码的类名或方法名上，长按command
// 1.查看类的子类：选中要查看的类，然后：command +F12
// 1.后退：当跟踪代码的时候，经常跳转到其他类，后退快捷键：ctrl+-
// 1.导入类的快捷键：将光标放在要导入类的上面，然后按
// command + .
// 1.全局搜索：command + shift + F
// 1.把当前行代码和上一行/下一行代码互换位置：option +上个/下！
// 然后的点击
// 1.快速复制当前行 option + shifit +  下

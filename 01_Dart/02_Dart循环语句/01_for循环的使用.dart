main(List<String> args) {
  //1.遍历数组
  var names = ["why", "cba", "cba"];
  for (var i = 0; i < names.length; i++) {
    print(names[i]);
  }

  for (var name in names) {
    print(name);
  }

  names.forEach((value) {
    print(value);
  });

  names.map((value) {
    return value + "zhangmj";
  });

  var numbers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
  var newNumbersWhere = numbers.where((value) {
    return value % 2 == 0;
  });
  print(newNumbersWhere);

  var newNumbersAny = numbers.any((value) {
    // 只要有一个符合条件就返回true
    return value > 5;
  });
  print(newNumbersAny);

  var newNumbersEvery = numbers.every((value) {
    // 所有都符合条件才返回true
    return value > 5;
  });
  print(newNumbersEvery);
}

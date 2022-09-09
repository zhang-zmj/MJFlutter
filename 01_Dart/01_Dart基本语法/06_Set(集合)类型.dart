void main(List<String> args) {
  
  // Set的定义：是无序的，并且元素是不重复的
    // 1.使用类型推导定义
    var lettersSet = {'a', 'b', 'c', 'd'};
    print('$lettersSet ${lettersSet.runtimeType}');

    // 2.明确指定类型
    Set<int> numbersSet = {1, 2, 3, 4};
    print('$numbersSet ${numbersSet.runtimeType}');

}
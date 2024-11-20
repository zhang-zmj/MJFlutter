void main(List<String> args) {}

/*
 Dart中没有哪一个关键字是来定义接口的
  1、没有这些关键字interface/protocol
  2、Dart支持单继承
  3、在通过implements实现某个类时，类中所有的方法都必须被重新实现(无论这个类原来是否已经实现过该方法)
*/

class Runner {
  void running() {}
}

class Flyer {
  void flying() {}
}

class Animal {
  void eating() {
    print("动物吃东西");
  }

  void running() {
    print("running");
  }
}

class SuperMan extends Animal implements Runner, Flyer {
  @override
  void eating() {
    super.eating();
  }

  @override
  void running() {
    super.running();
  }

  //实现类中的方法
  @override
  void flying() {}
}

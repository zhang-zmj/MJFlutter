main(List<String> args) {
  
  final sm = SuperMan();
  sm.running();
  sm.flying();

}


/*
 Mixin混入
 但是某些情况下，一个类可能希望直接复用之前类的原有实现方案，怎么做呢?
  1、除了可以通过class定义类之外，也可以通过mixin关键字来定义一个类。
  2、只是通过mixin定义的类用于被其他类混入使用，通过with关键字来进行混入
*/


mixin Runner {
  void running(){
    print("runner running");
  }
}

mixin Flyer {
  void flying(){
    print("flying");
  }
}

class Animal {
   void eating(){
     print("动物吃东西");
   }
   void running(){
     print("animal running");
   }
}

class SuperMan extends Animal with Runner, Flyer {
   @override
  void eating() {
    super.eating();
  }

   void running(){
     print("SuperMan running");
   }

}



main(List<String> args) {
  
var p = Person();
p.run();
p.eat();

//级联运算符
var person = Person()
      ..name = "why"
      ..eat()
      ..run();

}


class Person {

    String name = "";

    void run(){
        print("running");
    }
    void eat(){
        print("eatning");
    }

}





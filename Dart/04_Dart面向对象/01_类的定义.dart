main(List<String> args) {
  
 var p = Person("why", 18);

}


class Person {
  String name;
  int age;

//1、初始化
  // Person(String name, int age){
  //    this.name = name;
  //    this.age = age;

  // }

 //2、语法糖
  Person(this.name, this.age);

}

















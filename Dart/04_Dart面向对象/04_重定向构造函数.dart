
main(List<String> args) {
  
  var p = Person("why");
  print(p.age);

}

class Person {
  String name;
  int age;
  
  //Person(this.name): age = 0;
  Person(String name): this._internal(name,18);

  Person._internal(this.name, this.age);

}







main(List<String> args) {
  
  const p1 = Person("why");
  const p2 = Person("why");
  print(identical(p1, p2));

}

class Person {
  final String name;
  // final String age;

   const Person(this.name);
  // const Person(this.name,this.age);

}










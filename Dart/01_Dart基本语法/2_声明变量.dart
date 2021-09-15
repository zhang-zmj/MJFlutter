

main(List<String> args) {
  
 //1、明确的声明
  String name = "why";

  //2、类型推导
    /*
     var ：声明变量
     final： 声明常量
     const： 声明常量
    */ 
   var age =20; 
   final height = 1.88;
   const address = "广州市";

  /*
    3、final与const 
         final：通过计算/函数获取一个值(运行期间来确定一个值)
         const：常量值，编译期间需要有一个确定的值
  */

  final p1 = Person("why");
  final p2 = Person("why");
  //p1和p2是不是同一个对象
   print(identical(p1, p2));
 
 //创建出同一个对象,类似于单利
  const p3 = Student("why");
  const p4 = Student("why");
  const p5 = Student("lilei");
  print(identical(p3, p4));
  print(identical(p4, p5)); 


}


class Person {

   String name;
   Person(String name){
     this.name = name;
   }

}


class Student {

  final String name;
  const Student(this.name);

}






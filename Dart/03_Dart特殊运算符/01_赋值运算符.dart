main(List<String> args) {
  
  //  ?= 原来这个变量有值，就不赋值，没有值就赋值
  var name = null;
   name ??= "lilei";
  print(name);

 // ??
   var age = "18";
   var temp = age ?? "lilei";
  print(temp);


}








main(List<String> args) {
  //1、列表
  var names = ["abc", "cba", "cba", "nba"];
  names.add("mba");
  names.add("abc");
  // names.remove("abc");
  // names.removeAt(0);
  names = Set<String>.from(names).toList();
  print(names);

  //2、集合Set: {};
  var movies = {"星际穿越", "大话西游", "盗梦空间"};

  //3、映射Map
  var info = {"name": "why", "age": 18};
}

void main(List<String> args) {
  MyList list = new MyList<String>();
  list.add("张三");
  list.add("张张张");
  print(list.getList());
}

/*
 MyList list = new MyList();
  list.add("张三");
  list.add(12);
  list.add(true);
  list.add("张张张");
  print(list.getList());
*/

class MyList<T> {
  List list = <T>[];
  void add(T value) {
    this.list.add(value);
  }

  List getList() {
    return list;
  }
}

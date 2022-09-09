void main(List<String> args) {
  final color = Colors.red;
  switch (color) {
    case Colors.red:
      print("红色");
      break;
    case Colors.blue:
      print("蓝色");
      break;
    case Colors.green:
      print("绿色");
      break;
    default:
      break;
  }

  print(Colors.values);
  print(Colors.green.index);
}

enum Colors { red, blue, green }

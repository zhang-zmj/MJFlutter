void main(List<String> args) {
  print(getData(21).runtimeType);
  print(getData("xxx").runtimeType);

  print(getData<String>("你好").runtimeType);
}

T getData<T>(T value) {
  return value;
}

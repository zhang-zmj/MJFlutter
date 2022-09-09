void main(List<String> args) {
  print(getData(21));
  print(getData("xxx"));

  print(getData<String>("你好"));
}

T getData<T>(T value) {
  return value;
}

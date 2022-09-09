void main(List<String> args) {
  final String message = "Hello World";
  final result = message.hy_split(" ");
  print(result);
}

extension StrSplit on String {
  List<String> hy_split(String split) {
    return this.split(split);
  }
}

import 'package:flutter/material.dart';
import 'package:learn_flutter/11_%E8%B7%AF%E7%94%B1%E7%AE%A1%E7%90%86/main.dart';

class SecondPage extends StatelessWidget {
  final String params;
  const SecondPage({Key? key, this.params = ''}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          print("params -----$params");
            var result = "from secondPage";
            router.popRoute(params: result);
        },
        child: Text("按钮是多少"),
      ),
    );
  }
}

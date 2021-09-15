import 'package:flutter/material.dart';


class ZMJHomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("第一个Flutter程序"),
        ),
        body: ZMJContentBody()
    );
  }

}


//flag：状态
//StatefulWidget不能定义状态 -> 创建一个单独的类，这个类负责维护状态
//StatefulWidget：继承StatefulWidget的类(可以接受父widget传过来的数据) / State类(状态)
class ZMJContentBody extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {
    return ZMJContentBodyState();
  }

}

class ZMJContentBodyState extends State<ZMJContentBody> {

  var flag = true;

  @override
  Widget build(BuildContext context) {

    return  Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Checkbox(
                value: flag,
                onChanged: (value){
                  setState(() {
                    flag = value;
                    print(flag);
                  });
                }
            ),
            Text("同意协议", style: TextStyle(fontSize: 25)),
          ],
        )
    );
  }

}




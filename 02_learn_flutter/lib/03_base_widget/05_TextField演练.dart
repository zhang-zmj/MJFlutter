import 'package:flutter/material.dart';

// StatefulWidget的生命周期
class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  final String imageURL = "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1111%2F060QQ15355%2F1P60Q15355-4-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640867929&t=432938b63de653add6d297a4f74558eb";
  final userNameTextEditController = TextEditingController();
  final passwordTextEditController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return  Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          TextField(
              controller: userNameTextEditController,
              decoration: InputDecoration(
                labelText: "username",
                icon: Icon(Icons.people),
                hintText: "请输入用户名",
                border: InputBorder.none,
                filled: true,
                fillColor: Colors.red[100],
                prefixStyle: TextStyle(
                    color: Colors.green
                ),


              ),
              onChanged: (value){
                print("onChange:$value");
              },
              onSubmitted: (value){
                print("onSubmitted:$value");
              }
          ),
          SizedBox(height: 10,),
          TextField(
              controller: passwordTextEditController,
              decoration: InputDecoration(
                labelText: "password",
                icon: Icon(Icons.lock),
                border: OutlineInputBorder(),
              )
          ),
          SizedBox(height: 10),
          // ignore: sized_box_for_whitespace
          Container(
            width: double.infinity,
            height: 40,
            child: TextButton(
                child: Text("登 录", style: TextStyle(fontSize: 20, color: Colors.white)),
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.green)
                ),
                onPressed: (){

                  // 1.获取用户名和密码
                  var username = userNameTextEditController.text;
                  var password = passwordTextEditController.text;
                  print("账号:$username 密码:$password");

                  clearText();

                }
            ),
          )
        ],
      ),
    );

  }

  void clearText() {
    userNameTextEditController.clear();
    passwordTextEditController.clear();
  }

}




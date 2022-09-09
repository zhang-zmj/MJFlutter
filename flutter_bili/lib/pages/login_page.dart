import 'package:flutter/material.dart';
import 'package:flutter_bili/navigator/hi_navigator.dart';
import 'package:flutter_bili/utils/string_util.dart';
import 'package:flutter_bili/widget/appbar.dart';
import 'package:flutter_bili/widget/login_effect.dart';
import 'package:flutter_bili/widget/login_input.dart';
import 'package:flutter_bili/http/dao/login_dao.dart';
import 'package:flutter_bili/widget/login_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage( {Key? key}) : super(key: key);
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("密码登录", "注册", (){
        HiNavigator.getInstance()?.onJumpTo(RouteStatus.registration);
      }),
      body: ListView(
        children:  [
          LoginEffect(protect: protect),
          LoginInput(
            "用户名",
            "请输入用户名",
            onChanged: (text) {
              userName = text;
              checkInput();
            },
          ),
          LoginInput(
            "密码",
            "请输入密码",
            obscureText: true,
            onChanged: (text) {
              password = text;
              checkInput();
            },
            focusChanged: (focus) {
              setState(() {
                protect = focus;
              });
            },
          ),
          Padding(
              padding: const EdgeInsets.only(top: 20, left: 20, right: 20),
              child: LoginButton("登录", loginEnable, onPressed: (){
                if (loginEnable) {
                  send();
                } else {
                  print("----loginEnable--年后啊啊啊---$loginEnable");
                }
              })
          )
        ],
      ),
    );
  }

  void checkInput() {
    bool enable;
    if (isNotEmpty(userName) &&
        isNotEmpty(password)) {
      enable = true;
    } else {
      enable = false;
    }
    setState(() {
      loginEnable = enable;
    });
  }

  void send() async {
    try {
      var result2 = await LoginDao.login('13325718086', '111111');
      HiNavigator.getInstance()?.onJumpTo(RouteStatus.home);
    } catch (e) {
      print("---报错的内容是---$e");
    }
  }

}

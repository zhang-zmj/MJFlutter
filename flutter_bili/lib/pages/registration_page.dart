import 'package:flutter/material.dart';
import 'package:flutter_bili/navigator/hi_navigator.dart';
import 'package:flutter_bili/utils/string_util.dart';
import 'package:flutter_bili/utils/toast.dart';
import 'package:flutter_bili/widget/appbar.dart';
import 'package:flutter_bili/widget/login_effect.dart';
import 'package:flutter_bili/widget/login_input.dart';
import 'package:flutter_bili/widget/login_button.dart';

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({Key? key}) : super(key: key);
  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  bool protect = false;
  bool loginEnable = false;
  String? userName;
  String? password;
  String? rePassword;
  String? imooocId;
  String? orderId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBar("注册", "登录", (){
        HiNavigator.getInstance()?.onJumpTo(RouteStatus.login);
      }),
      body: ListView(
        children: [
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
          LoginInput(
            "确认密码",
            "请再次输入密码",
            obscureText: true,
            onChanged: (text) {
              rePassword = text;
              checkInput();
            },
            focusChanged: (focus) {
              setState(() {
                protect = focus;
              });
            },
          ),
          LoginInput(
            "慕课网ID",
            "请输入你的慕课网用于ID",
            keboardType: TextInputType.number,
            onChanged: (text) {
              imooocId = text;
              checkInput();
            },
            focusChanged: (focus) {
              setState(() {
                protect = focus;
              });
            },
          ),
          LoginInput(
            "课程订单号",
            "请输入课程订单号后四位",
            keboardType: TextInputType.number,
            lineStretch: true,
            onChanged: (text) {
              orderId = text;
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
              child: LoginButton("注册", loginEnable, onPressed: (){
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
        isNotEmpty(password) &&
        isNotEmpty(rePassword) &&
        isNotEmpty(imooocId) &&
        isNotEmpty(orderId)) {
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
      showToast("注册成功");
    } catch (e) {
      showWarnToast("注册失败");
    }
  }
}

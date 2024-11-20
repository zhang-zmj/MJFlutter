import 'package:flutter/material.dart';

class MJTextFieldWidget extends StatefulWidget {
  const MJTextFieldWidget({super.key});
  @override
  State<MJTextFieldWidget> createState() => _MJTextFieldWidgetState();
}

class _MJTextFieldWidgetState extends State<MJTextFieldWidget> {
  // 焦点
  FocusNode focusNode1 = FocusNode();
  FocusNode focusNode2 = FocusNode();
  FocusScopeNode? focusScopeNode;

  String? userName;
  String? passWord;
  // 编辑框的控制器，通过它可以设置/获取编辑框的内容、选择编辑内容、监听编辑文本改变事件
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    //监听输入改变
    _userNameController.addListener(() {
      debugPrint("--用户名--${_userNameController.text}-----");
    });
    _passWordController.addListener(() {
      debugPrint("--密码--${_passWordController.text}-----");
    });

    _userNameController.text = "hello world!";
    _userNameController.selection = TextSelection(baseOffset: 2, extentOffset: _userNameController.text.length);

    // 监听焦点变化
    focusNode1.addListener(() {
      debugPrint("-----${focusNode1.hasFocus}------");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          /*
          TextField(
            controller: _userNameController,
            autofocus: true,
            focusNode: focusNode1,
            decoration: const InputDecoration(labelText: "用户名", hintText: "用户名或邮箱", prefixIcon: Icon(Icons.person)),
            // onChanged: (v) {
            //   print("userName-------onChange: $v");
            // }
          ),
          TextField(
            controller: _passWordController,
            focusNode: focusNode2,
            obscureText: true,
            decoration: const InputDecoration(labelText: "密码", hintText: "您的登录密码", prefixIcon: Icon(Icons.lock)),
            // onChanged: (v) {
            //   print("passWord-------onChange: $v");
            // }
          ),

          // Builder组件起闭包作用，可以限制期使用范围。
          Builder(builder: (ctx) {
            return Column(children: [
              ElevatedButton(
                  child: const Text("移动焦点"),
                  onPressed: () {
                    //将焦点从第一个TextField移到第二个TextField
                    // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                    // 这是第二种写法

                    focusScopeNode ??= FocusScope.of(context);
                    focusScopeNode?.requestFocus(focusNode2);
                  }),
              ElevatedButton(
                  child: const Text("隐藏键盘"),
                  onPressed: () {
                    // 当所有编辑框都失去焦点时键盘就会收起
                    focusNode1.unfocus();
                    focusNode2.unfocus();
                  }),
            ]);
          }),

          const SizedBox(height: 20),

        */

          // 1、第一种自定义：
          const TextField(
            decoration: InputDecoration(
                labelText: "请输入用户名",
                prefixIcon: Icon(Icons.person),
                // 未获得焦点下划线设为灰色
                enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey), borderRadius: BorderRadius.all(Radius.circular(5))),
                //获得焦点下划线设为蓝色
                focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.blue, width: 5.0))),
          ),

          const SizedBox(height: 20),

          // 2、第二种自定义：
          Theme(
              data: Theme.of(context).copyWith(
                  hintColor: Colors.grey[200],
                  inputDecorationTheme: const InputDecorationTheme(
                      labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0) //定义提示文本样式
                      )),
              child: const Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(labelText: "用户名", hintText: "用户名或邮箱", prefixIcon: Icon(Icons.person)),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "密码",
                        hintText: "您的登录密码",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)),
                    obscureText: true,
                  )
                ],
              )),

          const SizedBox(height: 20),
          // 3、第三种自定义：
           Container(
              // 下滑线浅灰色，宽度1像素
              decoration: const BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
              child: const TextField(
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                      labelText: "Email",
                      hintText: "电子邮件地址",
                      prefixIcon: Icon(Icons.email),
                      border: InputBorder.none //隐藏下划线
                      )))
        ],
      ),
    );
  }

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }
}
  


/*
controller：控制输入框的文本内容，可以通过TextEditingController进行管理。
decoration：输入框的装饰，可以定义输入框的边框、背景、提示文本等样式。
obscureText：是否将输入内容隐藏，常用于密码输入框。
enabled：输入框是否可编辑。
maxLength：允许输入的最大字符数。
textInputAction：键盘操作按钮的类型，例如完成、继续等。
keyboardType：键盘的类型，如文本、数字、URL等。
onChanged：文本变化时的回调函数。
onSubmitted：用户提交输入时的回调函数。
focusNode：用于控制输入框的焦点获取和失去。
autofocus：是否自动获取焦点。
style：输入框文本的样式，如字体大小、颜色等。
*/ 
import 'package:flutter/material.dart';

class TextFiledWidget extends StatefulWidget {
  const TextFiledWidget({Key? key}) : super(key: key);

  @override
  State<TextFiledWidget> createState() => _TextFiledWidgetState();
}

class _TextFiledWidgetState extends State<TextFiledWidget> {

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
    _userNameController.addListener((){
      print("--用户名--${_userNameController.text}-----");
    });
    _passWordController.addListener((){
      print("--密码--${_passWordController.text}-----");
    });

    _userNameController.text = "hello world!";
    _userNameController.selection = TextSelection(
        baseOffset: 2,
        extentOffset: _userNameController.text.length
    );

    // 监听焦点变化
    focusNode1.addListener((){
      print("-----${focusNode1.hasFocus}------");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            // controller: _userNameController,
            autofocus: true,
            focusNode: focusNode1,
            decoration: InputDecoration(
              labelText: "用户名",
              hintText: "用户名或邮箱",
              prefixIcon: Icon(Icons.person)
            ),
              onChanged: (v) {
                print("userName-------onChange: $v");
              }
          ),
          TextField(
            // controller: _passWordController,
              focusNode: focusNode2,
              obscureText: true,
              decoration: InputDecoration(
                  labelText: "密码",
                  hintText: "您的登录密码",
                  prefixIcon: Icon(Icons.lock)
              ),
              onChanged: (v) {
                print("passWord-------onChange: $v");
              }
          ),

          // Builder组件起闭包作用，可以限制期使用范围。
          Builder(builder: (ctx){
            return Column(
              children: [
                ElevatedButton(
                    child: Text("移动焦点"),
                    onPressed: () {
                      //将焦点从第一个TextField移到第二个TextField
                      // 这是一种写法 FocusScope.of(context).requestFocus(focusNode2);
                      // 这是第二种写法

                      focusScopeNode ??= FocusScope.of(context);
                      focusScopeNode?.requestFocus(focusNode2);
                    }
                ),
                ElevatedButton(
                    child: Text("隐藏键盘"),
                    onPressed: () {
                      // 当所有编辑框都失去焦点时键盘就会收起
                      focusNode1.unfocus();
                      focusNode2.unfocus();
                    }
                ),

              ]
            );
          }),

          SizedBox(height: 35),
        // 1、第一种自定义：
            TextField(
              decoration: InputDecoration(
                labelText: "请输入用户名",
                prefixIcon: Icon(Icons.person),
                // 未获得焦点下划线设为灰色
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey)
                ),
                //获得焦点下划线设为蓝色
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.blue)
                )
              ),
            ),

          SizedBox(height: 35),
          // 2、第二种自定义：
          Theme(
              data: Theme.of(context).copyWith(
                hintColor: Colors.grey[200],
                inputDecorationTheme: InputDecorationTheme(
                  labelStyle: TextStyle(color: Colors.grey), //定义label字体样式
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 14.0)//定义提示文本样式
                )
              ),
              child: Column(
                children: <Widget>[
                  TextField(
                    decoration: InputDecoration(
                        labelText: "用户名",
                        hintText: "用户名或邮箱",
                        prefixIcon: Icon(Icons.person)
                    ),
                  ),
                  TextField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(Icons.lock),
                        labelText: "密码",
                        hintText: "您的登录密码",
                        hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0)
                    ),
                    obscureText: true,
                  )
                ],
              )),

          SizedBox(height: 35),
          // 3、第三种自定义：
          Container(
            // 下滑线浅灰色，宽度1像素
              decoration: BoxDecoration(border: Border(bottom: BorderSide(color: Colors.grey, width: 1.0))),
              child: TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: "Email",
                  hintText: "电子邮件地址",
                  prefixIcon: Icon(Icons.email),
                  border: InputBorder.none //隐藏下划线
                ))
            )
        ]
      ),
    );
  }
}






import 'package:flutter/material.dart';

/*
Form： 继承自StatefulWidget对象，它对应的状态类为FormState
FormField： 是一个抽象类，定义几个属性
FormState： 为Form的State类，可以通过Form.of()或GlobalKey获得

TextFormField组件：
    它继承自FormField类，也是TextField的一个包装类，所以除了FormField定义的属性之外，它还包括TextField的属性
*/
class FormWidget extends StatefulWidget {
  const FormWidget({Key? key}) : super(key: key);

  @override
  State<FormWidget> createState() => _FormWidgetState();
}

class _FormWidgetState extends State<FormWidget> {
  final TextEditingController _unameController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final GlobalKey _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              autofocus: true,
              controller: _unameController,
              decoration: InputDecoration(
                labelText: "用户名",
                hintText: "用户名或邮箱",
                icon: Icon(Icons.person)
              ),
            //  校验用户名
              validator: (v){
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              },
            ),
            TextFormField(
              controller: _pwdController,
              decoration: InputDecoration(
                labelText: "密码",
                hintText: "你的登录密码",
                icon: Icon(Icons.lock)
              ),
              obscureText: true,
              validator: (v){
                return v!.trim().length > 5 ? null : "密码不能少于6位";
              },
            ),
            
            Padding(
                padding: EdgeInsets.only(top: 28),
                child: Row(
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {
                              // 通过_formKey.currentState 获取FormState后，
                              // 调用validate()方法校验用户名密码是否合法，校验
                              // 通过后再提交数据。
                              if ((_formKey.currentState as FormState).validate() ) {
                                    //验证通过提交数据
                              }
                            },
                            child: Padding(
                                    padding: EdgeInsets.all(16),
                                    child: Text("登录"),
                            )))
                    ],
                )
            )]
        )
    );
  }
}




import 'package:flutter/material.dart';

/*
Form： 继承自StatefulWidget对象，它对应的状态类为FormState
FormField： 是一个抽象类，定义几个属性
FormState： 为Form的State类，可以通过Form.of()或GlobalKey获得

TextFormField组件：
    它继承自FormField类，也是TextField的一个包装类，所以除了FormField定义的属性之外，它还包括TextField的属性
*/
class MJFormWidget extends StatefulWidget {
  const MJFormWidget({super.key});

  @override
  State<MJFormWidget> createState() => _MJFormWidgetState();
}

class _MJFormWidgetState extends State<MJFormWidget> {
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passWordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: Column(children: [
          TextFormField(
              autocorrect: true,
              controller: _userNameController,
              decoration: const InputDecoration(labelText: "用户名", hintText: "用户名或邮箱", prefixIcon: Icon(Icons.person)),
              // 校验用户名
              validator: (v) {
                return v!.trim().isNotEmpty ? null : "用户名不能为空";
              }),
          TextFormField(
            controller: _passWordController,
            decoration: const InputDecoration(
              labelText: "密码",
              hintText: "您的登录密码",
              hintStyle: TextStyle(color: Colors.grey, fontSize: 13.0),
              prefixIcon: Icon(Icons.lock),
            ),
            obscureText: true,
            validator: (value) => value!.trim().length > 5 ? null : "密码不能少于6位",
          ),
          Padding(
              padding: const EdgeInsets.all(28),
              child: Row(children: [
                Expanded(
                  child: ElevatedButton(
                    child: const Text("登录"),
                    onPressed: () {
                      // 通过_formKey.currentState 获取FormState后，
                      // 调用validate()方法校验用户名密码是否合法，校验
                      // 通过后再提交数据。
                      if ((_formKey.currentState as FormState).validate()) {
                        // 校验通过
                        debugPrint("校验通过");
                      }
                    },
                  ),
                )
              ]))
        ]));
  }
}

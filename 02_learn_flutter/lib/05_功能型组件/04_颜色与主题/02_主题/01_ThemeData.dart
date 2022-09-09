import 'package:flutter/material.dart';


/*
Theme组件
  可以为Material APP定义主题数据（ThemeData）。
  Material组件库里很多组件都使用了主题数据，如导航栏颜色、标题字体、Icon样式等。
  Theme内会使用InheritedWidget来为其子树共享样式数据
*/

class ThemeDataWidget extends StatefulWidget {
  const ThemeDataWidget({Key? key}) : super(key: key);
  @override
  State<ThemeDataWidget> createState() => _ThemeDataWidgetState();
}

class _ThemeDataWidgetState extends State<ThemeDataWidget> {

  var _themeColor = Colors.teal; //当前路由主题色

  @override
  Widget build(BuildContext context) {
    ThemeData themeData = Theme.of(context);
    return Theme
      (
        data: ThemeData(
          //用于导航栏、FloatingActionButton的背景色等
          primarySwatch: _themeColor,

          iconTheme: IconThemeData(color: _themeColor)
        ),
        child: Scaffold(
          appBar: AppBar(title: Text("主题测试")),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              //第一行Icon使用主题中的iconTheme
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.favorite),
                  Icon(Icons.airport_shuttle),
                  Text("  颜色跟随主题")
                ],
              ),
              //为第二行Icon自定义颜色（固定为黑色)
              Theme(
                  // copyWith 表示复制原来的对象，来创建新的对象，并在此的基础上修改
                  data: themeData.copyWith(
                      iconTheme: themeData.iconTheme.copyWith(
                        color: Colors.black
                      )
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.favorite),
                      Icon(Icons.airport_shuttle),
                      Text("  颜色固定黑色")
                    ],
                  )
              )
            ],
          ),
          floatingActionButton: FloatingActionButton(
            //切换主题
              onPressed: () => setState(() {
                _themeColor = _themeColor == Colors.teal ? Colors.blue : Colors.teal;
              }),
              child: Icon(Icons.palette),
          )
        ));
  }
}

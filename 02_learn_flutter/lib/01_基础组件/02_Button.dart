import 'package:flutter/material.dart';

class ZMJHomeDemo extends StatefulWidget {
  @override
  _ZMJHomeDemoState createState() => _ZMJHomeDemoState();
}

class _ZMJHomeDemoState extends State<ZMJHomeDemo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("基础Widget"),
        ),
        body:ZMJHomeContent(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: (){
            print('不要啊~');
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked
    );
  }
}

// StatefulWidget的生命周期
class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // 1.ElevatedButton：即"漂浮"按钮，它默认带有阴影和灰色背景
        ElevatedButton(
          child: Text("RaisedButton"),
          style: ButtonStyle(backgroundColor: MaterialStateProperty.all( Colors.purple ), foregroundColor: MaterialStateProperty.all(Colors.white)),
          onPressed: () => print("ElevatedButton Click"),
        ),
        // 2.TextButton：文本按钮，默认背景透明并不带阴影
        TextButton(
            child: Text("TextButton按钮"),
            //设置按钮是否自动获取焦点
            autofocus: true,
            onPressed: () => print("TextButton Click"),
            //定义一下文本样式
            style: ButtonStyle(
              //定义文本的样式 这里设置的颜色是不起作用的
              textStyle: MaterialStateProperty.all( TextStyle(fontSize: 18, color: Colors.red)),

              //设置按钮上字体与图标的颜色
              //foregroundColor: MaterialStateProperty.all(Colors.deepPurple),

              //更优美的方式来设置
              foregroundColor: MaterialStateProperty.resolveWith(
                    (states) {
                  if (states.contains(MaterialState.focused) &&
                      !states.contains(MaterialState.pressed)) {
                    //获取焦点时的颜色
                    return Colors.blue;
                  } else if (states.contains(MaterialState.pressed)) {
                    //按下时的颜色
                    return Colors.deepPurple;
                  }
                  //默认状态使用灰色
                  return Colors.grey;
                },
              ),
              //背景颜色
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                //设置按下时的背景颜色
                if (states.contains(MaterialState.pressed)) {
                  return Colors.blue[200];
                }
                //默认不使用背景颜色
                return null;
              }),
              //设置水波纹颜色
              overlayColor: MaterialStateProperty.all(Colors.yellow),
              //设置阴影  不适用于这里的TextButton
              elevation: MaterialStateProperty.all(0),
              //设置按钮内边距
              padding: MaterialStateProperty.all(EdgeInsets.all(10)),
              //设置按钮的大小
              minimumSize: MaterialStateProperty.all(Size(200, 100)),

              //设置边框
              side:
              MaterialStateProperty.all(BorderSide(color: Colors.grey, width: 1)),
              //外边框装饰 会覆盖 side 配置的样式
              shape: MaterialStateProperty.all(StadiumBorder()),
            )
        ),

        // 3.OutlineButton：默认有一个边框，不带阴影且背景透明
        OutlinedButton(
          child: Text("OutlineButton"),
          onPressed: () => print("OutlineButton"),
        ),

        // 4.IconButton：是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
        IconButton(
          icon: Icon(Icons.thumb_up),
          onPressed: () {},
        ),

        // 5.IconButton：是一个可点击的Icon，不包括文字，默认没有背景，点击后会出现背景
        ElevatedButton.icon(
          icon: Icon(Icons.send),
          label: Text("发送"),
          onPressed: (){},
        ),
        OutlinedButton.icon(
          icon: Icon(Icons.add),
          label: Text("添加"),
          onPressed: (){},
        ),
        TextButton.icon(
          icon: Icon(Icons.info),
          label: Text("详情"),
          onPressed: (){},
        ),

        //6.定义button: 图标-文字-背景-圆角
        TextButton(
          style: ButtonStyle(textStyle: MaterialStateProperty.all( TextStyle(fontSize: 18, color: Colors.red))),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Icon(Icons.favorite, color: Colors.red,),
              Text("喜欢作者")
            ],
          ),
          onPressed: () {},
        )
      ],
    );
  }

}



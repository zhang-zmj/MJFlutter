import 'package:flutter/material.dart';

/*
  Icon字体图标和图片图标:
    * 字体图标矢量图(放大的时候不会失真)
    * 字体图标可以设置颜色
    * 图标很多时, 占据空间更小
  
  fonts字体:
  - family: myIcon  #指定一个字体名
    fonts:
      - asset: fonts/iconfont.ttf
*/
class MJIconWidget extends StatelessWidget {
  const MJIconWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return const Icon(Icons.home, color: Colors.red, size: 30);

    // return const Icon(
    //   IconData(0xe91d, fontFamily: 'MaterialIcons'),
    //   size: 100,
    //   color: Colors.orange,
    // );

    //1.0xe91d -> unicode编码
    //2.设置对应的字体
    // return const Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"));

    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(MyIcons.book, size: 60, color: Colors.purple),
        Icon(MyIcons.book, size: 40, color: Colors.green),
      ],
    );
  }
}

class MyIcons {
  // book 图标
  static const IconData book = IconData(0xe614, fontFamily: "myIcon", matchTextDirection: true);

  // 微信图标
  static const IconData wechat = IconData(0xec7d, fontFamily: "myIcon", matchTextDirection: true);
}

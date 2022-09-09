import 'package:flutter/material.dart';

//3、图标字体
class IconExtension extends StatelessWidget {
  const IconExtension({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Icon字体图标和图片图标
    // 1.字体图标矢量图(放大的时候不会失真)
    // 2.字体图标可以设置颜色
    // 3.图标很多时, 占据空间更小
//    return Icon(Icons.pets, size: 300, color: Colors.orange,);
//    return Icon(IconData(0xe91d, fontFamily: 'MaterialIcons'), size: 300, color: Colors.orange,);
    // 1.0xe91d -> unicode编码
    // 2.设置对应的字体
    // return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"));

      return Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(MyIcons.book,color: Colors.purple),
                Icon(MyIcons.wechat,color: Colors.green),
              ],
            );
    }
}

class MyIcons{
  // book 图标
  static const IconData book =  IconData(
      0xe614,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
  // 微信图标
  static const IconData wechat = IconData(
      0xec7d,
      fontFamily: 'myIcon',
      matchTextDirection: true
  );
}

/*
fonts:
  - family: myIcon  #指定一个字体名
    fonts:
      - asset: fonts/iconfont.ttf
*/

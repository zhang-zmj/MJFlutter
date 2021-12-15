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
    return Text("\ue91d", style: TextStyle(fontSize: 100, color: Colors.orange, fontFamily: "MaterialIcons"));
  }
}






//2、图片的扩展
class ImageExtensionDemo extends StatelessWidget {
  const ImageExtensionDemo({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String imageURL;


  @override
  Widget build(BuildContext context) {
    // 1.占位图的问题: FadeInImage
    // 2.图片缓存: 1000张 100
    return FadeInImage(
        placeholder: AssetImage("assets/images/juren.jpeg"),
        image: NetworkImage(imageURL)
    );
  }
}




//1、button的相关扩展： * ElevatedButton.styleFrom    * ButtonStyle
class ButtonExtensionDemo extends StatelessWidget {
  const ButtonExtensionDemo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // 1.默认情况下Button上下有一定的间距
    // 2.Button变小: ButtonTheme
    // 3.取出Button的内边距
    return TextButton(
      child: Text( "你",   style: TextStyle(color: Colors.blue) ),
      onPressed: () {
        print("B");
      },
      style: ButtonStyle(
        //背景
        backgroundColor: MaterialStateProperty.all(Colors.red),
        //边框
        side: MaterialStateProperty.all(
          BorderSide(
              color: Colors.green, width: 3),
        ),
        //圆角
        shape: MaterialStateProperty.all(
            RoundedRectangleBorder(borderRadius:  BorderRadius.circular( 18.67))
        ),
        // minimumSize: MaterialStateProperty.all(Size(20, 10)),
        padding: MaterialStateProperty.all(EdgeInsets.fromLTRB(30, 30, 20, 20)),
      ),


    );
  }
}






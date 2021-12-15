import 'package:flutter/material.dart';

// StatefulWidget的生命周期
class ZMJHomeContent extends StatefulWidget {
  @override
  _ZMJHomeContentState createState() => _ZMJHomeContentState();
}

class _ZMJHomeContentState extends State<ZMJHomeContent> {

  @override
  Widget build(BuildContext context) {
    // return ImageDemo1(imageURL: "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg.jj20.com%2Fup%2Fallimg%2F1111%2F060QQ15355%2F1P60Q15355-4-1200.jpg&refer=http%3A%2F%2Fimg.jj20.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=jpeg?sec=1640686858&t=ebef3e4c9193be9b0fd44527d0e47179");
    return Image.asset("assets/images/juren.jpeg");
  }

}

class ImageDemo1 extends StatelessWidget {
  const ImageDemo1({
    Key? key,
    required this.imageURL,
  }) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {

    // Image.network(imageURL);
    return Image(
      color: Colors.green,
      //混合颜色模式
      colorBlendMode: BlendMode.colorDodge,
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      fit: BoxFit.cover,
      // alignment: Alignment.bottomCenter,
      //范围: -1 1
      alignment: Alignment(0, 0),
    );
  }
}


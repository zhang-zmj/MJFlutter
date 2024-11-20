import 'package:flutter/material.dart';

class MJImageDemo extends StatefulWidget {
  const MJImageDemo({super.key});

  @override
  State<MJImageDemo> createState() => _MJImageDemoState();
}

class _MJImageDemoState extends State<MJImageDemo> {
  @override
  Widget build(BuildContext context) {
    // final String imageURL = "https://q4.itc.cn/images01/20240319/344b2b2bac4247b1adde50640c2baddc.jpeg";
    // return ImageDemo1(imageURL: imageURL);

    // var image = const AssetImage("images/avatar.png");
    // var imageArray = [
    //   Image(
    //     image: image,
    //     height: 50.0,
    //     width: 100.0,
    //     fit: BoxFit.fill,
    //   ),
    //   Image(
    //     image: image,
    //     height: 50,
    //     width: 50.0,
    //     fit: BoxFit.contain,
    //   ),
    //   Image(
    //     image: image,
    //     width: 100.0,
    //     height: 50.0,
    //     fit: BoxFit.cover,
    //   ),
    //   Image(
    //     image: image,
    //     width: 100.0,
    //     height: 50.0,
    //     fit: BoxFit.fitWidth,
    //   ),
    //   Image(
    //     image: image,
    //     width: 100.0,
    //     height: 50.0,
    //     fit: BoxFit.fitHeight,
    //   ),
    //   Image(
    //     image: image,
    //     width: 100.0,
    //     height: 50.0,
    //     fit: BoxFit.scaleDown,
    //   ),
    //   Image(
    //     image: image,
    //     height: 50.0,
    //     width: 100.0,
    //     fit: BoxFit.none,
    //   ),
    //   Image(
    //     image: image,
    //     width: 100.0,
    //     color: Colors.blue,
    //     colorBlendMode: BlendMode.difference,
    //     fit: BoxFit.fill,
    //   ),
    //   Image(
    //     image: image,
    //     width: 100.0,
    //     height: 200.0,
    //     repeat: ImageRepeat.repeatY,
    //   )
    // ];

    // return SingleChildScrollView(
    //   child: Column(
    //     children: imageArray.map((e) {
    //       return Row(
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(16.0),
    //             child: SizedBox(
    //               width: 100,
    //               child: e,
    //             ),
    //           ),
    //           Text(e.fit.toString())
    //         ],
    //       );
    //     }).toList(),
    //   ),
    // );

    return Column(
      children: [
        Container(
          width: 200,
          height: 200,
          decoration: BoxDecoration(
            color: Colors.lightBlue,
            borderRadius: BorderRadius.circular(100),
            image: const DecorationImage(
              image: AssetImage("images/avatar.png"),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}

class ImageDemo1 extends StatelessWidget {
  final String imageURL;
  const ImageDemo1({super.key, required this.imageURL});

  @override
  Widget build(BuildContext context) {
    return Image(
      // color: Colors.green,
      //混合颜色模式
      colorBlendMode: BlendMode.colorDodge,
      image: NetworkImage(imageURL),
      width: 200,
      height: 200,
      fit: BoxFit.cover,
      // alignment: Alignment.bottomCenter,
      // alignment: const Alignment(0, 0), // 范围: -1 1
      repeat: ImageRepeat.repeat,
    );
  }
}

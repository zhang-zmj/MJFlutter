import 'package:flutter/material.dart';

class MJClipWidget extends StatefulWidget {
  const MJClipWidget({super.key});

  @override
  State<MJClipWidget> createState() => _MJClipWidgetState();
}

class _MJClipWidgetState extends State<MJClipWidget> {
  // 头像
  Widget avatar = Image.asset("images/avatar.png", width: 60.0);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          avatar, //不剪裁
          const SizedBox(height: 20),
          ClipOval(child: avatar), // 剪裁
          const SizedBox(height: 20),
          // 剪裁
          ClipRRect(
            borderRadius: BorderRadius.circular(5.0),
            child: avatar,
          ),
          const SizedBox(height: 20),
          // 剪裁
          ClipRect(
            child: avatar,
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                // widthFactor: .5, //宽度设为原来宽度一半，另一半会溢出
                child: avatar,
              ),
              const Text("你好世界", style: TextStyle(color: Colors.green))
            ],
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRect(
                //将溢出部分剪裁
                child: Align(
                  alignment: Alignment.topRight,
                  widthFactor: .5,
                  child: avatar,
                ),
              )
            ],
          ),
          const SizedBox(height: 35),
          DecoratedBox(
            decoration: const BoxDecoration(color: Colors.red),
            child: ClipRect(clipper: MyClipper(), child: avatar),
          ),
        ],
      ),
    );
  }
}

class MyClipper extends CustomClipper<Rect> {
  // getClip()是用于获取剪裁区域的接口
  @override
  Rect getClip(Size size) {
    return const Rect.fromLTWH(5, 5, 50, 50);
  }

  // 决定是否重新剪裁 : 如果在应用中，剪裁区域始终不会发生变化时应该返回false，
  // 这样就不会触发重新剪裁，避免不必要的性能开销。如果剪裁区域会发生变化（比如在对剪裁区域执行一个动画），
  // 那么变化后应该返回true来重新执行剪裁
  @override
  bool shouldReclip(covariant CustomClipper<Rect> oldClipper) {
    return false;
  }
}

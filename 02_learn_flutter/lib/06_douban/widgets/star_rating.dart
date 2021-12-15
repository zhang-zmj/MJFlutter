import 'package:flutter/material.dart';


class ZMJStarRating extends StatefulWidget {

  final double rating;
  final double maxRating;
  final int count;
  final double size;
  final Color unselectedColor;
  final Color selectedColor;

  final Widget unselectedImage;
  final Widget selectedImage;

  ZMJStarRating({
    Key? key,
    required this.rating,
    this.maxRating = 10,
    this.count = 5,
    this.size = 30,
    this.unselectedColor = const Color(0xffbbbbbb),
    this.selectedColor = const Color(0xffff0000),
    Widget? unselectedImage,
    Widget? selectedImage
  }) : unselectedImage = unselectedImage ?? Icon(Icons.star_border, color: unselectedColor, size: size),
        selectedImage = selectedImage ??  Icon(Icons.star, color: selectedColor, size: size), super(key: key);

  @override
  State<ZMJStarRating> createState() => _ZMJStarRatingState();
}

class _ZMJStarRatingState extends State<ZMJStarRating> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(mainAxisSize: MainAxisSize.min, children: buildUnselectedStar()),
        Row(mainAxisSize: MainAxisSize.min, children: buildSelectedStar())
      ],
    );
  }

  List<Widget> buildUnselectedStar() {
    return List.generate(widget.count, (index) {
      return widget.unselectedImage;
    });
  }

  List<Widget> buildSelectedStar() {

    //1、创建stars
    List<Widget> stars = [];
    final star = widget.selectedImage;

    //2、创建满填充的star
    double oneValue = widget.maxRating / widget.count;
    int entireCount = (widget.rating / oneValue).floor();
    for(var i = 0; i < entireCount; i++){
      stars.add(star);
    }

    //3、构建部分填充
    double leftWidth = ((widget.rating / oneValue) - entireCount) * widget.size;
    final halfStar = ClipRect(
        clipper: ZMJStarCliper(leftWidth),
        child: star
    );
    stars.add(halfStar);

    //4、超出范围的数量进行裁剪
    if (stars.length > widget.count) {
      return stars.sublist(0, widget.count);
    }

    return stars;
  }

}


class ZMJStarCliper extends CustomClipper<Rect>{
  double width;
  ZMJStarCliper(this.width);

  @override
  Rect getClip(Size size) {
    return Rect.fromLTRB(0, 0, width, size.height);
  }

  @override
  bool shouldReclip(ZMJStarCliper oldClipper) {
    return oldClipper.width != width;
  }

}





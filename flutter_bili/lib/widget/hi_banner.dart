import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bili/navigator/hi_navigator.dart';
import 'package:flutter_bili/model/news_model.dart';

class HiBanner extends StatelessWidget {

  final List<Items>? bannerList;
  final double bannerHeight;
  final EdgeInsetsGeometry? padding;

  const HiBanner(this.bannerList,
      {Key? key, this.bannerHeight = 160, this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: bannerHeight,
      child: _banner(),
    );
  }

  _banner() {

    var right = 10 + (padding?.horizontal ?? 0) / 2;
    final count = bannerList?.length ?? 0;
    return Swiper(
        itemBuilder:(BuildContext context, int index) {
          return _image(bannerList?[index]);
        },
        itemCount: count,
        autoplay: true,
          // 自定义指示器
        pagination: SwiperPagination(
            alignment: Alignment.bottomRight,
            margin: EdgeInsets.only(right: right, bottom: 10),
            builder: const DotSwiperPaginationBuilder(
                color: Colors.white60, size: 6, activeSize: 6)) ,
       );



  }

  _image(Items? item) {
    return InkWell(
      onTap: () {
        _handleClick(item);
      },
      child: Container(
        padding:  padding,
        child:  ClipRRect(
          borderRadius: const BorderRadius.all( Radius.circular(6)),
          child: Image.network(item?.cover?.first.path ?? "", fit: BoxFit.cover),
        )
      ),
    );
  }

  void _handleClick(Items? item){
      if( item?.type == "news"){
        HiNavigator.getInstance()?.onJumpTo(RouteStatus.detail, args: {"video": "111"});
      }else{
        print("-----------${item?.title}--");
      }

  }
}












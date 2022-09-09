import "package:flutter/material.dart";
import 'package:flutter_bili/http/dao/video_List_dao.dart';
import 'package:flutter_bili/model/video_list_model.dart';
import 'package:flutter_bili/widget/video_card.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:dio/dio.dart';
import 'dart:ui';

class VideoListPage extends StatefulWidget {
  const VideoListPage({Key? key}) : super(key: key);
  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> with AutomaticKeepAliveClientMixin {

  List<Items>? itemArray = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    _loadData(context);
  }

  @override
  Widget build(BuildContext context) {
    return MediaQuery.removePadding(context: context,
        removeTop: true,
        child: SingleChildScrollView(
          child: Container(
              padding: const EdgeInsets.all(10),
              child: MasonryGridView.count(
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                itemCount: itemArray?.length,
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return VideoCard(item: itemArray?[index]);
                },
              )
          ),
        ),
    );
  }

  void _loadData(context, {loadMore = false}) async {

    if (!loadMore) {
      page = 1;
    }
    int currentIndex = page + (loadMore ? 1 : 0);


    List<Items>? videoArray = [];
    try {

      double dpr = window.devicePixelRatio;
      double width = window.physicalSize.width / dpr;
      print("-----获取当前页数---$width----");
      VideoListModel  videoModel = await VideoListDao.getVideoListData(currentIndex);
      int count =  videoModel.items?.length ?? 0;
      for (int i = 0; i < count; i++) {
        Items? item = videoModel.items?[i];
        String cover = "${item?.cover?.first.path}@info";
        print("------$cover---");
        if (cover.contains("http") || cover.contains("https") ) {
          Response response = await Dio().get(cover);
          double height =  (width - 30) * (response.data["height"] / response.data["width"]);
          item?.imgHeight = height;
          videoArray.add(item!);
        }
      }
      setState(() {
        if (!loadMore) {
          if ( videoModel.items?.isNotEmpty ?? false) {
            itemArray = [...?itemArray, ...videoArray];
            page += 1;
          }
        }else{
          itemArray = videoArray;
        }
      });

    }catch (e){
      print("-----错误----$e");
    }

  }

  @override
  bool get wantKeepAlive => true;


}

import 'package:flutter/material.dart';
import 'package:flutter_bili/model/video_list_model.dart';
import 'package:flutter_bili/utils/format_util.dart';
import 'package:flutter_bili/utils/view_util.dart';
import 'package:transparent_image/transparent_image.dart';

class VideoCard extends StatelessWidget {
  final Items? item;
  const VideoCard({Key? key, required this.item}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: double.infinity
        ),
      child: InkWell(
          onTap: () {
            print("----------你好啊");
          },
          child: Container(
            color: Colors.grey[200],
            child: Column(
              children: [
                _itemImage(),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Text(item?.title ?? "",
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(fontSize: 12, color: Colors.black38),
                      maxLines: 2,
                      textAlign: TextAlign.start,
                  )
                ),
                _owner()
              ],
            ),
          )
      )
    );
  }
  _itemImage() {
      return Stack(
        children: [
          cachedImage(
            item?.cover?.first.path ?? "",
            height: item?.imgHeight,
          ),

          // FadeInImage.memoryNetwork(
          //     height: item?.imgHeight,
          //     placeholder: kTransparentImage,
          //     image: item?.cover?.first.path ?? "",
          //     fit: BoxFit.cover,
          // ),
          
          Positioned(
              left: 0,
              right: 0,
              bottom: 0,
              child:  Container(
                padding: const EdgeInsets.only(left: 8, right: 8, bottom: 3, top: 5),
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [Colors.black54,Colors.transparent]
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    _iconText(Icons.ondemand_video, item?.viewBaseNum),
                    _iconText(Icons.favorite_border, item?.live),
                    _iconText(null, item?.viewBaseNum)
                  ],
                ),
              )
          )
        ],
      );
  }

  _iconText(IconData? iconData, int? count){
    String views = "";
    if (iconData != null) {
      views = countFormat(count ?? 0);
    }else{
      views = durationTransform(item?.duration ?? 0);
    }
    return Row(
      children: [
        if (iconData != null)
          Icon(iconData, color: Colors.white,size: 12),
          Padding(
            padding: const EdgeInsets.only(left: 3),
            child: Text(views, style: const TextStyle(color: Colors.white, fontSize: 10))
          )
      ],
    );
  }

  _owner() {
    return Padding(
        padding: const EdgeInsets.only(top: 10),
        child: Row(
          children: [
            InkWell(
              onTap: (){

              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: SizedBox(
                  height: 24,
                  width: 24,
                  child: Image.network(item?.cover?.first?.path ?? "", fit: BoxFit.cover),
                ),
              ),
            ),
            Padding(
                padding: const EdgeInsets.only(left: 8),
              child: Text(
                item?.source ?? "",
                style: const TextStyle(fontSize: 11, color: Colors.black87),
              ),
            )
          ],
        ),
      );
    }

}










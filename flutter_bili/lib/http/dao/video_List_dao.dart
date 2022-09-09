import 'config.dart';
import 'package:flutter_bili/model/video_list_model.dart';

class VideoListDao {

  static getVideoListData(int page) async{

    BaseRequest request = VideoListRequest();

    print("------页数是多少-----$page--");
    String millis =  (DateTime.now().millisecondsSinceEpoch).toString();
    request.addHeader("timestamp", millis);
    request.add("appId", 1007).add("channelId", 1761).add("type", "menu")
        .add("page", "$page").add("platform", "IOS").add("appVersion", "2.4.1");

    var result = await HiNet.getInstance().fire(request);
    return VideoListModel.fromJson(result["data"]["block"][0]);

  }

}

import 'config.dart';
import 'package:flutter_bili/model/news_model.dart';

class NewsListDao {

  static getNewsListData() async{

    BaseRequest request = NewsListRequest();

    String millis =  (DateTime.now().millisecondsSinceEpoch).toString();
    request.addHeader("timestamp", millis);
    request.add("appId", 1007).add("channelId", 1734).add("type", "menu")
        .add("page", "1").add("platform", "IOS").add("appVersion", "2.4.1");

    var result = await HiNet.getInstance().fire(request);
    return NewsListModel.fromJson(result["data"]);
  }

}



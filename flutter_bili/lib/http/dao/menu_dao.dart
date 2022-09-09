import 'config.dart';
import 'package:flutter_bili/model/menu_model.dart';

class MenuDao {

  static getMenuListData() async {

    BaseRequest request = MenuRequest();
    String millis =  (DateTime.now().millisecondsSinceEpoch).toString();
    request.addHeader("timestamp", millis);
    request.add("appId", 1007).add("group", "home").add("platform", "IOS").add("appVersion", "2.4.1");
    var result = await HiNet.getInstance().fire(request);
    return MenuModel.fromJson(result);

  }


}
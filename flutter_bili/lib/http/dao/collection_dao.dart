import 'config.dart';

class CollectionDao {

  static getCollectionData() async{

    BaseRequest request = CollectionRequest();

    request.addHeader("Content-Type", "application/json")
    .addHeader("sessionId", "S1007381d77e7c90a580d9b64b43ff712339a");

    request.params = {
      "page": 1,
      "sourceId": 7,
      "limit": 20
    };
    var result = await HiNet.getInstance().fire(request);
    return result;

  }


}



import '../core/base_request.dart';

class CollectionRequest extends BaseRequest {

  @override
  HttpMethod httpMethod() {
    return HttpMethod.POST;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/api/activity/interact/getUserFavorites";
  }

}
import '../core/base_request.dart';

class MenuRequest extends BaseRequest {

  @override
  String authority() {
    return "proxy.cztvcloud.com";
  }
  @override
  HttpMethod httpMethod() {
    return HttpMethod.GET;
  }

  @override
  bool needLogin() {
    return false;
  }

  @override
  String path() {
    return "/api/fusion/channels/getMenuInfo";
  }

}
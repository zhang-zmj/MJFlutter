import '../core/base_request.dart';

class LoginRequest extends BaseRequest {

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
    return "/api/uc/captchaLogin";
  }

}
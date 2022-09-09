
enum HttpMethod { GET, POST, DELETE }


///基础请求
abstract class BaseRequest {

  dynamic pathParams;
  var useHttps = true;

  String authority() {
    return "p.cztv.com";
  }

  HttpMethod httpMethod();

  String path();

  String url() {
    Uri uri;
    var pathStr = path();
    //拼接path参数
    if (pathParams != null && httpMethod() != HttpMethod.POST) {
      if (path().endsWith("/")) {
        pathStr = "${path()}$pathParams";
      } else {
        pathStr = "${path()}/$pathParams";
      }
    }
    //http和https切换
    if (useHttps) {
      if (httpMethod() == HttpMethod.POST) {
      uri = Uri.https(authority(), pathStr);
      }else{
      uri = Uri.https(authority(), pathStr, params);
      }
    } else {
      if (httpMethod() == HttpMethod.POST) {
      uri = Uri.http(authority(), pathStr);
      }else{
      uri = Uri.http(authority(), pathStr, params);
      }
    }
    print('url:${uri.toString()}');
    return uri.toString();
  }

  bool needLogin();

  Map<String, dynamic> params = {};

  ///添加参数
  BaseRequest add(String k, Object v) {
    params[k] = v.toString();
    return this;
  }

  Map<String, dynamic> header = {};

  ///添加header
  BaseRequest addHeader(String k, Object v) {
    header[k] = v.toString();
    return this;
  }
}

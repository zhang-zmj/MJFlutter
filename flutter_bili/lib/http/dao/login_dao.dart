import 'config.dart';

class LoginDao {

  static String saveUser = "Save_User_Model";

  static login(String userName, String password){
    return _send(userName, password);
  }

  static registration(String userName, String password, String imoocId, String orderId){
    return  _send(userName, password, imoocId: imoocId, orderId: orderId);
   }

   static _send(String userName, String password, {String? imoocId, String? orderId}) async {

    BaseRequest request;
    if(imoocId != null && orderId != null) {
      request = RegisterRequest();
    }else{
      request = LoginRequest();
    }

    request.addHeader("Content-Type", "application/json");
    Map<String, dynamic> params = {
      'mobile': userName,
      'verifyCode': password,
      'sourceId': 7,
      "isThird": "false"
    };

    request.params = getParamsMd5WithSort(params);
    var result = await HiNet.getInstance().fire(request);
    if (result['code'] == "200" && result['data'] != null) {
       LocalStorage.getInstance().setLocalStorage(saveUser, result['data']);
    }
    return result;

   }

/*
   sessionId: S10073864dacb19985906aacc0c261d12d102,
	 userId: 22611529,
	 nickName: 133 ** ** 8086,
	 avatar: http: //i1.letvimg.com/img/201207/30/tx298.png,
   isBindMobile: 1,
   sourceId: 7,
   usedInvitationCode: 0,
   isNew: 0,
   email: ,
   mobile: 13325718086,
   isEditor: 0,
   uuid: ed527a32041e598ca4807e1db3012428,
   status: 1
*/

  static getBoardingPass()   {
    return  LocalStorage.getInstance().getLocalStorage(saveUser);
  }

}
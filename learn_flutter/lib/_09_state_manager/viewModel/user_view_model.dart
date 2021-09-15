import 'package:flutter/material.dart';
import '../model/user_info.dart';

class HYUserViewModel extends ChangeNotifier {
  UserInfo _user;

  HYUserViewModel(this._user);

  UserInfo get user => _user;

  set user(UserInfo value) {
    _user = value;
    notifyListeners();
  }
}



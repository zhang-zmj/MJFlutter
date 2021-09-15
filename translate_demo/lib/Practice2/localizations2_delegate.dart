import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'localizations2.dart';

class ZMJLocalizations2Delegate extends LocalizationsDelegate<ZMJLocalizations2> {
  static ZMJLocalizations2Delegate delegate = ZMJLocalizations2Delegate();

  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ZMJLocalizations2> old) {
    return false;
  }

  @override
  Future<ZMJLocalizations2> load(Locale locale) async {
    final localizations = ZMJLocalizations2(locale);
    await localizations.loadJson();
    return localizations;
  }

}








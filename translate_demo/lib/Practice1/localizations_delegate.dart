import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'localizations.dart';

class ZMJLocalizationsDelegate extends LocalizationsDelegate<ZMJLocalizations> {
  static ZMJLocalizationsDelegate delegate = ZMJLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    return ["zh", "en"].contains(locale.languageCode);
  }

  @override
  bool shouldReload(LocalizationsDelegate<ZMJLocalizations> old) {
    return false;
  }

  @override
  Future<ZMJLocalizations> load(Locale locale) async {
    return SynchronousFuture( ZMJLocalizations(locale));
  }

}




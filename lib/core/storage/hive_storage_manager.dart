import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

import '../../domain/entities/auth_entity.dart';
import '../constants/app_constants.dart';
import '../constants/localization_constants.dart';

class HiveStorageManager {

  final _box = Hive.box(storagePref);

  static const languageCode = 'languageCode';

  set auth(AuthEntity? auth) {

    if(auth == null) {
      _box.deleteAt(0);
    }
    else {
      auth.save();
    }
  }

  AuthEntity? get auth {
    return _box.getAt(0);
  }

  set locale(Locale? locale) {

    if(locale == null) {
      _box.delete(languageCode);
    }
    else {
      _box.put(languageCode, '${locale.languageCode}_${locale.countryCode}');
    }
  }

  Locale get locale {

    var mLanguageCode = _box.get(languageCode);

    if(mLanguageCode == null) {
      return localeEnglish;
    }

    var results = appLocales.where((item) => '${item.locale.languageCode}_${item.locale.countryCode}' == mLanguageCode);

    if(results.isEmpty) {
      return localeEnglish;
    }

    return results.first.locale;
  }
}
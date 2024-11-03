import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/constants/localization_constants.dart';
import '../../../core/storage/hive_storage_manager.dart';

class LocalizationCubit extends Cubit<Locale> {

  final HiveStorageManager _storageManager;

  LocalizationCubit(this._storageManager) : super(localeEnglish);

  void initLocale() => updateLocale(_storageManager.locale);

  void updateLocale(Locale? locale) {
    _storageManager.locale = locale;
    emit(_storageManager.locale);
  }
}

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'core/constants/app_constants.dart';
import 'core/constants/localization_constants.dart';
import 'presentation/app.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await dotenv.load(fileName: kDebugMode ? envDevelopment : envProduction);

  await Hive.initFlutter();
  await Hive.openBox(storagePref);

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((_) {
    runApp(
      EasyLocalization(
        supportedLocales: appLocales.map((item) => item.locale).toList(),
        path: localizationAssetPath,
        startLocale: localeEnglish,
        fallbackLocale: localeEnglish,
        child: const MyApp()
    ));
  });
}

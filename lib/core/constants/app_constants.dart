import 'package:flutter_dotenv/flutter_dotenv.dart';

const String envDevelopment = '.env.development';
const String envProduction = '.env.production';

const String localizationAssetPath = 'lib/core/localization/translations';

final String storagePref = dotenv.env['STORAGE_PREF']!;
final String appTitle = dotenv.env['APP_TITLE']!;
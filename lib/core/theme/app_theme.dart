import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constants/colors_constants.dart';
import '../styles/text_styles.dart';

class AppTheme {

  AppTheme._();

  static ThemeData get light => ThemeData(
    brightness: Brightness.light,
    primaryColor: primary,
    colorScheme: const ColorScheme.light().copyWith(
      primary: primary,
      secondary: accent,
      background: lightBackground,
    ),
    scaffoldBackgroundColor: lightBackground,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
    ),
    focusColor: primary,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey[100],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: primary,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: white,
      headerBackgroundColor: primary,
      headerForegroundColor: white,
      dividerColor: Colors.transparent,
      dayStyle: TextStyles.titleStyle,
      yearStyle: TextStyles.titleStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );


  static ThemeData get dark => ThemeData(
    brightness: Brightness.dark,
    primaryColor: primary,
    colorScheme: const ColorScheme.dark().copyWith(
      primary: primary,
      secondary: accent,
      background: darkBackground,
    ),
    scaffoldBackgroundColor: darkBackground,
    textSelectionTheme: const TextSelectionThemeData(
      cursorColor: primary,
    ),
    focusColor: primary,
    appBarTheme: AppBarTheme(
      elevation: 2,
      backgroundColor: Colors.white,
      shadowColor: Colors.grey[100],
      systemOverlayStyle: const SystemUiOverlayStyle(
        statusBarBrightness: Brightness.dark,
      ),
      iconTheme: const IconThemeData(
        color: primary,
      ),
      centerTitle: true,
      titleTextStyle: TextStyles.appbarTitleStyle,
    ),
    datePickerTheme: DatePickerThemeData(
      backgroundColor: white,
      headerBackgroundColor: primary,
      headerForegroundColor: white,
      dividerColor: Colors.transparent,
      dayStyle: TextStyles.titleStyle,
      yearStyle: TextStyles.titleStyle,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5),
      ),
    ),
  );
}
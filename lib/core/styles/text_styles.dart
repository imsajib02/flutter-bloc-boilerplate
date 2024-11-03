import 'package:flutter/material.dart';

import '../constants/colors_constants.dart';

class TextStyles {

  TextStyles._();

  static TextStyle get appbarTitleStyle => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 16.5,
  );

  static TextStyle get errorStyle => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 13,
    letterSpacing: 0.2,
    color: redOrange,
  );

  static TextStyle get alertStyle => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
    letterSpacing: 0.1,
    height: 1.5,
    color: black,
    decoration: TextDecoration.none,
  );

  static TextStyle get buttonTextStyle => const TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 15,
    color: white,
  );

  static TextStyle get titleStyle => const TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 13,
  );
}
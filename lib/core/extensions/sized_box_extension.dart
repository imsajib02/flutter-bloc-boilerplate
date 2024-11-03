import 'package:flutter/cupertino.dart';

extension SizedboxExtension on int {

  SizedBox get h => SizedBox(height: toDouble());
  SizedBox get w => SizedBox(width: toDouble());
}
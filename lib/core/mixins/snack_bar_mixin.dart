import 'package:flutter/material.dart';

import '../../core/extensions/sized_box_extension.dart';
import '../constants/global_keys.dart';
import '../styles/text_styles.dart';
import '../constants/colors_constants.dart';

mixin SnackBarMixin {

  void displaySnackBar({required String title, required String message, bool isError = false}) {

    scaffoldMessengerKey.currentState?..clearSnackBars()..showSnackBar(
      SnackBar(
        backgroundColor: black,
        behavior: SnackBarBehavior.floating,
        margin: const EdgeInsets.all(15),
        duration: const Duration(milliseconds: 3500),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        content: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            Text(title,
              style: TextStyles.errorStyle.copyWith(
                fontSize: 14,
                color: !isError ? white : red,
              ),
            ),

            2.h,

            Text(message,
              style: TextStyles.alertStyle.copyWith(
                fontSize: 11,
                color: white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
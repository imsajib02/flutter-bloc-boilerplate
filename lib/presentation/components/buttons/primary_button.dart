import 'package:flutter/material.dart';

import '../../../core/styles/text_styles.dart';

class PrimaryButton extends StatelessWidget {

  final String buttonText;
  final Function() onTap;
  final Color? backgroundColor;
  final Color? textColor;

  const PrimaryButton({Key? key, required this.buttonText, required this.onTap, this.backgroundColor, this.textColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ElevatedButton(
      onPressed: onTap,
      style: ButtonStyle(
        elevation: MaterialStateProperty.all(2),
        shape: MaterialStateProperty.all(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        )),
        backgroundColor: MaterialStateProperty.all(backgroundColor ?? Colors.black),
        padding: MaterialStateProperty.all(const EdgeInsets.symmetric(
          horizontal: 70,
          vertical: 12,
        )),
      ),
      child: Text(buttonText,
        style: TextStyles.buttonTextStyle.copyWith(
          color: textColor,
        ),
      ),
    );
  }
}

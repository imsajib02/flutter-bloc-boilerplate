import 'package:flutter/material.dart';

import '../../../core/constants/colors_constants.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {

  final String title;
  final bool? backButtonEnabled;
  final List<Widget>? actions;
  final Function() onBackPressed;

  const MyAppBar({Key? key, required this.title, this.backButtonEnabled = true, this.actions, required this.onBackPressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      elevation: 0,
      toolbarHeight: 56,
      automaticallyImplyLeading: false,
      backgroundColor: Theme.of(context).primaryColor,
      leading: !backButtonEnabled! ? null : GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: onBackPressed,
        child: Container(
          margin: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: white, width: .8),
          ),
          child: const Icon(Icons.arrow_back_ios_rounded, color: white, size: 14),
        ),
      ),
      title: Text(title),
      titleSpacing: 0,
      centerTitle: true,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size(double.maxFinite, 56);
}

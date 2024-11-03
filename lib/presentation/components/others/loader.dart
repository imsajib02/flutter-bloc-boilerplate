import 'package:flutter/material.dart';

class Loader extends StatelessWidget {

  final double containerSize = 100;

  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return const Center(
      child: CircularProgressIndicator(),
    );
  }
}

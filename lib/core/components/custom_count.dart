import 'package:flutter/material.dart';

import '../constant/style_manger.dart';

class CustomCount extends StatelessWidget {
  const CustomCount({super.key, required this.count});
  final int count;
  @override
  Widget build(BuildContext context) {
    return Text(
      "$count",
      style: StyleManger.textStyle16.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

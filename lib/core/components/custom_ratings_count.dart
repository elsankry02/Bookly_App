import 'package:flutter/material.dart';

import '../constant/style_manger.dart';

class CustomCount extends StatelessWidget {
  const CustomCount({super.key, required this.ratingsCount});
  final int ratingsCount;
  @override
  Widget build(BuildContext context) {
    return Text(
      //! ratings Count
      "$ratingsCount",
      style: StyleManger.textStyle16.copyWith(fontWeight: FontWeight.w600),
    );
  }
}

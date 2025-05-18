import 'package:bookly_app/constant/style_manger.dart';
import 'package:flutter/material.dart';

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

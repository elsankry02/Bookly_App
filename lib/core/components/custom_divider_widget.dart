import 'package:bookly_app/core/constant/color_manger.dart';
import 'package:flutter/material.dart';

class CustomDividerWidget extends StatelessWidget {
  const CustomDividerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.5,
      height: 40,
      color: ColorManger.kSecond,
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}

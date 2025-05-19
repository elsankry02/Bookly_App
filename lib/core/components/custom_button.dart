import 'package:flutter/material.dart';

import '../constant/style_manger.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    required this.titel,
    required this.titelColor,
    required this.borderRadius,
    required this.backgroundColor,
    this.titelFontSize,
    this.onPressed,
  });
  final String titel;
  final Color titelColor;
  final double? titelFontSize;
  final Color backgroundColor;
  final BorderRadius borderRadius;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          backgroundColor: backgroundColor,
          shape: RoundedRectangleBorder(borderRadius: borderRadius),
        ),
        child: Text(
          titel,
          style: StyleManger.textStyle22.copyWith(
            color: titelColor,
            fontSize: titelFontSize,
          ),
        ),
      ),
    );
  }
}

import 'package:flutter/material.dart';

import '../utils/style_manger.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPressed,
    required this.backgroundColor,
    required this.textColor,
    required this.borderRadius,
    required this.text,
    this.fontSize,
  });
  final void Function()? onPressed;
  final Color backgroundColor;
  final Color textColor;
  final BorderRadius borderRadius;
  final String text;
  final double? fontSize;
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
          text,
          style: StyleManger.textStyle18.copyWith(
            color: textColor,
            fontWeight: FontWeight.w900,
            fontSize: fontSize,
          ),
        ),
      ),
    );
  }
}

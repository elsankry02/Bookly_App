import 'package:bookly_app/constant/color_manger.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/style_manger.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.rating,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num rating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        Text(rating.toString(), style: StyleManger.textStyle16),
        const SizedBox(width: 6.3),
        Icon(FontAwesomeIcons.solidStar, color: ColorManger.kStar, size: 14),
      ],
    );
  }
}

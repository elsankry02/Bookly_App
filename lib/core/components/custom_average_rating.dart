import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../constant/color_manger.dart';
import '../constant/style_manger.dart';

class CustomRating extends StatelessWidget {
  const CustomRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.averageRating,
  });
  final MainAxisAlignment mainAxisAlignment;
  final num averageRating;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        //! averageRating
        Text(averageRating.toString(), style: StyleManger.textStyle16),
        const SizedBox(width: 6.3),
        //! Star Icon
        Icon(FontAwesomeIcons.solidStar, color: ColorManger.kStar, size: 14),
      ],
    );
  }
}

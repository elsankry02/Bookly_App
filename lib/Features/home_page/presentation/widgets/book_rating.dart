import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../../core/utils/style_manger.dart';

class BookRating extends StatelessWidget {
  const BookRating({
    super.key,
    this.mainAxisAlignment = MainAxisAlignment.start,
    required this.count,
    required this.rating,
  });
  final MainAxisAlignment mainAxisAlignment;
  final int count;
  final num rating;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: mainAxisAlignment,
      children: [
        const Icon(
          FontAwesomeIcons.solidStar,
          color: Color(0xffFFDD4F),
          size: 14,
        ),
        const SizedBox(width: 6.3),
        Text(rating.toString(), style: StyleManger.textStyle16),
        const SizedBox(width: 5),
        Opacity(
          opacity: .5,
          child: Text(
            "($count)",
            style: StyleManger.textStyle14.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}

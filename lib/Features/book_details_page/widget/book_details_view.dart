import 'package:bookly_app/core/components/custom_divider_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/components/custom_average_rating.dart';
import '../../../core/components/custom_ratings_count.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/constant/string_manger.dart';
import '../../../core/constant/style_manger.dart';
import '../../../data/models/book_model/book_model.dart';

class BookDetailsView extends StatelessWidget {
  const BookDetailsView({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Row(
              children: [
                //! Rating
                CustomRating(
                  averageRating:
                      bookModel.volumeInfo.averageRating?.round() ?? 4.5,
                ),
              ],
            ),
            //! rating
            buildBookDetailsText(name: StringManger.krating),
          ],
        ),
        //! Divider
        CustomDividerWidget(),
        Column(
          children: [
            Text(
              "${bookModel.volumeInfo.pageCount}",

              style: StyleManger.textStyle18.copyWith(
                color: ColorManger.kWhite,
              ),
            ),
            //! Pages
            buildBookDetailsText(name: StringManger.kpages),
          ],
        ),
        //! Divider
        CustomDividerWidget(),
        Column(
          children: [
            Row(
              children: [
                //! ratingsCount
                CustomCount(
                  ratingsCount:
                      bookModel.volumeInfo.ratingsCount?.round() ?? 120,
                ),
              ],
            ),
            //! rating
            buildBookDetailsText(name: StringManger.kCount),
          ],
        ),
      ],
    );
  }

  Text buildBookDetailsText({required String name}) {
    return Text(
      name,
      textAlign: TextAlign.center,
      style: StyleManger.textStyle16.copyWith(color: ColorManger.kSecond),
    );
  }
}

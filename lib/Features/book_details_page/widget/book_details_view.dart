import '../../../components/custom_count.dart';
import '../../../components/custom_rating.dart';
import '../../../constant/color_manger.dart';
import '../../../constant/string_manger.dart';
import '../../../constant/style_manger.dart';
import '../../../models/book_model/book_model.dart';
import 'package:flutter/material.dart';

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
                  rating: bookModel.volumeInfo.averageRating?.round() ?? 4.5,
                ),
              ],
            ),
            //! rating
            Text(
              StringManger.krating,
              textAlign: TextAlign.center,
              style: StyleManger.textStyle16.copyWith(
                color: ColorManger.kSecond,
              ),
            ),
          ],
        ),
        //! Devider
        Container(
          width: 1.5,
          height: 40,
          color: ColorManger.kSecond,
          margin: const EdgeInsets.symmetric(horizontal: 12),
        ),
        Column(
          children: [
            Text(
              " ${bookModel.volumeInfo.pageCount}",

              style: StyleManger.textStyle18.copyWith(
                color: ColorManger.kWhite,
              ),
            ),
            //! Pages
            Text(
              StringManger.kpages,
              textAlign: TextAlign.center,
              style: StyleManger.textStyle16.copyWith(
                color: ColorManger.kSecond,
              ),
            ),
          ],
        ),
        //! Devider
        Container(
          width: 1.5,
          height: 40,
          color: ColorManger.kSecond,
          margin: const EdgeInsets.symmetric(horizontal: 12),
        ),
        Column(
          children: [
            Row(
              children: [
                //! Count
                CustomCount(
                  count: bookModel.volumeInfo.ratingsCount?.round() ?? 120,
                ),
              ],
            ),
            //! rating
            Text(
              StringManger.kCount,
              textAlign: TextAlign.center,
              style: StyleManger.textStyle16.copyWith(
                color: ColorManger.kSecond,
              ),
            ),
          ],
        ),
      ],
    );
  }
}

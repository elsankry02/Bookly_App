import 'package:bookly_app/components/custom_rating.dart';
import 'package:bookly_app/constant/color_manger.dart';
import 'package:bookly_app/constant/string_manger.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_book_image.dart';
import '../../../constant/style_manger.dart';
import '../../../models/book_model/book_model.dart';
import 'books_action_buttons.dart';

class BookDetailViewWidget extends StatelessWidget {
  const BookDetailViewWidget({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.20),
          child: CustomBookImage(
            imageUrl: bookModel.volumeInfo.imageLinks?.thumbnail ?? "",
          ),
        ),
        const SizedBox(height: 36),

        //! Book Details Titel
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: StyleManger.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        //
        const SizedBox(height: 6),
        //
        Opacity(
          opacity: .7,
          //! Book Details subTitel
          child: Text(
            textAlign: TextAlign.center,
            bookModel.volumeInfo.authors?[0] ??
                bookModel.volumeInfo.authors![1],
            style: StyleManger.textStyle18.copyWith(color: ColorManger.kSecond),
          ),
        ),
        const SizedBox(height: 20),

        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                Row(
                  children: [
                    CustomRating(
                      rating:
                          bookModel.volumeInfo.averageRating?.round() ?? 4.5,
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
          ],
        ),

        const SizedBox(height: 37),
        BookActionButtons(bookModel: bookModel),
      ],
    );
  }
}

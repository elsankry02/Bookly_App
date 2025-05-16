import 'package:flutter/material.dart';

import '../../../../core/utils/app_styles.dart';
import '../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';
import '../../../../core/components/custom_book_image.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.18),
          child: CustomBookImage(
            imageUrl:
                bookModel.volumeInfo.imageLinks?.thumbnail ??
                "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQXcDlHNozqv7pTHrrHPQxnpzr11SHatJoolvMV0IHZxEgfEu3I",
          ),
        ),
        const SizedBox(height: 36),
        Text(
          bookModel.volumeInfo.title!,
          textAlign: TextAlign.center,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: .7,
          child: Text(
            textAlign: TextAlign.center,
            bookModel.volumeInfo.authors?[0] ??
                bookModel.volumeInfo.authors![1],
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(height: 18),
        BookRating(
          count: bookModel.volumeInfo.ratingsCount ?? 0,
          rating: bookModel.volumeInfo.averageRating?.round() ?? 0,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(bookModel: bookModel),
      ],
    );
  }
}

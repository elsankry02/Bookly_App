import 'package:flutter/material.dart';

import '../../../../components/custom_book_image.dart';
import '../../../../constant/style_manger.dart';
import '../../data/models/book_model/book_model.dart';
import 'book_rating.dart';
import 'books_action.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({super.key, required this.bookModel});
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
        //
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
          child: Text(
            textAlign: TextAlign.center,
            bookModel.volumeInfo.authors?[0] ??
                bookModel.volumeInfo.authors![1],
            style: StyleManger.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        //
        const SizedBox(height: 18),
        //
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

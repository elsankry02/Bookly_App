import 'package:flutter/material.dart';

import '../../../../core/components/custom_book_image.dart';
import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/style_manger.dart';
import '../../../home_page/data/book_model/book_model.dart';
import 'book_details_view.dart';
import 'books_action_buttons.dart';

class BookDetailsDisplay extends StatelessWidget {
  const BookDetailsDisplay({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.20),
          //! image
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
        //! Book Details View
        BookDetailsView(bookModel: bookModel),
        const SizedBox(height: 37),
        //! Book Action Buttons
        BookActionButtons(bookModel: bookModel),
      ],
    );
  }
}

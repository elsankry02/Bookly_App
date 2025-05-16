import 'package:flutter/material.dart';

import '../../../../core/Function/custom_url_launch.dart';
import '../../../../core/widgets/custom_button.dart';
import '../../data/models/book_model/book_model.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          Expanded(
            child: CustomButton(
              onPressed: () async {
                openInChrome(
                  context,
                  "${bookModel.saleInfo?.buyLink ?? bookModel.volumeInfo.previewLink}",
                );
              },
              text: "Free",
              backgroundColor: Colors.white,
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
              ),
              textColor: Colors.black,
            ),
          ),
          //!
          Expanded(
            child: CustomButton(
              onPressed: () async {
                openInChrome(context, "${bookModel.volumeInfo.previewLink}");
              },
              text: getText(bookModel),
              backgroundColor: const Color(0xffEF8262),
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(16),
              ),
              textColor: Colors.white,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }

  String getText(BookModel bookModel) {
    if (bookModel.volumeInfo.previewLink == null) {
      return "Not Avaliable";
    } else {
      return "Preview";
    }
  }
}

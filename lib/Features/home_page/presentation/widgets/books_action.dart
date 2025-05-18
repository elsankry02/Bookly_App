import 'package:flutter/material.dart';

import '../../../../core/Function/open_in_chrome.dart';
import '../../../../components/custom_button.dart';
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
                bottomLeft: Radius.circular(22),
              ),
              textColor: Color(0xffEF8262),
              fontSize: 20,
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
                topRight: Radius.circular(22),
              ),
              textColor: Colors.white,
              fontSize: 20,
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

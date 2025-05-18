import '../../../constant/color_manger.dart';
import '../../../constant/string_manger.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_button.dart';
import '../../../core/Function/open_in_chrome.dart';
import '../../../models/book_model/book_model.dart';

class BookActionButtons extends StatelessWidget {
  const BookActionButtons({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! Free
        Expanded(
          child: CustomButton(
            onPressed: () async {
              // openInChrome
              openInChrome(
                context,
                "${bookModel.saleInfo?.buyLink ?? bookModel.volumeInfo.previewLink}",
              );
            },
            text: StringManger.kFree,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
            ),
            textColor: ColorManger.kFree,
            fontSize: 20,
          ),
        ),
        //! Preview
        Expanded(
          child: CustomButton(
            onPressed: () async {
              // openInChrome
              openInChrome(context, "${bookModel.volumeInfo.previewLink}");
            },
            text: getText(bookModel),
            backgroundColor: ColorManger.kPreview,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
            ),
            textColor: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
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

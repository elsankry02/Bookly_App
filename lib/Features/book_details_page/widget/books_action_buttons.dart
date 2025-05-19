import 'package:flutter/material.dart';

import '../../../core/Function/open_in_chrome.dart';
import '../../../core/components/custom_button.dart';
import '../../../core/constant/color_manger.dart';
import '../../../core/constant/string_manger.dart';
import '../../../data/models/book_model/book_model.dart';

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
            titel: StringManger.kFree,
            backgroundColor: Colors.white,
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(25),
            ),
            titelColor: ColorManger.kFree,
            titelFontSize: 20,
          ),
        ),
        //! Preview
        Expanded(
          child: CustomButton(
            onPressed: () async {
              // openInChrome
              openInChrome(context, "${bookModel.volumeInfo.previewLink}");
            },
            titel: getText(bookModel),
            backgroundColor: ColorManger.kPreview,
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(25),
            ),
            titelColor: Colors.white,
            titelFontSize: 20,
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

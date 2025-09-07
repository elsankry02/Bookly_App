import 'package:flutter/material.dart';

import '../../../../core/components/custom_average_rating.dart';
import '../../../../core/components/custom_book_image.dart';
import '../../../../core/constant/string_manger.dart';
import '../../../../core/constant/style_manger.dart';
import '../../../data/book_model/book_model.dart';

class DetailsBookWidget extends StatelessWidget {
  const DetailsBookWidget({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomBookImage(
          //! image
          imageUrl:
              bookModel.volumeInfo.imageLinks?.thumbnail ?? "Unknown Image",
        ),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //! titel
              Text(
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                bookModel.volumeInfo.title ?? 'No Title',
                style: StyleManger.textStyle20.copyWith(
                  fontFamily: StringManger.kGtSectraFine,
                ),
              ),
              const SizedBox(height: 3),
              //! subTitel
              Text(
                maxLines: 2,
                style: StyleManger.textStyle14,
                (bookModel.volumeInfo.authors != null &&
                        bookModel.volumeInfo.authors!.isNotEmpty)
                    ? bookModel.volumeInfo.authors!.first
                    : 'Unknown Author',
              ),
              const SizedBox(height: 3),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! Free
                    Text(
                      StringManger.kFree,
                      style: StyleManger.textStyle14.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    //! averageRating
                    CustomRating(
                      averageRating:
                          bookModel.volumeInfo.averageRating?.round() ?? 0,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

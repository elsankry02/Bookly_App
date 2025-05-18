import 'package:bookly_app/components/custom_book_image.dart';
import 'package:bookly_app/components/custom_rating.dart';
import 'package:bookly_app/constant/string_manger.dart';
import 'package:bookly_app/constant/style_manger.dart';
import 'package:bookly_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';

class DetailsBookWidget extends StatelessWidget {
  const DetailsBookWidget({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        //! image
        CustomBookImage(
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
                bookModel.volumeInfo.title ?? 'No Title',
                style: StyleManger.textStyle20.copyWith(
                  fontFamily: StringManger.kGtSectraFine,
                ),
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 3),
              //! subTitel
              Text(
                (bookModel.volumeInfo.authors != null &&
                        bookModel.volumeInfo.authors!.isNotEmpty)
                    ? bookModel.volumeInfo.authors!.first
                    : 'Unknown Author',
                maxLines: 2,
                style: StyleManger.textStyle14,
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
                    //! rating
                    CustomRating(
                      rating:
                          bookModel.volumeInfo.averageRating?.round() ?? 4.5,
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

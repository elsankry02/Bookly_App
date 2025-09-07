import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/components/custom_average_rating.dart';
import '../../../core/components/custom_book_image.dart';
import '../../../core/constant/string_manger.dart';
import '../../../core/constant/style_manger.dart';
import '../../../core/routes/app_routes.dart';
import '../../data/book_model/book_model.dart';

class NewestBookPage extends StatelessWidget {
  const NewestBookPage({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(18),
      onTap: () {
        GoRouter.of(context).push(AppRouter.kDetailseView, extra: bookModel);
      },
      child: SizedBox(
        height: 120,
        child: Row(
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
                  //! Titel
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
                    maxLines: 1,
                    style: StyleManger.textStyle14,
                  ),
                  Spacer(),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //! free
                        Text(
                          StringManger.kFree,
                          style: StyleManger.textStyle14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        //! Book Rating
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
        ),
      ),
    );
  }
}

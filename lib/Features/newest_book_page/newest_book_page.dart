import 'package:bookly_app/constant/string_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../components/custom_book_image.dart';
import '../../components/custom_rating.dart';
import '../../constant/style_manger.dart';
import '../../core/routes/app_routes.dart';
import '../../models/book_model/book_model.dart';

class NewestBookPage extends StatelessWidget {
  const NewestBookPage({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
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
                  const SizedBox(height: 3),
                  Expanded(
                    child: Row(
                      children: [
                        //! free
                        Text(
                          StringManger.kFree,
                          style: StyleManger.textStyle14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        //! Book Rating
                        CustomRating(
                          rating:
                              bookModel.volumeInfo.averageRating?.round() ??
                              4.5,
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

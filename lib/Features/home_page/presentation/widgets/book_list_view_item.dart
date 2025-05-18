import 'package:bookly_app/constant/string_manger.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../components/custom_book_image.dart';
import '../../../../core/routes/app_routes.dart';
import '../../../../constant/style_manger.dart';
import '../../data/models/book_model/book_model.dart';
import 'book_rating.dart';

class BookListViewItem extends StatelessWidget {
  const BookListViewItem({super.key, required this.bookModel});
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
            CustomBookImage(
              imageUrl:
                  bookModel.volumeInfo.imageLinks?.thumbnail ?? "Unknown Image",
            ),
            const SizedBox(width: 15),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    bookModel.volumeInfo.title ?? 'No Title',
                    style: StyleManger.textStyle20.copyWith(
                      fontFamily: StringManger.kGtSectraFine,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 3),
                  Text(
                    (bookModel.volumeInfo.authors != null &&
                            bookModel.volumeInfo.authors!.isNotEmpty)
                        ? bookModel.volumeInfo.authors!.first
                        : 'Unknown Author',
                    style: StyleManger.textStyle14,
                  ),
                  const SizedBox(height: 3),
                  Expanded(
                    child: Row(
                      children: [
                        Text(
                          'Free',
                          style: StyleManger.textStyle14.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const Spacer(),
                        BookRating(
                          rating:
                              bookModel.volumeInfo.averageRating?.round() ?? 0,
                          count: bookModel.volumeInfo.ratingsCount ?? 0,
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

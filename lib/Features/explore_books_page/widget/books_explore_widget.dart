import 'package:bookly_app/Features/explore_books_page/widget/details_book_widget.dart';
import 'package:bookly_app/core/routes/app_routes.dart';
import 'package:bookly_app/models/book_model/book_model.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BooksExplorerWidget extends StatelessWidget {
  const BooksExplorerWidget({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: GestureDetector(
        onTap: () {
          GoRouter.of(context).push(AppRouter.kDetailseView, extra: book);
        },
        child: SizedBox(
          height: 120,
          //! Explore Books Widget
          child: DetailsBookWidget(bookModel: book),
        ),
      ),
    );
  }
}

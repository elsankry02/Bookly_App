import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../core/routes/app_routes.dart';
import '../../../data/models/book_model/book_model.dart';
import 'details_book_widget.dart';

class BooksExplorerWidget extends StatelessWidget {
  const BooksExplorerWidget({super.key, required this.book});

  final BookModel book;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: InkWell(
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

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../core/components/custom_book_app_bar_details.dart';
import '../../data/models/book_model/book_model.dart';
import 'books_details_section.dart';
import 'similar_books_section.dart';

class BookDetailsViewBody extends StatelessWidget {
  const BookDetailsViewBody({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        SliverFillRemaining(
          hasScrollBody: false,
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  const CustomBookAppBarDetails(),
                  BooksDetailsSection(bookModel: bookModel),
                  const Expanded(child: SizedBox(height: 50)),
                  const SimilarBooksSection(),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}

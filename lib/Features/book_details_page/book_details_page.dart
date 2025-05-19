import 'package:bookly_app/Features/book_details_page/widget/books_details_desplay.dart';
import 'package:bookly_app/Features/similar_books_page/similar_books_dispaly_page.dart';
import 'package:bookly_app/core/components/custom_book_app_bar_details.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/bloc/similar_books_cubit/similar_books_cubit.dart';
import '../../data/models/book_model/book_model.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  void initState() {
    context.read<SimilarBooksCubit>().getFetchSimilarBooksCubit(
      category: widget.bookModel.volumeInfo.categories?[0] ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverFillRemaining(
            hasScrollBody: false,
            child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    CustomBookAppBarDetails(),
                    BookDetailsDisplay(bookModel: widget.bookModel),
                    const Expanded(child: SizedBox(height: 50)),
                    if ((widget.bookModel.volumeInfo.categories ?? [])
                        .isNotEmpty)
                      SimilarBooksDisplayPage(
                        category: widget.bookModel.volumeInfo.categories!.first,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

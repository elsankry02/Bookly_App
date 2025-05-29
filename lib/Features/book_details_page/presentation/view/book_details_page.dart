import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_book_app_bar_details.dart';
import '../../../similar_books_page/data/similar_books_cubit/similar_books_cubit.dart';
import '../../../home_page/data/book_model/book_model.dart';
import '../../../similar_books_page/presentation/view/similar_books_dispaly_page.dart';
import '../widget/books_details_desplay.dart';

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
                    //! Custom Book AppBar Details
                    CustomBookAppBarDetails(),
                    //! Book Details Display
                    BookDetailsDisplay(bookModel: widget.bookModel),
                    const Expanded(child: SizedBox(height: 50)),
                    if ((widget.bookModel.volumeInfo.categories ?? [])
                        .isNotEmpty)
                      //! Similar Books Display Page
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

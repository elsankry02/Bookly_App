import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../bloc/similar_books_cubit/similar_books_cubit.dart';
import '../../models/book_model/book_model.dart';
import 'widget/book_details_widget.dart';

class BookDetailsPage extends StatefulWidget {
  const BookDetailsPage({super.key, required this.bookModel});
  final BookModel bookModel;
  @override
  State<BookDetailsPage> createState() => _BookDetailsPageState();
}

class _BookDetailsPageState extends State<BookDetailsPage> {
  @override
  void initState() {
    BlocProvider.of<SimilarBooksCubit>(context).getFetchSimilarBooksCubit(
      category: widget.bookModel.volumeInfo.categories?[0] ?? "",
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: BookDetailsWidget(bookModel: widget.bookModel));
  }
}

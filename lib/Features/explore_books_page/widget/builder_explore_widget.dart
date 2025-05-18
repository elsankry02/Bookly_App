import 'books_explore_widget.dart';
import '../../../bloc/similar_books_cubit/similar_books_cubit.dart';
import '../../../components/custom_errors_widget.dart';
import '../../../components/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuilderExploreWidget extends StatelessWidget {
  const BuilderExploreWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
        builder: (context, state) {
          if (state is GetFetchSimilarBooksSuccess) {
            return ListView.builder(
              padding: EdgeInsets.only(left: 10, right: 10, top: 20),
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return BooksExplorerWidget(book: state.books[index]);
              },
            );
          } else if (state is GetFetchSimilarBooksFailure) {
            return CustomErrorWidget(errMessage: state.errMessage);
          } else {
            return const CustomLoadingIndicator();
          }
        },
      ),
    );
  }
}

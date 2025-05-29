import 'package:bookly_app/core/components/custom_errors_widget.dart';
import 'package:bookly_app/core/components/custom_loading_indicator.dart';
import 'package:bookly_app/core/constant/string_manger.dart';
import 'package:bookly_app/core/constant/style_manger.dart';
import 'package:bookly_app/features/newest_book_page/presentation/view/newest_book_page.dart';
import 'package:bookly_app/features/search_page/data/search_cubit/fetch_search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultsDisplay extends StatelessWidget {
  const SearchResultsDisplay({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchBookCubit, FetchSearchBookState>(
      builder: (context, state) {
        if (state is FetchSearchBookStateSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.bookModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                //! Newest Book Page
                child: NewestBookPage(bookModel: state.bookModel[index]),
              );
            },
          );
        } else if (state is FetchSearchBookStateFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FetchSearchBookStateLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text(
              StringManger.kStartSearchingForourBook,
              style: StyleManger.textStyle25,
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}

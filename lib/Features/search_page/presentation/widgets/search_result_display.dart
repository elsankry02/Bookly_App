import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_errors_widget.dart';
import '../../../../core/components/custom_loading_indicator.dart';
import '../../../../core/constant/string_manger.dart';
import '../../../../core/constant/style_manger.dart';
import '../../data/search_cubit/fetch_search_books_cubit.dart';
import '../../../newest_book_page/presentation/view/newest_book_page.dart';

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

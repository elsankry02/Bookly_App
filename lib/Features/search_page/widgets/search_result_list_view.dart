import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../bloc/fetch_search_books_cubit/fetch_search_books_cubit.dart';
import '../../../components/custom_errors_widget.dart';
import '../../../components/custom_loading_indicator.dart';
import '../../../constant/string_manger.dart';
import '../../../constant/style_manger.dart';
import '../../newest_book_page/newest_book_page.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

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

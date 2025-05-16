import 'package:bookly_app/Features/search/presentation/manger/get_fetch_search_books_cubit.dart';
import 'package:bookly_app/core/utils/app_styles.dart';
import 'package:bookly_app/core/widgets/custom_errors_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../home/presentation/widgets/book_list_view_item.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchBookCubit, FetchSearchBookState>(
      builder: (context, state) {
        if (state is FetchSearchBookStateSuccess) {
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BookListViewItem(bookModel: state.bookModel[index]),
              );
            },
            itemCount: state.bookModel.length,
          );
        } else if (state is FetchSearchBookStateFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FetchSearchBookStateLoading) {
          return const CustomLoadingIndicator();
        } else {
          return const Center(
            child: Text(
              "search for any book",
              style: Styles.textStyle18,
              textAlign: TextAlign.center,
            ),
          );
        }
      },
    );
  }
}

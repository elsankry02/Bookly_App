import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_errors_widget.dart';
import '../../../../core/components/custom_loading_indicator.dart';
import '../../../newest_book_page/data/newest_books_cubit/newest_books_cubit.dart';
import '../../../newest_book_page/presentation/view/newest_book_page.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsetBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuceess) {
          return ListView.builder(
            shrinkWrap: true, //! علشان تأخذ فقط المساحة المطلوبة
            padding: EdgeInsets.zero,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.books.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: NewestBookPage(bookModel: state.books[index]),
              );
            },
          );
        } else if (state is NewestBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

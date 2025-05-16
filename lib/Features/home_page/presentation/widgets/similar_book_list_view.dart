import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/components/custom_book_image.dart';
import '../../../../core/widgets/custom_errors_widget.dart';
import '../../../../core/widgets/custom_loading_indicator.dart';
import '../../data/manger/similar_books_cubit/similar_books_cubit.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is GetFetchSimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: CustomBookImage(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks?.thumbnail ??
                        "https://encrypted-tbn2.gstatic.com/images?q=tbn:ANd9GcQXcDlHNozqv7pTHrrHPQxnpzr11SHatJoolvMV0IHZxEgfEu3I",
                  ),
                );
              },
            ),
          );
        } else if (state is GetFetchSimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return const CustomLoadingIndicator();
        }
      },
    );
  }
}

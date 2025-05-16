import 'package:bookly_app/Features/home/presentation/manger/similar_books_cubit/get_fetch_similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/widgets/custom_book_image.dart';
import 'package:bookly_app/core/widgets/custom_errors_widget.dart';
import 'package:bookly_app/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBookListView extends StatelessWidget {
  const SimilarBookListView({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFetchSimilarBooksCubit, GetFetchSimilarBooksState>(
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
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
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

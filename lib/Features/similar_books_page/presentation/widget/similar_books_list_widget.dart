import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/custom_book_image.dart';
import '../../../../core/components/custom_errors_widget.dart';
import '../../../../core/components/custom_loading_indicator.dart';
import '../../../../core/constant/image_manger.dart';
import '../../../../core/routes/app_routes.dart';
import '../../data/similar_books_cubit/similar_books_cubit.dart';

class SimilarBooksListWidget extends StatefulWidget {
  const SimilarBooksListWidget({super.key, required this.scrollDirectio});
  final Axis scrollDirectio;
  @override
  State<SimilarBooksListWidget> createState() => _SimilarBooksListWidgetState();
}

class _SimilarBooksListWidgetState extends State<SimilarBooksListWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is GetFetchSimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              scrollDirection: widget.scrollDirectio,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {
                      //! Navigate
                      GoRouter.of(context).push(
                        AppRouter.kDetailseView,
                        extra: state.books[index],
                      );
                    },
                    child: CustomBookImage(
                      //! image
                      imageUrl:
                          state.books[index].volumeInfo.imageLinks?.thumbnail ??
                          ImageManger.kBooklyLogo,
                    ),
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

import 'package:bookly_app/bloc/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/components/custom_book_image.dart';
import 'package:bookly_app/components/custom_errors_widget.dart';
import 'package:bookly_app/components/custom_loading_indicator.dart';
import 'package:bookly_app/constant/color_manger.dart';
import 'package:bookly_app/constant/string_manger.dart';
import 'package:bookly_app/constant/style_manger.dart';
import 'package:bookly_app/core/routes/app_routes.dart';
import 'package:bookly_app/repos/repo_imp.dart';
import 'package:bookly_app/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class ExploreBooksPage extends StatefulWidget {
  const ExploreBooksPage({super.key});

  @override
  State<ExploreBooksPage> createState() => _ExploreBooksPageState();
}

class _ExploreBooksPageState extends State<ExploreBooksPage> {
  int currantIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        centerTitle: true,
        title: Text('Explore Books 📚', style: StyleManger.textStyle22),
      ),
      body: BlocProvider(
        create:
            (context) =>
                SimilarBooksCubit(getIt.get<RepoImp>())
                  ..getFetchSimilarBooksCubit(category: items[0]),
        child: Column(
          children: [
            SizedBox(
              height: 35,
              child: ListView.builder(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        if (currantIndex != index) {
                          setState(() {
                            currantIndex = index;
                          });
                          context
                              .read<SimilarBooksCubit>()
                              .getFetchSimilarBooksCubit(
                                category: items[index],
                              );
                        }
                      });
                    },
                    child: Container(
                      margin: const EdgeInsets.only(right: 15),
                      padding: const EdgeInsets.symmetric(horizontal: 20),

                      decoration: BoxDecoration(
                        color:
                            currantIndex == index
                                ? ColorManger.kPrimaryColor
                                : ColorManger.kSecond,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        //! Titel
                        child: Text(
                          items[index],
                          style: StyleManger.textStyle15.copyWith(
                            fontWeight: FontWeight.w600,
                            color:
                                currantIndex == index
                                    ? ColorManger.kWhite
                                    : ColorManger.kPrimaryColor,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            Expanded(
              child: BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
                builder: (context, state) {
                  if (state is GetFetchSimilarBooksSuccess) {
                    final books = state.books;
                    return ListView.builder(
                      padding: EdgeInsets.only(left: 10, right: 10, top: 20),
                      itemCount: books.length,
                      itemBuilder: (context, index) {
                        final book = books[index];

                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          child: GestureDetector(
                            onTap: () {
                              GoRouter.of(
                                context,
                              ).push(AppRouter.kDetailseView, extra: book);
                            },
                            child: SizedBox(
                              height: 120,
                              child: Row(
                                children: [
                                  //! image
                                  CustomBookImage(
                                    imageUrl:
                                        book.volumeInfo.imageLinks?.thumbnail ??
                                        "Unknown Image",
                                  ),
                                  const SizedBox(width: 15),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        //! titel
                                        Text(
                                          book.volumeInfo.title ?? 'No Title',
                                          style: StyleManger.textStyle20
                                              .copyWith(
                                                fontFamily:
                                                    StringManger.kGtSectraFine,
                                              ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        const SizedBox(height: 3),
                                        //! subTitel
                                        Text(
                                          (book.volumeInfo.authors != null &&
                                                  book
                                                      .volumeInfo
                                                      .authors!
                                                      .isNotEmpty)
                                              ? book.volumeInfo.authors!.first
                                              : 'Unknown Author',
                                          maxLines: 2,
                                          style: StyleManger.textStyle14,
                                        ),
                                        const SizedBox(height: 3),
                                        Expanded(
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Free',
                                                style: StyleManger.textStyle14
                                                    .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                              ),
                                              Row(
                                                children: [
                                                  Icon(
                                                    Icons.star,
                                                    color: ColorManger.kStar,
                                                    size: 16,
                                                  ),
                                                  Text(
                                                    '${book.volumeInfo.averageRating ?? 0} (${book.volumeInfo.ratingsCount ?? 0})',
                                                    style:
                                                        StyleManger.textStyle14,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  } else if (state is GetFetchSimilarBooksFailure) {
                    return CustomErrorWidget(errMessage: state.errMessage);
                  } else {
                    return const CustomLoadingIndicator();
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

List<String> items = [
  'psychology',
  'Art',
  'Biography',
  'Business',
  'Children',
  'Comics',
  'Cooking',
  'Education',
  'Entertainment',
  'Fantasy',
  'Fiction',
  'History',
  'Horror',
  'Law',
  'Literature',
  'Mystery',
  'Non-fiction',
  'Philosophy',
  'Poetry',
  'Religion',
  'Romance',
  'Science',
  'Science Fiction',
  'Self-help',
  'Sport',
  'Technology',
  'Thriller',
  'Travel',
  'Young Adult',
];

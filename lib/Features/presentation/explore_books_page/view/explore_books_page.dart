import 'package:bookly_app/core/repos/repo_imp.dart';
import 'package:bookly_app/Features/data/services/services_locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constant/color_manger.dart';
import '../../../../core/constant/style_manger.dart';
import '../../../data/cubits/similar_books_cubit/similar_books_cubit.dart';
import '../widget/builder_explore_widget.dart';

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
            SizedBox(height: 10),
            SizedBox(
              height: 35,
              child: ListView.builder(
                padding: const EdgeInsetsDirectional.symmetric(horizontal: 5),
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      if (currantIndex != index) {
                        setState(() {
                          currantIndex = index;
                          context
                              .read<SimilarBooksCubit>()
                              .getFetchSimilarBooksCubit(
                                category: items[index],
                              );
                        });
                      }
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      margin: const EdgeInsets.only(right: 15),
                      decoration: BoxDecoration(
                        //! Color
                        color:
                            currantIndex == index
                                ? ColorManger.kPreview
                                : ColorManger.kWhite,
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
                                    : ColorManger.kFree,
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            //! Builder Explore Widget
            BuilderExploreWidget(),
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

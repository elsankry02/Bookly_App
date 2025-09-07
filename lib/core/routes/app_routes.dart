import 'package:bookly_app/Features/data/book_model/book_model.dart';
import 'package:bookly_app/Features/data/cubits/search_cubit/fetch_search_books_cubit.dart';
import 'package:bookly_app/Features/data/cubits/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly_app/Features/presentation/book_details_page/view/book_details_page.dart';
import 'package:bookly_app/Features/presentation/explore_books_page/view/explore_books_page.dart';
import 'package:bookly_app/Features/presentation/home_page/view/home_page.dart';
import 'package:bookly_app/Features/presentation/search_page/view/search_page.dart';
import 'package:bookly_app/Features/presentation/splash_page/view/splash_view.dart';
import 'package:bookly_app/core/repos/repo_imp.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/data/services/services_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailseView = '/detailsView';
  static const kSearchView = '/searchView';
  static const kViewAllNewestBooks = '/viewAllNewestBooks';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashPage()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomePage()),
      GoRoute(
        path: kViewAllNewestBooks,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<RepoImp>()),
              child: ExploreBooksPage(),
            ),
      ),
      GoRoute(
        path: kDetailseView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => SimilarBooksCubit(getIt.get<RepoImp>()),
              child: BookDetailsPage(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => FetchSearchBookCubit(getIt.get<RepoImp>()),
              child: const SearchPage(),
            ),
      ),
    ],
  );
}

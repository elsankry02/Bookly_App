import 'package:bookly_app/Features/book_details_page/book_details_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/explore_books_page/explore_books_page.dart';
import '../../Features/home_page/home_page.dart';
import '../../Features/search_page/search_page.dart';
import '../../Features/splash_page/splash_view.dart';
import '../../data/bloc/fetch_search_books_cubit/fetch_search_books_cubit.dart';
import '../../data/bloc/similar_books_cubit/similar_books_cubit.dart';
import '../../data/models/book_model/book_model.dart';
import '../../data/repos/repo_imp.dart';
import '../../data/services/services_locator.dart';

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

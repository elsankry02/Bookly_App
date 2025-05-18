import 'package:bookly_app/Features/explore_books_page/explore_books_page.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/book_details_page/book_details_view.dart';
import '../../Features/home_page/views/home_views.dart';
import '../../Features/search_page/views/search_views.dart';
import '../../Features/splash_page/views/splash_view.dart';
import '../../bloc/fetch_search_books_cubit/fetch_search_books_cubit.dart';
import '../../bloc/similar_books_cubit/similar_books_cubit.dart';
import '../../models/book_model/book_model.dart';
import '../../repos/repo_imp.dart';
import '../../services/services_locator.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailseView = '/detailsView';
  static const kSearchView = '/searchView';
  static const kViewAllNewestBooks = '/viewAllNewestBooks';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
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
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create: (context) => FetchSearchBookCubit(getIt.get<RepoImp>()),
              child: const SearchViews(),
            ),
      ),
    ],
  );
}

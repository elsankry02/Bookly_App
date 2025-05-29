import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../features/book_details_page/presentation/view/book_details_page.dart';
import '../../features/explore_books_page/presentation/view/explore_books_page.dart';
import '../../features/home_page/presentation/view/home_page.dart';
import '../../features/search_page/presentation/view/search_page.dart';
import '../../features/splash_page/presentation/view/splash_view.dart';
import '../../features/search_page/data/search_cubit/fetch_search_books_cubit.dart';
import '../../features/similar_books_page/data/similar_books_cubit/similar_books_cubit.dart';
import '../../features/home_page/data/book_model/book_model.dart';
import '../repos/repo_imp.dart';
import '../services/services_locator.dart';

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

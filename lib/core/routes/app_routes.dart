import 'package:bookly_app/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly_app/Features/home/data/repos/home_repo_imp.dart';
import 'package:bookly_app/Features/home/presentation/manger/similar_books_cubit/get_fetch_similar_books_cubit.dart';
import 'package:bookly_app/Features/home/presentation/views/book_details_view.dart';
import 'package:bookly_app/Features/home/presentation/views/home_views.dart';
import 'package:bookly_app/Features/search/data/repos/search_repos_impl.dart';
import 'package:bookly_app/Features/search/presentation/manger/get_fetch_search_books_cubit.dart';
import 'package:bookly_app/Features/search/presentation/views/search_views.dart';
import 'package:bookly_app/Features/splash/presentation/views/splash_view.dart';
import 'package:bookly_app/core/services/services_locator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const kHomeView = '/homeView';
  static const kDetailseView = '/detailsView';
  static const kSearchView = '/searchView';

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(path: '/', builder: (context, state) => const SplashView()),
      GoRoute(path: kHomeView, builder: (context, state) => const HomeView()),
      GoRoute(
        path: kDetailseView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      GetFetchSimilarBooksCubit(getIt.get<HomeRepoImp>()),
              child: BookDetailsView(bookModel: state.extra as BookModel),
            ),
      ),
      GoRoute(
        path: kSearchView,
        builder:
            (context, state) => BlocProvider(
              create:
                  (context) =>
                      FetchSearchBookCubit(getIt.get<SearchRepoImpl>()),
              child: const SearchViews(),
            ),
      ),
    ],
  );
}

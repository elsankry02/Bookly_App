import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/home_page/data/manger/similar_books_cubit/similar_books_cubit.dart';
import '../../Features/home_page/data/models/book_model/book_model.dart';
import '../../Features/home_page/data/repos/home_repo_imp.dart';
import '../../Features/home_page/presentation/views/home_views.dart';
import '../../Features/home_page/presentation/widgets/book_details_view.dart';
import '../../Features/search_page/data/manger/get_fetch_search_books_cubit.dart';
import '../../Features/search_page/data/repos/search_repos_impl.dart';
import '../../Features/search_page/presentation/views/search_views.dart';
import '../../Features/splash_page/views/splash_view.dart';
import '../../services/services_locator.dart';

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
              create: (context) => SimilarBooksCubit(getIt.get<HomeRepoImp>()),
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

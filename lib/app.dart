import 'constant/color_manger.dart';
import 'core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import 'bloc/featured_books_cubit/featured_books_cubit.dart';
import 'bloc/newest_books_cubit/newest_books_cubit.dart';
import 'repos/repo_imp.dart';
import 'services/services_locator.dart';

class BooklyApp extends StatelessWidget {
  const BooklyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create:
              (context) =>
                  FeaturedBooksCubit(getIt.get<RepoImp>())
                    ..getFetchFeaturedBooks(),
        ),
        BlocProvider(
          create:
              (context) =>
                  NewsetBooksCubit(getIt.get<RepoImp>())..getFetchNewsetBooks(),
        ),
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: ColorManger.kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(
            ThemeData.dark().textTheme,
          ),
        ),
        routerConfig: AppRouter.router,
      ),
    );
  }
}

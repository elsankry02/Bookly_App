import '../../../core/routes/app_routes.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../components/custom_app_bar.dart';
import '../../../constant/string_manger.dart';
import '../../../constant/style_manger.dart';
import '../widgets/best_seller_list_view.dart';
import '../widgets/featured_books_list_view.dart';

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      physics: BouncingScrollPhysics(),
      slivers: [
        SliverToBoxAdapter(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                //! Custom AppBar
                child: CustomAppBar(),
              ),
              //! Featured Books List View
              FeaturedBooksListView(),

              SizedBox(height: 30),

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //! Newest Books
                    Text(
                      StringManger.kNewestBooks,
                      style: StyleManger.textStyle30,
                    ),

                    GestureDetector(
                      onTap: () {
                        GoRouter.of(
                          context,
                        ).push(AppRouter.kViewAllNewestBooks);
                      },
                      //! View All
                      child: Text(
                        StringManger.kViewAll,
                        textDirection: TextDirection.rtl,

                        style: StyleManger.textStyle16.copyWith(
                          decoration: TextDecoration.underline,

                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: BestSellerListView(),
          ),
        ),
      ],
    );
  }
}

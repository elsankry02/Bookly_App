import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/custom_app_bar.dart';
import '../../../../core/constant/string_manger.dart';
import '../../../../core/constant/style_manger.dart';
import '../../../../core/routes/app_routes.dart';
import '../widgets/best_seller_list_view.dart';
import '../widgets/featured_books_list_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
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
                        InkWell(
                          borderRadius: BorderRadius.circular(3),
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
                              fontWeight: FontWeight.w900,
                              fontFamily: StringManger.kGtSectraFine,
                              decoration: TextDecoration.underline,
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
                //! Best Seller List View
                child: BestSellerListView(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../components/custom_app_bar.dart';
import '../../../../constant/string_manger.dart';
import '../../../../constant/style_manger.dart';
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
              //
              SizedBox(height: 30),
              //
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Text(
                  StringManger.kNewestBooks,
                  style: StyleManger.textStyle30,
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

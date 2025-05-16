import 'package:bookly_app/Features/search/presentation/widgets/search_views_body.dart';
import 'package:flutter/material.dart';

class SearchViews extends StatelessWidget {
  const SearchViews({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: SafeArea(child: SearchViewsBody()));
  }
}

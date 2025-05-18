import 'package:flutter/material.dart';

import '../widgets/search_views_body.dart';

class SearchViews extends StatelessWidget {
  const SearchViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: SafeArea(child: SearchViewsBody()));
  }
}

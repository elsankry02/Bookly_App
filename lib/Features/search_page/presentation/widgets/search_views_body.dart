import 'package:bookly_app/Features/search_page/presentation/widgets/search_text_field.dart';
import 'package:bookly_app/core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'search_result_list_view.dart';

class SearchViewsBody extends StatelessWidget {
  const SearchViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  GoRouter.of(context).push(AppRouter.kHomeView);
                },
                icon: const Icon(Icons.arrow_back),
              ),
              Expanded(child: SearchTextField()),
            ],
          ),
          SizedBox(height: 20),
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/string_manger.dart';
import '../../../../core/utils/style_manger.dart';
import 'custom_search_text_field.dart';
import 'search_result_list_view.dart';

class SearchViewsBody extends StatelessWidget {
  const SearchViewsBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomSearchTextField(),
          SizedBox(height: 20),
          //
          Text(StringManger.kSearchResult, style: StyleManger.textStyle18),
          SizedBox(height: 20),
          //
          Expanded(child: SearchResultListView()),
        ],
      ),
    );
  }
}

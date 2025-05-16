import 'package:flutter/material.dart';

import '../../../../core/utils/string_manger.dart';
import '../../../../core/utils/style_manger.dart';
import 'similar_book_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          StringManger.kBookDetails,
          style: StyleManger.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        const SimilarBookListView(),
      ],
    );
  }
}

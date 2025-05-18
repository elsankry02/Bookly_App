import 'package:flutter/material.dart';

import '../../../constant/string_manger.dart';
import '../../../constant/style_manger.dart';
import 'similar_book_list_view.dart';

class SimilarBooksSection extends StatelessWidget {
  const SimilarBooksSection({super.key, required this.category});
  final String category;

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
        SimilarBookListView(scrollDirectio: Axis.horizontal),
      ],
    );
  }
}

import 'package:flutter/material.dart';

import '../../../../core/constant/string_manger.dart';
import '../../../../core/constant/style_manger.dart';
import '../widget/similar_books_list_widget.dart';

class SimilarBooksDisplayPage extends StatelessWidget {
  const SimilarBooksDisplayPage({super.key, required this.category});
  final String category;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        //! Book Details
        Text(
          StringManger.kBookDetails,
          style: StyleManger.textStyle14.copyWith(fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 16),
        //! Similar Books List
        SimilarBooksListWidget(scrollDirectio: Axis.horizontal),
      ],
    );
  }
}

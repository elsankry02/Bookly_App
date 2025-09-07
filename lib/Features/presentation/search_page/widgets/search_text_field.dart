import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../data/cubits/search_cubit/fetch_search_books_cubit.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.white,
      onSubmitted: (value) {
        context.read<FetchSearchBookCubit>().getFetchSimilarBooksCubit(
          endPoint: value,
        );
      },
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBroder(),
        enabledBorder: buildOutlineInputBroder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBroder() {
    return OutlineInputBorder(
      borderSide: BorderSide(width: 1, color: Colors.white38),
      borderRadius: BorderRadius.circular(12),
    );
  }
}

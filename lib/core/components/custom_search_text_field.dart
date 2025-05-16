import '../../Features/search_page/data/manger/get_fetch_search_books_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  const CustomSearchTextField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextField(
      onSubmitted: (data) {
        BlocProvider.of<FetchSearchBookCubit>(
          context,
        ).getFetchSimilarBooksCubit(category: data);
      },
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBroder(),
        enabledBorder: buildOutlineInputBroder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {},
          icon: const Opacity(
            opacity: 0.8,
            child: FaIcon(FontAwesomeIcons.magnifyingGlass, size: 22),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBroder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(color: Colors.white),
    );
  }
}

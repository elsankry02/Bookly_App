import '../widgets/search_result_display.dart';
import '../widgets/search_text_field.dart';
import '../../../../core/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      //! Navigate
                      GoRouter.of(context).push(AppRouter.kHomeView);
                    },
                    icon: const Icon(Icons.arrow_back),
                  ),
                  //!Search Text Field
                  Expanded(child: SearchTextField()),
                ],
              ),
              SizedBox(height: 20),
              //! Search Result List View
              Expanded(child: SearchResultsDisplay()),
            ],
          ),
        ),
      ),
    );
  }
}

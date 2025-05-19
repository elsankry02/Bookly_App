import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:go_router/go_router.dart';

import '../constant/image_manger.dart';
import '../routes/app_routes.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //! image Logo
          Image.asset(ImageManger.kBooklyLogo, height: 24),
          IconButton(
            onPressed: () {
              GoRouter.of(context).push(AppRouter.kSearchView);
            },
            //! Icons Search
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}

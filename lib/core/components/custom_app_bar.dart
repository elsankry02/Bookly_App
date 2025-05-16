import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../Function/custom_navigate.dart';
import '../routes/app_routes.dart';
import '../utils/app_assets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          Image.asset(AppAssets.kLogo, height: 20),
          const Spacer(),
          IconButton(
            onPressed: () {
              customPushReplacement(context, path: AppRouter.kSearchView);
            },
            icon: const FaIcon(FontAwesomeIcons.magnifyingGlass),
          ),
        ],
      ),
    );
  }
}

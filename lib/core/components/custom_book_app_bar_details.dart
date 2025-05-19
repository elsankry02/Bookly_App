import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBookAppBarDetails extends StatelessWidget {
  const CustomBookAppBarDetails({super.key});
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        IconButton(
          onPressed: () {
            context.pop();
          },
          icon: const Icon(Icons.close),
        ),
      ],
    );
  }
}

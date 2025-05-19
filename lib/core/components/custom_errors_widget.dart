import 'package:flutter/material.dart';

import '../constant/style_manger.dart';

class CustomErrorWidget extends StatelessWidget {
  const CustomErrorWidget({super.key, required this.errMessage});
  final String errMessage;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errMessage,
        textAlign: TextAlign.center,
        style: StyleManger.textStyle18,
      ),
    );
  }
}

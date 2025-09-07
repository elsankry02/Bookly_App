import 'package:flutter/material.dart';

class SlideText extends StatelessWidget {
  const SlideText({
    super.key,
    required this.slidingAnimation,
  });

  final Animation<Offset> slidingAnimation;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: slidingAnimation,
      builder: (BuildContext context, _) {
        return SlideTransition(
          position: slidingAnimation,
          child: const Text(
            "Read Free Books ",
            textAlign: TextAlign.center,
          ),
        );
      },
    );
  }
}

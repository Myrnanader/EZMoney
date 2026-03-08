import 'package:dots_indicator/dots_indicator.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class OnboardingDots extends StatelessWidget {

  final int count;
  final int index;

  const OnboardingDots({
    super.key,
    required this.count,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {

    return DotsIndicator(
      dotsCount: count,
      position: index.toDouble(),

      decorator: DotsDecorator(
        activeColor: AppColors.primary,
        size: const Size.square(8),
        activeSize: const Size(30, 8),

        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
    );
  }
}
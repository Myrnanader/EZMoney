import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLoading extends StatelessWidget {

  final AnimationController controller;

  const SplashLoading({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {

    return AnimatedBuilder(
      animation: controller,

      builder: (context, child) {

        int percent = (controller.value * 100).toInt();

        return Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Text(
                  "SECURELY LOADING",
                  style: AppTextStyles.caption,
                ),

                Text(
                  "$percent%",
                  style: AppTextStyles.caption,
                ),

              ],
            ),

            AppSpacing.h8,

            LinearProgressIndicator(
              value: controller.value,
              minHeight: 6.h,
              color: AppColors.primary,
              borderRadius: BorderRadius.circular(10.r),
              backgroundColor: AppColors.grey.withValues(alpha: .2),
            ),

          ],
        );
      },
    );
  }
}
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnboardingItemCard extends StatelessWidget {

  final String image;
  final String title;
  final String description;

  const OnboardingItemCard({
    super.key,
    required this.image,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        AppSpacing.h40,

        ClipRRect(
          borderRadius: BorderRadius.circular(AppRadius.r24),
          child: Image.asset(
            image,
            height: 260.h,
            width: 320.w,
            fit: BoxFit.cover,
          ),
        ),

        AppSpacing.h24,

        Text(
          title,
          style: AppTextStyles.heading2,
          textAlign: TextAlign.center,
        ),

        AppSpacing.h12,

        Padding(
          padding: EdgeInsets.symmetric(horizontal: 32.w),
          child: Text(
            description,
            textAlign: TextAlign.center,
            style: AppTextStyles.body,
          ),
        ),
      ],
    );
  }
}
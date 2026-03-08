import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        Container(
          width: 80.w,
          height: 80.w,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(AppRadius.r16),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 12.r,
                offset: Offset(0, 6.h),
              )
            ],
          ),
          child: Center(
            child: Text(
              "EZ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 26.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        AppSpacing.h20,

        Text(
          "EZmoney",
          style: AppTextStyles.heading2,
        ),

        AppSpacing.h8,

        Text(
          "Your money, simplified",
          style: AppTextStyles.body,
        ),

      ],
    );
  }
}
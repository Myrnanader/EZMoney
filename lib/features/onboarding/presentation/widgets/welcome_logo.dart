import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeLogo extends StatelessWidget {
  const WelcomeLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

        Container(
          width: 32.w,
          height: 32.w,
          decoration: BoxDecoration(
            color: AppColors.primary,
            borderRadius: BorderRadius.circular(8.r),
          ),
          child: Center(
            child: Text(
              "EZ",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        AppSpacing.w8,

        Text(
          "EZmoney",
          style: AppTextStyles.subtitle,
        ),

      ],
    );
  }
}
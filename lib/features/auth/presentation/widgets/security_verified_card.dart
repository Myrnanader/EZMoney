import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecurityVerifiedCard extends StatelessWidget {
  const SecurityVerifiedCard({super.key});

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 16.w,
        vertical: 16.h,
      ),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r24),
        border: Border.all(color: AppColors.lightGrey),
      ),

      child: Row(
        children: [

          /// ICON
          Container(
            width: 44.w,
            height: 44.w,

            decoration: BoxDecoration(
              color: AppColors.lightGrey,
              borderRadius: BorderRadius.circular(12.r),
            ),

            child: Icon(
              Icons.verified_user,
              color: AppColors.primary,
              size: 22.sp,
            ),
          ),

          AppSpacing.w12,

          /// TEXT
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(
                  "Security Verified",
                  style: AppTextStyles.subtitle,
                ),

                Text(
                  "Biometrics & 2FA enabled",
                  style: AppTextStyles.caption,
                ),
              ],
            ),
          ),

          /// CHECK
          Icon(
            Icons.check_circle,
            color: Colors.green,
            size: 22.sp,
          ),
        ],
      ),
    );
  }
}
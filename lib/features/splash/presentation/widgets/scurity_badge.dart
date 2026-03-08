import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SecurityBadge extends StatelessWidget {
  const SecurityBadge({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(20.r),
      ),
    
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.security, size: 14.sp, color: AppColors.primary),
    
          AppSpacing.w8,
    
          Text("Bank-grade security", style: AppTextStyles.caption),
        ],
      ),
    );
  }
}

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_radius.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class QuickServiceCard extends StatelessWidget {

  final IconData icon;
  final String title;
  final VoidCallback onTap;
  final Color color;   

  const QuickServiceCard({
    super.key,
    required this.icon,
    required this.title,
    required this.onTap,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {

    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppRadius.r20),

        child: Ink(
          width: 100.w,
          padding: EdgeInsets.symmetric(vertical: 16.h),

          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadius.r20),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 20,
                offset: Offset(0, 10),
              )
            ],
          ),

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              /// icon container
              Container(
                width: 42.w,
                height: 42.w,

                decoration: BoxDecoration(
                  color: color.withValues(alpha:.15), 
                  shape: BoxShape.circle,
                ),

                child: Icon(
                  icon,
                  color: color,
                  size: 20.sp,
                ),
              ),

              AppSpacing.h8,

              Text(
                title,
                textAlign: TextAlign.center,
                style: AppTextStyles.caption,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
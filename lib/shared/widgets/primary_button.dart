import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../core/theme/app_colors.dart';
import '../../core/theme/app_radius.dart';
import '../../core/theme/app_text_styles.dart';

class PrimaryButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;
  final IconData? icon; // optional icon

  const PrimaryButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 56.h,

      child: ElevatedButton(

        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r24),
          ),
        ),

        onPressed: onPressed,

        child: icon == null
            ? Text(
                text,
                style: AppTextStyles.button,
              )
            : Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  Icon(
                    icon,
                    color: Colors.white,
                    size: 20.sp,
                  ),

                  SizedBox(width: 8.w),

                  Text(
                    text,
                    style: AppTextStyles.button,
                  ),
                ],
              ),
      ),
    );
  }
}
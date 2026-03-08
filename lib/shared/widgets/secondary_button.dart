import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_radius.dart';
import '../../../core/theme/app_text_styles.dart';

class SecondaryButton extends StatelessWidget {

  final String text;
  final VoidCallback onPressed;

  const SecondaryButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return SizedBox(
      width: double.infinity,
      height: 56.h,

      child: OutlinedButton(

        style: OutlinedButton.styleFrom(

          backgroundColor: AppColors.white,

          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppRadius.r24),
          ),

          side: BorderSide(
            color: AppColors.grey,
            width: 1.2,
          ),
        ),

        onPressed: onPressed,

        child: Text(
          text,
          style: AppTextStyles.subtitle.copyWith(
            color: AppColors.black,
          ),
        ),
      ),
    );
  }
}
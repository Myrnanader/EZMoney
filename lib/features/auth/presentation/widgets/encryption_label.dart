import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EncryptionLabel extends StatelessWidget {
  const EncryptionLabel({super.key});

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        Icon(
          Icons.verified_user,
          color: AppColors.grey,
          size: 24.sp,
        ),

        AppSpacing.h8,

        Text(
          "END-TO-END ENCRYPTED",
          style: AppTextStyles.caption.copyWith(
            letterSpacing: 1.3,
          ),
        ),

      ],
    );
  }
}
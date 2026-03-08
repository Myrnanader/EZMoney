import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';

import 'package:e_wallet/shared/widgets/primary_button.dart';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';

class VerifyOtpCard extends StatelessWidget {
  const VerifyOtpCard({super.key});

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 40.w,
      height: 48.h,
      textStyle: AppTextStyles.heading2,

      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: AppColors.grey,
            width: 1.5,
          ),
        ),
      ),
    );

    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(
        horizontal: 20.w,
        vertical: 24.h,
      ),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r24),
        border: Border.all(color: AppColors.lightGrey),
      ),

      child: Column(
        children: [

          /// OTP
          Pinput(
            length: 6,
            defaultPinTheme: defaultPinTheme,
          ),

          AppSpacing.h24,

          /// BUTTON
          PrimaryButton(
            text: "Confirm Code",
            onPressed: () {
              context.push(RoutePaths.setPin);
            },
          ),

          AppSpacing.h16,

          /// TEXT
          Text(
            "Didn't receive the code?",
            style: AppTextStyles.caption,
          ),

          AppSpacing.h8,

          /// RESEND
          TextButton(
            onPressed: () {},

            style: TextButton.styleFrom(
              backgroundColor: AppColors.lightGrey,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppRadius.r16),
              ),
            ),

            child: Text(
              "Resend Code",
              style: AppTextStyles.body.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),

        ],
      ),
    );
  }
}
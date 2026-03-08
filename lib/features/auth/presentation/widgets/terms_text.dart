import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class TermsText extends StatelessWidget {
  const TermsText({super.key});

  @override
  Widget build(BuildContext context) {

    return Center(
      child: Text.rich(
        TextSpan(
          text:
          'By tapping "Create Account", you agree to our ',
          style: AppTextStyles.caption,

          children: [

            TextSpan(
              text: "Terms",
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),

            const TextSpan(text: " and "),

            TextSpan(
              text: "Privacy Policy.",
              style: AppTextStyles.caption.copyWith(
                color: AppColors.primary,
                fontWeight: FontWeight.w600,
              ),
            ),

          ],
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
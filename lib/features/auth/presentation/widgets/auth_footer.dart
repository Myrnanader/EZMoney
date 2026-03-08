import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthFooter extends StatelessWidget {

  final String text;
  final String actionText;
  final VoidCallback onPressed;

  const AuthFooter({
    super.key,
    required this.text,
    required this.actionText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        Text(
          text,
          style: AppTextStyles.body,
        ),

        TextButton(
          onPressed: onPressed,

          child: Text(
            actionText,
            style: AppTextStyles.body.copyWith(
              color: AppColors.primary,
            ),
          ),
        ),

      ],
    );
  }
}
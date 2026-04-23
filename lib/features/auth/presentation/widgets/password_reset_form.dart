import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class PasswordResetForm extends StatelessWidget {
  final TextEditingController passwordController;
  final TextEditingController confirmController;

  const PasswordResetForm({
    super.key,
    required this.passwordController,
    required this.confirmController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PasswordField(
          label: "New Password",
          controller: passwordController,
        ),
        AppSpacing.h16,
        PasswordField(
          label: "Confirm Password",
          controller: confirmController,
        ),
        AppSpacing.h8,
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Use at least 8 characters.",
            style: AppTextStyles.caption,
          ),
        ),
      ],
    );
  }
}
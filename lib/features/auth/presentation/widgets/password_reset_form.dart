import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/core/validators/auth_validator.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class PasswordResetForm extends StatelessWidget {

  final TextEditingController passwordController;
  final TextEditingController confirmController;
  final GlobalKey<FormState> formKey;

  const PasswordResetForm({
    super.key,
    required this.passwordController,
    required this.confirmController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,

      child: Column(
        children: [

          PasswordField(
            label: "New Password",
            controller: passwordController,
            validator: AuthValidator.password,
          ),

          AppSpacing.h16,

          PasswordField(
            label: "Confirm Password",
            controller: confirmController,
            validator: (value) => AuthValidator.confirmPassword(
              passwordController.text,
              value,
            ),
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
      ),
    );
  }
}
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {
  final TextEditingController controller;

  const ForgotPasswordForm({
    super.key,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          label: "Email or phone",
          hint: "e.g. name@email.com",
          controller: controller,
          keyboardType: TextInputType.emailAddress,
        ),
        AppSpacing.h16,
      ],
    );
  }
}
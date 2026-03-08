import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/validators/auth_validator.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';

class ForgotPasswordForm extends StatelessWidget {

  final TextEditingController controller;
  final GlobalKey<FormState> formKey;

  const ForgotPasswordForm({
    super.key,
    required this.controller,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,

      child: Column(
        children: [

          AuthTextField(
            label: "Email or phone",
            hint: "e.g. name@email.com",
            controller: controller,
            validator: AuthValidator.emailOrPhone,
          ),

          AppSpacing.h16,

        ],
      ),
    );
  }
}
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/validators/auth_validator.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';

class LoginForm extends StatelessWidget {

  final TextEditingController emailController;
  final TextEditingController passwordController;
  final GlobalKey<FormState> formKey;

  const LoginForm({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {

    return Form(
      key: formKey,

      child: Column(
        children: [

          /// EMAIL
          AuthTextField(
            label: "Email or phone",
            hint: "your@email.com",
            controller: emailController,
            validator: AuthValidator.emailOrPhone,
          ),

          AppSpacing.h16,

          /// PASSWORD
          PasswordField(
            controller: passwordController,
            validator: AuthValidator.password,
          ),

        ],
      ),
    );
  }
}
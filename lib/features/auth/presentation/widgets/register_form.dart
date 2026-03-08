import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/validators/auth_validator.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {

  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  final GlobalKey<FormState> formKey;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.phoneController,
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

          /// NAME
          AuthTextField(
            label: "Full Name",
            hint: "John Doe",
            controller: nameController,

            prefixIcon: Icon(
              Icons.person_outline,
              size: 22.sp,
              color: AppColors.primary,
            ),

            validator: (v) =>
            v == null || v.isEmpty
                ? "Name is required"
                : null,
          ),

          AppSpacing.h16,

          /// PHONE
          AuthTextField(
            label: "Phone Number",
            hint: "+1 (555) 000-0000",
            controller: phoneController,

            prefixIcon: Icon(
              Icons.phone_outlined,
              size: 22.sp,
              color: AppColors.primary,
            ),

            validator: AuthValidator.phone,
          ),

          AppSpacing.h16,

          /// EMAIL
          AuthTextField(
            label: "Email Address",
            hint: "john@example.com",
            controller: emailController,

            prefixIcon: Icon(
              Icons.email_outlined,
              size: 22.sp,
              color: AppColors.primary,
            ),

            validator: AuthValidator.email,
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
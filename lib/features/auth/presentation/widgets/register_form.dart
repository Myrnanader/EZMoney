import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:e_wallet/features/auth/presentation/widgets/password_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterForm extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController phoneController;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  const RegisterForm({
    super.key,
    required this.nameController,
    required this.phoneController,
    required this.emailController,
    required this.passwordController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AuthTextField(
          label: "Full Name",
          hint: "John Doe",
          controller: nameController,
          prefixIcon: Icon(
            Icons.person_outline,
            size: 22.sp,
            color: AppColors.primary,
          ),
        ),
        AppSpacing.h16,
        AuthTextField(
          label: "Phone Number",
          hint: "+1 (555) 000-0000",
          controller: phoneController,
          keyboardType: TextInputType.phone,
          prefixIcon: Icon(
            Icons.phone_outlined,
            size: 22.sp,
            color: AppColors.primary,
          ),
        ),
        AppSpacing.h16,
        AuthTextField(
          label: "Email Address",
          hint: "john@example.com",
          controller: emailController,
          keyboardType: TextInputType.emailAddress,
          prefixIcon: Icon(
            Icons.email_outlined,
            size: 22.sp,
            color: AppColors.primary,
          ),
        ),
        AppSpacing.h16,
        PasswordField(controller: passwordController),
      ],
    );
  }
}
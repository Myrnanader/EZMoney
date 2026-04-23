import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PasswordField extends StatefulWidget {
  final TextEditingController controller;
  final String label;

  const PasswordField({
    super.key,
    required this.controller,
    this.label = "Password",
  });

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return AuthTextField(
      label: widget.label,
      hint: "••••••••",
      controller: widget.controller,
      obscureText: obscure,
      prefixIcon: Icon(
        Icons.lock_outline,
        size: 22.sp,
        color: AppColors.primary,
      ),
      suffixIcon: IconButton(
        icon: Icon(
          obscure ? Icons.visibility_outlined : Icons.visibility_off_outlined,
          size: 20.sp,
          color: AppColors.grey,
        ),
        onPressed: () => setState(() => obscure = !obscure),
      ),
    );
  }
}
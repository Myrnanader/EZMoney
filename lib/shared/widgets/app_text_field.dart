import 'package:flutter/material.dart';

import '../../core/theme/app_radius.dart';

class AppTextField extends StatelessWidget {

  final TextEditingController controller;
  final String hint;
  final String? Function(String?)? validator;
  final bool obscureText;
  final Widget? suffixIcon;

  const AppTextField({
    super.key,
    required this.controller,
    required this.hint,
    this.validator,
    this.obscureText = false,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {

    return TextFormField(

      controller: controller,
      validator: validator,
      obscureText: obscureText,

      decoration: InputDecoration(

        hintText: hint,

        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppRadius.r24),
        ),

        suffixIcon: suffixIcon,

      ),
    );
  }
}
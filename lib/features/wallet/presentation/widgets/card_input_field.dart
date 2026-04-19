import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CardInputField extends StatefulWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final IconData icon;
  final bool isPassword;
  final List<TextInputFormatter>? inputFormatters;

  const CardInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    required this.icon,
    this.isPassword = false,
    this.inputFormatters,
  });

  @override
  State<CardInputField> createState() => _CardInputFieldState();
}

class _CardInputFieldState extends State<CardInputField> {
  bool obscure = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// LABEL
        Text(
          widget.label,
          style: AppTextStyles.caption.copyWith(
            letterSpacing: 1,
          ),
        ),

        AppSpacing.h8,

        /// FIELD CONTAINER
        Container(
          height: 60.h,
          padding: EdgeInsets.symmetric(horizontal: 16.w),

          decoration: BoxDecoration(
            color: AppColors.card,
            borderRadius: BorderRadius.circular(AppRadius.r24),
            boxShadow: const [
              BoxShadow(
                color: AppColors.shadow,
                blurRadius: 10,
                offset: Offset(0, 4),
              )
            ],
          ),

          child: Row(
            children: [
              /// ICON
              Icon(
                widget.icon,
                color: AppColors.textSecondary,
                size: 20.sp,
              ),

              AppSpacing.w12,

              /// TEXT FIELD
              Expanded(
                child: TextField(
                  controller: widget.controller,
                  obscureText: widget.isPassword ? obscure : false,
                  inputFormatters: widget.inputFormatters,

                  decoration: InputDecoration(
                    hintText: widget.hint,
                    border: InputBorder.none,

                    hintStyle: AppTextStyles.body.copyWith(
                      color: AppColors.textLight,
                    ),
                  ),
                ),
              ),

              /// SHOW/HIDE PASSWORD
              if (widget.isPassword)
                GestureDetector(
                  onTap: () {
                    setState(() {
                      obscure = !obscure;
                    });
                  },
                  child: Icon(
                    obscure ? Icons.visibility_off : Icons.visibility,
                    size: 20.sp,
                    color: AppColors.textSecondary,
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
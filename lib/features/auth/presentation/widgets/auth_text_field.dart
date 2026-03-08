import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthTextField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController controller;
  final String? Function(String?)? validator;

  final Widget? prefixIcon;
  final Widget? suffixIcon;

  final bool obscureText;

  const AuthTextField({
    super.key,
    required this.label,
    required this.hint,
    required this.controller,
    this.validator,
    this.prefixIcon,
    this.suffixIcon,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 18.w,
        vertical: 12.h,
      ),

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r24),
        border: Border.all(
          color: AppColors.lightGrey,
        ),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

          /// LABEL
          Text(
            label.toUpperCase(),
            style: AppTextStyles.caption.copyWith(
              color: AppColors.textSecondary,
            ),
          ),

          SizedBox(height: 6.h),

          /// INPUT ROW
          Row(
            children: [

              /// PREFIX ICON
              if (prefixIcon != null) ...[
                prefixIcon!,
                SizedBox(width: 10.w),
              ],

              /// TEXT FIELD
              Expanded(
                child: TextFormField(
                  controller: controller,
                  validator: validator,
                  obscureText: obscureText,

                  style: AppTextStyles.body.copyWith(
                    color: AppColors.textPrimary,
                  ),

                  decoration: InputDecoration(
                    hintText: hint,
                    hintStyle: AppTextStyles.body.copyWith(
                      color: AppColors.grey,
                    ),
                    border: InputBorder.none,
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                  ),
                ),
              ),

              /// SUFFIX ICON
              ?suffixIcon,
            ],
          ),
        ],
      ),
    );
  }
}
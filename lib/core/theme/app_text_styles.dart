import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_colors.dart';

class AppTextStyles {
  /// Large Title
  static TextStyle heading1 = TextStyle(
    fontSize: 28.sp,
    fontWeight: FontWeight.bold,
    color: AppColors.textPrimary,
  );

  /// Section Title
  static TextStyle heading2 = TextStyle(
    fontSize: 22.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.textPrimary,
  );

  /// Subtitle
  static TextStyle subtitle = TextStyle(
    fontSize: 16.sp,
    fontWeight: FontWeight.w500,
    color: AppColors.textSecondary,
  );

  /// Body text
  static TextStyle body = TextStyle(
    fontSize: 14.sp,
    color: AppColors.textSecondary,
    letterSpacing: 0.25,
  );

  /// Small text
  static TextStyle caption = TextStyle(
    fontSize: 12.sp,
    color: AppColors.textLight,
  );

  /// Button text
  static TextStyle button = TextStyle(
    fontSize: 18.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.white,
  );

  /// Card text
  static TextStyle card = TextStyle(
    fontSize: 12.sp,
    fontWeight: FontWeight.w600,
    color: AppColors.primary,
  );
}

import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinKeyboard extends StatelessWidget {
  final Function(String) onKey;
  final VoidCallback onBackspace;

  const PinKeyboard({
    super.key,
    required this.onKey,
    required this.onBackspace,
  });

  /// NUMBER BUTTON
  Widget buildKey(String number) {
    return GestureDetector(
      onTap: () => onKey(number),

      child: Container(
        width: 70.w,
        height: 60.h,
        alignment: Alignment.center,

        child: Text(number, style: AppTextStyles.heading2),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,

      padding: EdgeInsets.symmetric(vertical: 24.h),

      decoration: BoxDecoration(
        color: AppColors.white,

        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppRadius.r32),
        ),
      ),

      child: Column(
        children: [
          /// ROW 1
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [buildKey("1"), buildKey("2"), buildKey("3")],
          ),

          AppSpacing.h32,

          /// ROW 2
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [buildKey("4"), buildKey("5"), buildKey("6")],
          ),

          AppSpacing.h32,

          /// ROW 3
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [buildKey("7"), buildKey("8"), buildKey("9")],
          ),

          AppSpacing.h32,

          /// ROW 4
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const SizedBox(width: 40),

              buildKey("0"),

              GestureDetector(
                onTap: onBackspace,

                child: Icon(
                  Icons.backspace_outlined,
                  size: 24.sp,
                  color: AppColors.grey,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

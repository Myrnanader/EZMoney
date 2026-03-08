import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PinDots extends StatelessWidget {

  final int length;
  final int filled;

  const PinDots({
    super.key,
    required this.length,
    required this.filled,
  });

  @override
  Widget build(BuildContext context) {

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,

      children: List.generate(length, (index) {

        bool isFilled = index < filled;

        return Row(
          children: [

            AnimatedContainer(
              duration: const Duration(milliseconds: 150),

              width: 14.w,
              height: 14.w,

              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: AppColors.grey),

                color: isFilled
                    ? AppColors.primary
                    : Colors.transparent,
              ),
            ),

            if (index != length - 1)
              AppSpacing.w16,

          ],
        );
      }),
    );
  }
}
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppDatePickerField extends StatelessWidget {

  final TextEditingController controller;
  final String label;
  final IconData icon;

  const AppDatePickerField({
    super.key,
    required this.controller,
    required this.label,
    required this.icon,
  });

  Future<void> _pickDate(BuildContext context) async {

    final now = DateTime.now();

    final date = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now,
      lastDate: DateTime(now.year + 10),

      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: AppColors.card,
            ),
          ),
          child: child!,
        );
      },
    );

    if (date != null) {
      controller.text =
          "${date.month.toString().padLeft(2, '0')}/${date.year.toString().substring(2)}";
    }
  }

  @override
  Widget build(BuildContext context) {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

        Text(label, style: AppTextStyles.caption),

        AppSpacing.h8,

        GestureDetector(

          onTap: () => _pickDate(context),

          child: Container(
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

                Icon(icon, color: AppColors.textSecondary),

                AppSpacing.w12,

                Expanded(
                  child: Text(
                    controller.text.isEmpty
                        ? "MM/YY"
                        : controller.text,
                    style: AppTextStyles.body,
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
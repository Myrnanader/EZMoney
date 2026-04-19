import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TransactionCard extends StatelessWidget {

  final String title;
  final String time;
  final String amount;
  final bool isIncome;
  final String status;

  const TransactionCard({
    super.key,
    required this.title,
    required this.time,
    required this.amount,
    required this.isIncome,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {

    return Container(
      padding: EdgeInsets.all(16.w),
      margin: EdgeInsets.only(bottom: 12.h),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.r20),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
          )
        ],
      ),

      child: Row(
        children: [

          CircleAvatar(
            radius: 22.r,
            backgroundColor: isIncome
                ? AppColors.success.withOpacity(.15)
                : AppColors.primary.withOpacity(.12),

            child: Icon(
              isIncome ? Icons.south_west : Icons.north_east,
              color: isIncome
                  ? AppColors.success
                  : AppColors.primary,
            ),
          ),

          AppSpacing.w12,

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                Text(title, style: AppTextStyles.subtitle),

                AppSpacing.h4,

                Text(time, style: AppTextStyles.caption),
              ],
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [

              Text(
                amount,
                style: AppTextStyles.subtitle.copyWith(
                  color: isIncome
                      ? AppColors.success
                      : AppColors.textPrimary,
                ),
              ),

              AppSpacing.h4,

              Container(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.w,
                  vertical: 4.h,
                ),

                decoration: BoxDecoration(
                  color: status == "Success"
                      ? AppColors.success.withOpacity(.15)
                      : AppColors.warning.withOpacity(.15),

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Text(
                  status,
                  style: AppTextStyles.caption.copyWith(
                    color: status == "Success"
                        ? AppColors.success
                        : AppColors.warning,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
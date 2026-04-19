import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletBalanceCard extends StatelessWidget {
  const WalletBalanceCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF214D84), Color(0xFF163B66)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.r24),
      ),

      child: Stack(
        children: [
          /// decorative circles
          Positioned(
            right: 12,
            top: 12,
            child: SizedBox(
              width: 40,
              height: 24,
              child: Stack(
                children: [
                  Positioned(
                    left: 0,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 14,
                    child: Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(.25),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Total Balance",
                style: AppTextStyles.caption.copyWith(color: Colors.white70),
              ),

              AppSpacing.h8,

              Text(
                "\$0.00",
                style: AppTextStyles.heading1.copyWith(color: Colors.white),
              ),

              AppSpacing.h24,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  /// wallet holder text
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "WALLET HOLDER",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white54,
                        ),
                      ),

                      AppSpacing.h4,

                      Text(
                        "NOT LINKED",
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  /// card chip
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      Container(
                        width: 44.w,
                        height: 30.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(
                            color: Colors.white.withOpacity(.35),
                          ),
                        ),
                      ),

                      Container(
                        width: 28.w,
                        height: 18.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6),
                          border: Border.all(
                            color: Colors.white.withOpacity(.35),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}

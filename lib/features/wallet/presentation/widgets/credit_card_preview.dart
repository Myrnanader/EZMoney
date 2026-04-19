import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CreditCardPreview extends StatelessWidget {
  const CreditCardPreview({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 190.h,
      padding: EdgeInsets.all(20.w),

      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [Color(0xFF2D5A92), Color(0xFF163B66)],
        ),
        borderRadius: BorderRadius.circular(AppRadius.r24),
      ),

      child: Stack(
        children: [
          /// الخلفية الدائرية
          Positioned(
            right: -60,
            top: -40,
            child: Container(
              width: 220,
              height: 220,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.05),
              ),
            ),
          ),

          Positioned(
            right: -40,
            top: -20,
            child: Container(
              width: 160,
              height: 160,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white.withOpacity(.06),
              ),
            ),
          ),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              /// top row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "EZMONEY PLATINUM",
                    style: AppTextStyles.caption.copyWith(
                      color: Colors.white70,
                      letterSpacing: 1.5,
                    ),
                  ),

                  /// Mastercard logo (متداخل)
                  SizedBox(
                    width: 44,
                    height: 24,
                    child: Stack(
                      children: [
                        Positioned(
                          left: 0,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.red,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),

                        Positioned(
                          left: 14,
                          child: Container(
                            width: 24,
                            height: 24,
                            decoration: const BoxDecoration(
                              color: Colors.orange,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),

              const Icon(Icons.wifi, color: Colors.white),

              Text(
                "•••• •••• •••• ••••",
                style: AppTextStyles.heading2.copyWith(
                  color: Colors.white,
                  letterSpacing: 3,
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "CARD HOLDER",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white54,
                        ),
                      ),

                      Text(
                        "YOUR NAME",
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        "EXPIRES",
                        style: AppTextStyles.caption.copyWith(
                          color: Colors.white54,
                        ),
                      ),
                      Text(
                        "00/00",
                        style: AppTextStyles.subtitle.copyWith(
                          color: Colors.white,
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

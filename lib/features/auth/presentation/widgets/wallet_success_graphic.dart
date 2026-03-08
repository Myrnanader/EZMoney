import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletSuccessGraphic extends StatelessWidget {
  const WalletSuccessGraphic({super.key});

  @override
  Widget build(BuildContext context) {

    return Stack(
      alignment: Alignment.center,
      children: [

        /// MAIN CIRCLE
        Container(
          width: 220.w,
          height: 220.w,

          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: AppColors.primary,

            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(255, 6, 2, 64)
                    .withValues(alpha: 0.5),
                blurRadius: 20,
                offset: const Offset(0, 10),
              )
            ],
          ),
        ),

        /// CHECK ICON
        Container(
          width: 80.w,
          height: 80.w,

          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),

          child: Icon(
            Icons.check,
            size: 60.sp,
            color: AppColors.primary,
          ),
        ),

        /// LEFT ICON
        Positioned(
          left: 0,
          bottom: 0,

          child: Container(
            width: 44.w,
            height: 44.w,

            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: AppColors.lightGrey,
            ),

            child: Icon(
              Icons.account_balance_wallet_outlined,
              size: 22.sp,
              color: AppColors.primary,
            ),
          ),
        ),

        /// RIGHT ICON
        Positioned(
          right: 0,
          top: 0,

          child: Container(
            width: 44.w,
            height: 44.w,

            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFFFF4D6),
            ),

            child: const Icon(
              Icons.star,
              color: Colors.amber,
              size: 22,
            ),
          ),
        ),
      ],
    );
  }
}
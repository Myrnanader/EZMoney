import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AuthIcon extends StatelessWidget {

  final IconData icon;

  const AuthIcon({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {

    return Container(
      width: 64.w,
      height: 64.w,

      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: BorderRadius.circular(16.r),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(.08),
            blurRadius: 10,
            offset: const Offset(0,4),
          )
        ],
      ),

      child: Center(
        child: Icon(
          icon,
          size: 28.sp,
          color: AppColors.white,
        ),
      ),
    );
  }
}
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class SuccessCheck extends StatelessWidget {
  const SuccessCheck({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160.w,
      height: 160.w,
      child: Stack(
        alignment: Alignment.center,
        children: [

          /// small dots
          Positioned(
            top: 20,
            right: 30,
            child: _dot(8),
          ),
          Positioned(
            left: 10,
            top: 70,
            child: _dot(10, opacity: .6),
          ),
          Positioned(
            bottom: 20,
            right: 50,
            child: _dot(6, opacity: .5),
          ),

          /// outer shadow circle
          Container(
            width: 110.w,
            height: 110.w,
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: AppColors.primary.withOpacity(.08),
                  blurRadius: 50,
                  spreadRadius: 20,
                ),
              ],
            ),
          ),

          /// main circle
          Container(
            width: 80.w,
            height: 80.w,
            decoration: const BoxDecoration(
              color: AppColors.primary,
              shape: BoxShape.circle,
            ),
            child: Icon(
              Icons.check_rounded,
              color: Colors.white,
              size: 38.sp,
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(double size, {double opacity = 1}) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.primary.withOpacity(opacity),
        shape: BoxShape.circle,
      ),
    );
  }
}
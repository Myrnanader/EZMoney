import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pinput/pinput.dart';

class OtpInput extends StatelessWidget {
  final void Function(String)? onCompleted;

  const OtpInput({super.key, this.onCompleted});

  @override
  Widget build(BuildContext context) {

    final defaultPinTheme = PinTheme(
      width: 56.w,
      height: 56.h,

      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(AppRadius.r16),
      ),
    );

    return Pinput(
      length: 6,
      defaultPinTheme: defaultPinTheme,
      onCompleted: onCompleted,
    );
  }
}
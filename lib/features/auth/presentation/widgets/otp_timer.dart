import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class OtpTimer extends StatelessWidget {

  final String time;

  const OtpTimer({super.key, required this.time});

  @override
  Widget build(BuildContext context) {

    return Text(
      "Resend in $time",
      style: AppTextStyles.caption,
    );

  }
}
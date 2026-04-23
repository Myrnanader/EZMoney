import 'dart:async';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class ResendOtpSection extends StatefulWidget {
  final VoidCallback onResend;

  const ResendOtpSection({
    super.key,
    required this.onResend,
  });

  @override
  State<ResendOtpSection> createState() => _ResendOtpSectionState();
}

class _ResendOtpSectionState extends State<ResendOtpSection> {
  int secondsRemaining = 60;
  Timer? timer;

  bool get isButtonEnabled => secondsRemaining == 0;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  void startTimer() {
    timer?.cancel();

    setState(() {
      secondsRemaining = 60;
    });

    timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (secondsRemaining == 0) {
        timer?.cancel();
      } else {
        setState(() {
          secondsRemaining--;
        });
      }
    });
  }

  String get formattedTime {
    final minutes = (secondsRemaining ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsRemaining % 60).toString().padLeft(2, '0');
    return "$minutes:$seconds";
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        /// TIMER TEXT
        Text(
          isButtonEnabled
              ? "You can resend now"
              : "Resend in $formattedTime",
          style: AppTextStyles.caption,
        ),

        const SizedBox(height: 8),

        /// RESEND BUTTON
        TextButton(
          onPressed: isButtonEnabled
              ? () {
                  widget.onResend();
                  startTimer(); //  restart timer
                }
              : null,
          child: Text(
            "Resend code",
            style: AppTextStyles.body.copyWith(
              color: isButtonEnabled
                  ? AppColors.primary
                  : Colors.grey,
            ),
          ),
        ),
      ],
    );
  }
}
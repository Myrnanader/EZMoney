import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';

class AuthHeader extends StatelessWidget {
  final String title;
  final String subtitle;

  const AuthHeader({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(title, textAlign: TextAlign.center, style: AppTextStyles.heading1),

        const SizedBox(height: 10),

        Text(subtitle, textAlign: TextAlign.center, style: AppTextStyles.body),
      ],
    );
  }
}

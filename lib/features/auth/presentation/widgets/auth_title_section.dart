import 'package:e_wallet/features/auth/presentation/widgets/auth_icon.dart';
import 'package:flutter/material.dart';

import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';

class AuthTitleSection extends StatelessWidget {

  final String title;
  final String description;
  final IconData icon;

  const AuthTitleSection({
    super.key,
    required this.title,
    required this.description,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {

    return Column(

      children: [

        AuthIcon(icon: Icons.wallet_outlined),
        AppSpacing.h24,

        Text(
          title,
          style: AppTextStyles.heading2,
        ),

        AppSpacing.h8,

        Text(
          description,
          textAlign: TextAlign.center,
          style: AppTextStyles.body,
        ),

      ],
    );
  }
}
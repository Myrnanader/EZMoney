import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:flutter/material.dart';

class SuccessHeader extends StatelessWidget {

  final String title;
  final String subtitle;

  const SuccessHeader({
    super.key,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {

    return Column(
      children: [

        AuthHeader(
          title: title,
          subtitle: subtitle,
        ),

        AppSpacing.h8,

      ],
    );
  }
}
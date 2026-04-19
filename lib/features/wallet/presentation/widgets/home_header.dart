import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeHeader extends StatelessWidget {
  const HomeHeader({super.key});

  @override
  Widget build(BuildContext context) {

    return Row(
      children: [

        CircleAvatar(
          radius: 22.r,
          backgroundImage:
              const NetworkImage("https://i.pravatar.cc/300"),
        ),

        AppSpacing.w12,

        Expanded(
          child: Text(
            "Hello, Ahmed",
            style: AppTextStyles.subtitle.copyWith(
              fontWeight: FontWeight.w600,
            ),
          ),
        ),

        _icon(Icons.search),

        AppSpacing.w8,

        _icon(Icons.notifications_none),
      ],
    );
  }

  Widget _icon(IconData icon) {
    return Container(
      width: 40.w,
      height: 40.w,
      decoration: BoxDecoration(
        color: AppColors.card,
        shape: BoxShape.circle,
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 10,
          )
        ],
      ),
      child: Icon(icon),
    );
  }
}
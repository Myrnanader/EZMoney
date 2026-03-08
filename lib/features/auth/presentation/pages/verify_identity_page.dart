import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_header.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:e_wallet/features/auth/presentation/widgets/security_badge.dart';
import 'package:e_wallet/features/auth/presentation/widgets/verify_otp_card.dart';

class VerifyIdentityPage extends StatelessWidget {
  const VerifyIdentityPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(title: ""),

      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            return SingleChildScrollView(
              padding: EdgeInsets.symmetric(horizontal: 24.w),

              child: ConstrainedBox(
                constraints: BoxConstraints(minHeight: constraints.maxHeight),

                child: IntrinsicHeight(
                  child: Column(
                    children: [
                      AppSpacing.h16,

                      /// ICON
                      Container(
                        width: 52.w,
                        height: 52.w,
                        decoration: const BoxDecoration(
                          color: AppColors.lightGrey,
                          shape: BoxShape.circle,
                        ),
                        child: Icon(
                          Icons.verified_user_outlined,
                          color: AppColors.primary,
                          size: 24.sp,
                        ),
                      ),

                      AppSpacing.h24,

                      /// HEADER
                      const AuthHeader(
                        title: "Verify your identity",
                        subtitle:
                            "We've sent a 6-digit verification code to your registered phone number ending in **** 4829.",
                      ),

                      AppSpacing.h32,

                      /// OTP CARD
                      const VerifyOtpCard(),

                      const Spacer(),

                      /// BADGE
                      const SecurityBadge(),

                      AppSpacing.h24,
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

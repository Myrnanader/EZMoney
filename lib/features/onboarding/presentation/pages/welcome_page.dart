import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:e_wallet/shared/widgets/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/theme/app_text_styles.dart';
import '../../../../core/theme/app_radius.dart';
import 'package:e_wallet/features/onboarding/presentation/widgets/welcome_logo.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Column(
            children: [
              AppSpacing.h48,

              const WelcomeLogo(),

              AppSpacing.h40,

              ClipRRect(
                borderRadius: BorderRadius.circular(AppRadius.r24),
                child: Image.asset(
                  "assets/images/welcome.png",
                  height: 260.h,
                  width: 320.w,
                  fit: BoxFit.cover,
                ),
              ),

              AppSpacing.h32,

              Text(
                "Your money.\nSimplified.",
                textAlign: TextAlign.center,
                style: AppTextStyles.heading1,
              ),

              AppSpacing.h12,

              Text(
                "Experience the future of premium fintech.\nManage, save, and invest with EZmoney.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),

              const Spacer(),

              PrimaryButton(
                text: "Get Started",
                onPressed: () {
                  context.go(RoutePaths.onboarding);
                },
              ),

              AppSpacing.h12,

              SecondaryButton(
                text: "Login",
                onPressed: () {
                  context.go(RoutePaths.login);
                },
              ),

              AppSpacing.h40,
            ],
          ),
        ),
      ),
    );
  }
}

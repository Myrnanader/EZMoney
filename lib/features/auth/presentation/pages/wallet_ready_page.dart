import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/security_verified_card.dart';
import 'package:e_wallet/features/auth/presentation/widgets/wallet_success_graphic.dart';

class WalletReadyPage extends StatelessWidget {
  const WalletReadyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Column(
            children: [
              /// HELP BUTTON
              Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                  onPressed: () {},
                  child: Text(
                    "Help",
                    style: AppTextStyles.body.copyWith(
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ),

              AppSpacing.h16,

              /// SUCCESS GRAPHIC
              const WalletSuccessGraphic(),

              AppSpacing.h32,

              /// TITLE
              Text("Your wallet is ready!", style: AppTextStyles.heading2),

              AppSpacing.h12,

              /// DESCRIPTION
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Text(
                  "Your account has been successfully\n"
                  "created. You can now start managing\n"
                  "your finances with EZmoney.",
                  textAlign: TextAlign.center,
                  style: AppTextStyles.body,
                ),
              ),

              AppSpacing.h48,

              /// SECURITY CARD
              const SecurityVerifiedCard(),

              const Spacer(),

              /// BUTTON
              PrimaryButton(
                text: "Continue to Home",
                onPressed: () {
                  context.go(RoutePaths.home);
                },
              ),

              AppSpacing.h16,

              /// SETTINGS TEXT
              AuthFooter(
                text: "Need to set up more? ",
                actionText: "Visit Settings",
                onPressed: () {
                  // navigate to settings
                },
              ),

              AppSpacing.h24,
            ],
          ),
        ),
      ),
    );
  }
}

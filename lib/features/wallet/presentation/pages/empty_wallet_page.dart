import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/wallet_balance_card.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class EmptyWalletPage extends StatelessWidget {
  const EmptyWalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),

          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppSpacing.h20,

              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 40.w,
                        height: 40.w,

                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: .08),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(Icons.person, color: AppColors.primary),
                      ),

                      AppSpacing.w12,

                      Text("Wallet", style: AppTextStyles.heading2),
                    ],
                  ),

                  /// notification button
                  Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(40),
                      onTap: () {},

                      child: Container(
                        width: 40.w,
                        height: 40.w,

                        decoration: BoxDecoration(
                          color: AppColors.primary.withValues(alpha: .08),
                          shape: BoxShape.circle,
                        ),

                        child: Icon(
                          Icons.notifications_none,
                          color: AppColors.primary,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              AppSpacing.h24,

              /// CARD
              const WalletBalanceCard(),

              AppSpacing.h32,

              /// EMPTY STATE
              Container(
                width: double.infinity,
                padding: EdgeInsets.all(24.w),

                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(24),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 20,
                      offset: Offset(0, 10),
                    ),
                  ],
                ),

                child: Column(
                  children: [
                    Container(
                      width: 70.w,
                      height: 70.w,

                      decoration: BoxDecoration(
                        color: AppColors.primary.withValues(alpha: .08),
                        shape: BoxShape.circle,
                      ),

                      child: Icon(
                        Icons.account_balance_wallet,
                        size: 32.sp,
                        color: AppColors.primary,
                      ),
                    ),

                    AppSpacing.h20,

                    Text("Your wallet is empty", style: AppTextStyles.heading2),

                    AppSpacing.h8,

                    Text(
                      "Add a payment method to start using \nEZmoney. You can link your bank \naccount or add a credit card.",
                      textAlign: TextAlign.center,
                      style: AppTextStyles.body,
                    ),

                    AppSpacing.h24,

                    PrimaryButton(
                      text: "Add Card",
                      icon: Icons.add_card,
                      onPressed: () {
                        context.push(RoutePaths.addCard);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

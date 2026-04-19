import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/balance_card.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/home_header.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/quick_service_card.dart';
import 'package:e_wallet/features/wallet/presentation/widgets/transaction_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WalletHomePage extends StatelessWidget {
  const WalletHomePage({super.key});

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

              const HomeHeader(),

              AppSpacing.h20,

              const BalanceCard(),

              AppSpacing.h24,

              Text("Quick Services", style: AppTextStyles.subtitle),

              AppSpacing.h16,

              SizedBox(
                height: 110.h,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    QuickServiceCard(
                      icon: Icons.people,
                      title: "Shared Wallet",
                      color: Colors.orange,
                      onTap: () {},
                    ),
                    AppSpacing.w12,
                    QuickServiceCard(
                      icon: Icons.savings,
                      title: "Gam'eya",
                      color: Colors.blue,
                      onTap: () {},
                    ),
                    AppSpacing.w12,
                    QuickServiceCard(
                      icon: Icons.receipt_long,
                      title: "Bills",
                      color: Colors.green,
                      onTap: () {},
                    ),
                    AppSpacing.w12,
                    QuickServiceCard(
                      icon: Icons.phone_android,
                      color: Colors.blue,
                      title: "Mobile",
                      onTap: () {},
                    ),
                  ],
                ),
              ),

              AppSpacing.h24,

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Recent Transactions", style: AppTextStyles.subtitle),

                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: AppTextStyles.caption.copyWith(
                        color: AppColors.primary,
                      ),
                    ),
                  ),
                ],
              ),

              AppSpacing.h16,

              Expanded(
                child: ListView(
                  children: const [
                    TransactionCard(
                      title: "Received Money",
                      time: "Today, 2:15 PM",
                      amount: "+\$200.00",
                      isIncome: true,
                      status: "Success",
                    ),

                    TransactionCard(
                      title: "Coffee House",
                      time: "Today, 9:41 AM",
                      amount: "-\$45.00",
                      isIncome: false,
                      status: "Pending",
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

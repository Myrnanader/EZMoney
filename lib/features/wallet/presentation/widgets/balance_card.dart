import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class BalanceCard extends StatefulWidget {
  const BalanceCard({super.key});

  @override
  State<BalanceCard> createState() => _BalanceCardState();
}

class _BalanceCardState extends State<BalanceCard> {
  bool isHidden = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: AppRadius.r30,
        top: AppRadius.r16,
        bottom: AppRadius.r16,
      ),

      decoration: BoxDecoration(
        color: AppColors.card,
        borderRadius: BorderRadius.circular(AppRadius.r24),
        boxShadow: const [
          BoxShadow(
            color: AppColors.shadow,
            blurRadius: 20,
            offset: Offset(0, 10),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Wallet Balance", style: AppTextStyles.subtitle),

          AppSpacing.h8,

          /// BALANCE ROW
          Row(
            children: [
              Text(
                isHidden ? "••••••" : "\$1,250.00",
                style: AppTextStyles.heading1,
              ),

              AppSpacing.w8,

              GestureDetector(
                onTap: () {
                  setState(() {
                    isHidden = !isHidden;
                  });
                },

                child: Icon(
                  isHidden
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  size: 20.sp,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),

          AppSpacing.h20,

          SizedBox(
            height: 70.h,

            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                _Action(
                  icon: Icons.credit_card,
                  title: "Add Card",
                  onTap: () {
                    context.push(RoutePaths.addCard);
                  },
                ),

                AppSpacing.w16,

                _Action(
                  icon: Icons.add,
                  title: "Add Money",
                  onTap: () {
                    context.push(RoutePaths.addCard);
                  },
                ),

                AppSpacing.w16,

                _Action(icon: Icons.send, title: "Send", onTap: () {}),

                AppSpacing.w24,

                _Action(
                  icon: Icons.qr_code_scanner,
                  title: "Scan",
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _Action extends StatelessWidget {
  final IconData icon;
  final String title;
  final VoidCallback onTap;

  const _Action({required this.icon, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,

      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(30),

        child: Column(
          children: [
            Ink(
              width: 46.w,
              height: 46.w,

              decoration: const BoxDecoration(
                color: AppColors.lightGrey,
                shape: BoxShape.circle,
              ),

              child: Icon(icon, color: AppColors.primary),
            ),

            AppSpacing.h8,

            Text(title, style: AppTextStyles.caption),
          ],
        ),
      ),
    );
  }
}

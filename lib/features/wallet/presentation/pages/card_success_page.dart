import 'dart:math';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_radius.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class CardSuccessPage extends StatefulWidget {
  const CardSuccessPage({super.key});

  @override
  State<CardSuccessPage> createState() => _CardSuccessPageState();
}

class _CardSuccessPageState extends State<CardSuccessPage>
    with TickerProviderStateMixin {
  late AnimationController circleController;
  late Animation<double> circleScale;

  late AnimationController floatingController;

  @override
  void initState() {
    super.initState();

    /// main circle animation
    circleController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 700),
    );

    circleScale = CurvedAnimation(
      parent: circleController,
      curve: Curves.easeOutBack,
    );

    /// floating icons animation
    floatingController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 4),
    )..repeat(reverse: true);

    circleController.forward();
  }

  @override
  void dispose() {
    circleController.dispose();
    floatingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Column(
            children: [
              AppSpacing.h24,

              /// HELP
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Help",
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),

              AppSpacing.h24,

              /// SUCCESS ANIMATION
              SizedBox(
                height: 260.h,
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    /// OUTER GLOW
                    Container(
                      width: 240.w,
                      height: 240.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(.08),
                      ),
                    ),

                    Container(
                      width: 200.w,
                      height: 200.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: AppColors.primary.withOpacity(.15),
                      ),
                    ),

                    /// MAIN CIRCLE
                    ScaleTransition(
                      scale: circleScale,
                      child: Container(
                        width: 160.w,
                        height: 160.w,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: AppColors.primary,
                        ),
                        child: Center(
                          child: Container(
                            width: 70.w,
                            height: 70.w,
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(
                              Icons.check_rounded,
                              color: AppColors.primary,
                              size: 38.sp,
                            ),
                          ),
                        ),
                      ),
                    ),

                    /// FLOATING ICONS
                    _floatingIcon(
                      icon: Icons.star,
                      color: Colors.amber,
                      angle: 20,
                      radius: 110,
                    ),

                    _floatingIcon(
                      icon: Icons.credit_card,
                      color: AppColors.primary,
                      angle: 140,
                      radius: 110,
                    ),

                    _floatingIcon(
                      icon: Icons.bolt,
                      color: Colors.lightBlue,
                      angle: 220,
                      radius: 110,
                    ),
                  ],
                ),
              ),

              AppSpacing.h32,

              /// TITLE
              Text(
                "Your card has been\nadded successfully.",
                textAlign: TextAlign.center,
                style: AppTextStyles.heading2.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),

              AppSpacing.h12,

              /// DESCRIPTION
              Text(
                "You're all set! Your new card is now\nready to use for payments and transfers\nwithin EZmoney.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),

              AppSpacing.h24,

              /// CARD PREVIEW
              Container(
                padding: EdgeInsets.all(16.w),

                decoration: BoxDecoration(
                  color: AppColors.card,
                  borderRadius: BorderRadius.circular(AppRadius.r20),
                  boxShadow: const [
                    BoxShadow(
                      color: AppColors.shadow,
                      blurRadius: 12,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),

                child: Row(
                  children: [
                    Container(
                      width: 50.w,
                      height: 36.h,
                      padding: const EdgeInsets.symmetric(horizontal: 6),
                      decoration: BoxDecoration(
                        color: const Color(0xFF0B1D39),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            left: 10,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xFFEB001B),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),

                          Positioned(
                            right: 10,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xFFF79E1B),
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    AppSpacing.w12,

                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("•••• 4242", style: AppTextStyles.subtitle),

                          Text(
                            "Primary Payment Method",
                            style: AppTextStyles.caption,
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.w,
                        vertical: 4.h,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.green.withOpacity(.15),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: const Text(
                        "ACTIVE",
                        style: TextStyle(
                          color: Colors.green,
                          fontWeight: FontWeight.w600,
                          fontSize: 11,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              /// ADD MONEY
              PrimaryButton(
                text: "Add Money",
                icon: Icons.add_circle_outline,
                onPressed: () {},
              ),

              AppSpacing.h16,

              /// DASHBOARD
              GestureDetector(
                onTap: () {
                  context.go("/home");
                },
                child: Text(
                  "Go to Dashboard",
                  style: AppTextStyles.subtitle.copyWith(
                    color: AppColors.primary,
                  ),
                ),
              ),

              AppSpacing.h32,
            ],
          ),
        ),
      ),
    );
  }

  /// floating icon widget
  Widget _floatingIcon({
    required IconData icon,
    required Color color,
    required double angle,
    required double radius,
  }) {
    return AnimatedBuilder(
      animation: floatingController,
      builder: (context, child) {
        final offset = sin(floatingController.value * 2 * pi) * 8;

        final dx = radius * cos(angle * pi / 180);
        final dy = radius * sin(angle * pi / 180);

        return Transform.translate(
          offset: Offset(dx, dy + offset),
          child: child,
        );
      },
      child: Container(
        width: 40.w,
        height: 40.w,
        decoration: BoxDecoration(
          color: color.withOpacity(.15),
          shape: BoxShape.circle,
        ),
        child: Icon(icon, color: color, size: 20),
      ),
    );
  }
}

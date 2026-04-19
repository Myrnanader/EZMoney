import 'dart:math';
import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/core/theme/app_text_styles.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class VerifyCardPage extends StatefulWidget {
  const VerifyCardPage({super.key});

  @override
  State<VerifyCardPage> createState() => _VerifyCardPageState();
}

class _VerifyCardPageState extends State<VerifyCardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();

    /// navigate after verification
    Future.delayed(
      const Duration(seconds: 2),
      () => context.go(RoutePaths.cardSuccess),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: const AppAppBar(title: "Verification"),

      body: SafeArea(
        child: Column(
          children: [
            const Spacer(),

            /// Animated Verification Circle
            SizedBox(
              width: 110.w,
              height: 110.w,
              child: AnimatedBuilder(
                animation: controller,
                builder: (context, child) {
                  return CustomPaint(
                    painter: _ArcPainter(controller.value),
                    child: Center(
                      child: Container(
                        width: 70.w,
                        height: 70.w,
                        decoration: BoxDecoration(
                          color: AppColors.card,
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: AppColors.divider,
                            width: 2,
                          ),
                        ),
                        child: Icon(
                          Icons.credit_card,
                          color: AppColors.textSecondary,
                          size: 28.sp,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            AppSpacing.h32,

            /// Title
            Text("Verifying your card...", style: AppTextStyles.heading2),

            AppSpacing.h12,

            /// Description
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.w),
              child: Text(
                "We're securely checking your card details with your bank. This usually takes a few seconds.",
                textAlign: TextAlign.center,
                style: AppTextStyles.body,
              ),
            ),

            const Spacer(),

            /// Secure Footer
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.lock, size: 16.sp, color: AppColors.textLight),

                AppSpacing.w8,

                Text(
                  "SECURE ENCRYPTED CONNECTION",
                  style: AppTextStyles.caption.copyWith(letterSpacing: 1),
                ),
              ],
            ),

            AppSpacing.h32,
          ],
        ),
      ),
    );
  }
}

class _ArcPainter extends CustomPainter {
  final double progress;

  _ArcPainter(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);

    final rect = Rect.fromCircle(center: center, radius: size.width / 2);

    final paint = Paint()
      ..color = AppColors.primary
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    final startAngle = progress * 2 * pi;
    const sweepAngle = pi * 0.9;

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

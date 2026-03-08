import 'package:e_wallet/features/auth/presentation/widgets/security_badge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_spacing.dart';
import '../../../../core/routing/route_paths.dart';
import 'package:e_wallet/features/splash/presentation/widgets/splash_loading.dart';
import 'package:e_wallet/features/splash/presentation/widgets/splash_logo.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..forward();

    Future.delayed(const Duration(seconds: 3), () {
      context.go(RoutePaths.welcome);
    });
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

      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),

        child: Column(
          children: [
            const Spacer(),

            /// LOGO
            const SplashLogo(),

            const Spacer(),

            /// LOADING
            SplashLoading(controller: controller),

            AppSpacing.h20,

            /// SECURITY BADGE
            SecurityBadge(),

            AppSpacing.h32,
          ],
        ),
      ),
    );
  }
}

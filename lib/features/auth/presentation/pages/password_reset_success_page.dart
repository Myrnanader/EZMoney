import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:e_wallet/shared/widgets/success_check.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/success_header.dart';

class PasswordResetSuccessPage extends StatelessWidget {
  const PasswordResetSuccessPage({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: AppColors.background,

      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),

          child: Column(
            children: [

              const Spacer(),

              /// SUCCESS ICON
              const SuccessCheck(),

              AppSpacing.h32,

              /// HEADER
              const SuccessHeader(
                title: "Password Reset \nSuccess!",
                subtitle: "Your password has been\nsuccessfully updated.",
              ),

              const Spacer(),

              /// BUTTON
              PrimaryButton(
                text: "Back to Login",
                onPressed: () {
                  context.go(RoutePaths.login);
                },
              ),

              AppSpacing.h32,

            ],
          ),
        ),
      ),
    );
  }
}
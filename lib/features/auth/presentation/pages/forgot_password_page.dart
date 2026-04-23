import 'package:e_wallet/core/routing/route_paths.dart';
import 'package:e_wallet/core/theme/app_colors.dart';
import 'package:e_wallet/core/theme/app_spacing.dart';
import 'package:e_wallet/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_title_section.dart';
import 'package:e_wallet/shared/widgets/app_appbar.dart';
import 'package:e_wallet/shared/widgets/app_snackbar.dart';
import 'package:e_wallet/shared/widgets/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:e_wallet/features/auth/presentation/widgets/auth_footer.dart';
import 'package:e_wallet/features/auth/presentation/widgets/forgot_password_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({super.key});

  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthOtpSent) {
          context.push(
            RoutePaths.otp,
            extra: {
              "email": emailController.text.trim(),
              "type": "reset",
            },
          );
        }
        if (state is AuthError) {
          AppSnackBar.show(context, message: state.message);
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.background,
        appBar: const AppAppBar(title: "Recovery"),
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
                        AppSpacing.h32,
                        const AuthTitleSection(
                          icon: Icons.restart_alt,
                          title: "Forgot Password?",
                          description:
                              "Enter your email or phone number\nand we'll send a code to reset\nyour password.",
                        ),
                        AppSpacing.h32,
                        ForgotPasswordForm(
                          controller: emailController,
                        ),
                        const Spacer(),
                        BlocBuilder<AuthCubit, AuthState>(
                          builder: (context, state) {
                            final isLoading = state is AuthLoading;
                            return PrimaryButton(
                              text: isLoading ? "Sending..." : "Send Reset Code",
                              onPressed: isLoading
                                  ? () {}
                                  : () {
                                      context.read<AuthCubit>().forgotPassword(
                                        emailController.text.trim(),
                                      );
                                    },
                            );
                          },
                        ),
                        AppSpacing.h24,
                        AuthFooter(
                          text: "",
                          actionText: "Back to Login",
                          onPressed: () => context.pop(),
                        ),
                        AppSpacing.h32,
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}